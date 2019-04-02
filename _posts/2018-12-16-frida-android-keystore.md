---
layout: post
title: "Estrarre KeyStore da app Android"
subtitle: "Tutti amiamo le chiavi private, giusto?"
category: Talks
date: 2019-02-15
author: ceres-c && dr-marco
header-img: /public/img/2019-02-12-frida-android-keystore-script_example.jpg
---

> _This post is available in english [here](http://ceres-c.it/frida-android-keystore/)_

L'SSL pinning è ormai presente in quasi ogni applicazione android, ma può essere facilmente aggirato mediante [moduli Xposed][1] o [script Frida][2] (Frida sarà spiegato più avanti).

Cosa dovrebbe dunque fare uno sviluppatore se volesse assicurarsi che i dati non vengano modificati nel tragitto da client a server o viceversa?

# SSL (TLS) e SSL Pinning #
Prima di tutto una breve spiegazione di SSL e SSL pinning. Chi è già familiare con questo argomento può passare direttamente al prossimo capitolo, non ci sarà nulla di nuovo per lui.

SSL (Secure Sockets Layer) è un protocollo creato per garantire una connessione criptata tra utente (che può essere un'app o un browser) e server. SSL risale al 1995 ed è stato ritirato dal 2015, sostituito da TLS, ma spesso si utilizza ancora il nome SSL, cosa che avverrà da qui in avanti. SSL assicura che tutti i dati trasmessi dal client al server (e viceversa) rimangano privati e intatti.

SSL può essere ritenuto sicuro ([abbastanza sicuro][3]), ma non risolve il sottostante [_Problema di Distribuzione delle Chiavi_][4]. Se si vuole esser certi che nessuno stia facendo un attacco MITM e installando i suoi certificati si esegue un pin della chiave pubblica dell'host. Nel caso in cui si riceva una chiave differrente da quella attesa, probabilmente qualcuno si trova tra il client e il server, dunque la comunicazione viene interrotta.

<figure><a href="{{ site.url }}/public/img/2019-02-12-frida-android-keystore-burp_alerts_no_unpin.jpg"><img src="{{ site.url }}/public/img/2019-02-12-frida-android-keystore-burp_alerts_no_unpin.jpg" alt="Errore in BurpSuite quando un certificato è pinnato"></a><figcaption>Errore in BurpSuite quando un certificato è pinnato</figcaption></figure>

Utilizzando uno dei metodi linkati all'inizio di questo post dovrebbe diventare possibile leggere il traffico mediante un qualsiasi strumento di sniffing.

# Cerificati lato client #
Quando uno sviluppatore vuole essere __assolutamente__ certo nessuno legga i dati può integrare dei certificati nell'app e configurare il server per richiedere quei certificati durante l'esecuzione del TLS handshake. Questa procedura viene spiegata a fondo sul [sito IBM][5].

Lo sviluppatore può inoltre nascondere il certificato da qualche parte nell'app, plausibilmente come Java KeyStore file (.jks) con password per l'apertura. A sua volta, la password potrebbe essere nascosta con qualche metodo come il (non più mantenuto) progetto [Cipher.so][6].

Tutti questi accorgimenti sono probabilmente sufficienti per fermare a un attaccante non sufficientemente motivato, poichè questo dovrebbe trovare dove il KeyStore è stato salvato, ottenere la password mediante reverse engineering e trovare un modo per estrarre i dati in un formato utilizzabile (PKCS12, probabilmente).

Qui è dove Frida entra in gioco.

# Strumentazione dinamica del codice #
[Frida][7] è uno strumento che dà la possibilità di collegarsi a classi Java (in questo caso particolare) e modificare i metodi a runtime.<br>Dinamicamente.<br>Con JavaScript.

Sì, __*è*__ esattamente magico quanto sembra dalla descrizione.

Con la potenza della strumentazione dinamica si può modificare il software per fargli fare qualsiasi cosa si voglia. È possibile, ad esempio, estrarre i parametri con cui una funzione viene stata chiamata, ridurre la sicurezza al volo (modificando una funzione di signature check) o utilizzare pezzi di codice (firmando messaggi manomessi con la funzione di firma originale per farli accettare dal server). [Brida][8] è un buon esempio di come questi strumenti possano facilitare la vita.

# Mettere insieme i pezzi #
I KeyStore Android hanno un metodo `load` utilizzato per instanziare un keystore con alcuni dati e supporta overloading in questi due metodi:
- `load(KeyStore.LoadStoreParameter param)`
- `load(InputStream stream, char[] password)`

L'app su cui stavo lavorare faceva uso del secondo metodo con oggetto jks passato come stream, perciò il mio codice è strutturato per questo scenario. Il metodo in uso accetta inoltre un array di caratteri come password per aprire il keystore, ciò significa che, a prescindere da quanto la password venga criptata per nasconderla nell'apk, essa è disponibile in memoria in plaintext. Il che è perfetto, in quanto si può evitare il reverse engineering di qualche strana [crittografia white box][9].

Frida ci aiuta nella scelta del metodo da modificare grazie ad un suo metodo `overload`.

[Questo è lo script risultante][10].

### Come funziona ###
Ignorerò il codice python che è solo un wrapper per la gestione, proseguiamo con il codice javascript che viene iniettato nell'app.


```javascript
setTimeout(function() {
    Java.perform(function () {
        keyStoreLoadStream = Java.use('java.security.KeyStore')['load'].overload('java.io.InputStream', '[C');

        /* following function hooks to a Keystore.load(InputStream stream, char[] password) */
        keyStoreLoadStream.implementation = function(stream, charArray) {

            /* sometimes this happen, I have no idea why, tho... */
            if (stream == null) {
                /* just to avoid interfering with app's flow */
                this.load(stream, charArray);
                return;
            }

            /* just to notice the client we've hooked a KeyStore.load */
            send({event: '+found'});

            /* read the buffer stream to a variable */
            var hexString = readStreamToHex (stream);

            /* send KeyStore type to client shell */
            send({event: '+type', certType: this.getType()});

            /* send KeyStore password to client shell */
            send({event: '+pass', password: charArray});

            /* send the string representation to client shell */
            send({event: '+write', cert: hexString});

            /* call the original implementation of 'load' */
            this.load(stream, charArray);

            /* no need to return anything */
        }
    });
},0);

/* following function reads an InputStream and returns an ASCII char representation of it */
function readStreamToHex (stream) {
    var data = [];
    var byteRead = stream.read();
    while (byteRead != -1)
    {
        data.push( ('0' + (byteRead & 0xFF).toString(16)).slice(-2) );
                /* <---------------- binary to hex ---------------> */
        byteRead = stream.read();
    }
    stream.close();
    return data.join('');
}
```
>`setTimeout`

È una funzione Frida per eseguire codice dopo 0 ms
>`Java.perform`

Esegue codice Java nel Java Runtime di Frida

>`Java.use('java.security.KeyStore')['load'].overload('java.io.InputStream', '[C');`

Scegliamo qual è la classe a cui vogliamo collegarci (`java.security.KeyStore`) e quale metodo di questa classe (`load`). Successivamente, specifichiamo che abbiamo bisogno del metodo che riceve un InputStream e un Char come ingressi. Questo metodo sarà referenziato tramite la variabile `keyStoreLoadStream`.

>`keyStoreLoadStream.implementation = function(stream, charArray)`

Una volta selezionato il metodo specifichiamo cosa vogliamo fare con quest'ultimo: vogliamo cambiare l'implementazione con una nostra funzione personalizzata. `stream` e `charArray` sono parametri formali a cui si può far riferimento dall'interno della funzione.

>`readStreamToHex (stream);`

Il parametro `stream` è passato a `readStreamToHex` la quale usa la funzione Java `read()` per leggere il tutti i byte dello stream, fino a quando non si riceve errore (`byteRead !=-1`). I byte vengono uno a uno convertiti nella loro controparte esadecimale ASCII e inseriti in un array che sarà unito e ritornato alla funzione chiamante al termine della lettura.

>```javascript
>send({event: '+type', certType: this.getType()});
>send({event: '+pass', password: charArray});
>send({event: '+write', cert: hexString});
>```

Terminata la lettura dello stream usiamo `this.getType()` di Java per ottenere il formato del certificato, il risultato viene passato al client per informare l'utente. Se il tipo è PKCS12 l'estensione viene impostata a .jks nel client.<br>
La password e la rappresentazione ASCII dell'InputStream sono ora passati al client e lo stream viene scritto su file.

>`this.load(stream, charArray);`

Come ultimo passaggio la vera implementazione di `load` viene chiamata con i parametri originali cosicchè il flusso dell'app non venga interrotto e il certificato venga effettivamente caricato nel keystore.

# Risultati #
Per prima cosa si deve scaricare frida ed eseguire `./frida-server &` sul dispositivo obiettivo, poi va eseguito lo script sul computer e si dovrebbe ottenere qualcosa di simile a questo

<figure><a href="{{ site.url }}/public/img/2019-02-12-frida-android-keystore-script_example.jpg"><img src="{{ site.url }}/public/img/2019-02-12-frida-android-keystore-script_example.jpg" alt="Esempio di output dello script"></a><figcaption>Esempio output dello script</figcaption></figure>

Ora abbiamo un'entità keystore salvata sull'hard disk lato client. Questa entità è (probabilmente, con il codice attuale) un file jks che dovrebbe essere convertito in un certificato binario pkcs12 per essere utilizzato con altri strumenti. La conversione può esser eseguita con keytool, parte della Java SDK (potrebbe essere rilasciato anche insieme alla JRE, ma non sono sicuro).

```bash
keytool -keystore keystore0.jks -list
keytool -importkeystore -srckeystore keystore0.jks -destkeystore dest_pkcs12_crt.p12 -deststoretype PKCS12 -srcalias CERT_ALIAS -deststorepass YOURPASS -destkeypass YOURPASS
```

Il primo comando darà una lista di alias disponibili nel keystore. Questi vanno forniti uno ad uno al secondo comando per estrarre tutti i certificati. Ci sarà bisogno di specificare una password per il cerificato appena creato.

<figure><a href="{{ site.url }}/public/img/2019-02-12-frida-android-keystore-burp_traffic_sniff.jpg"><img src="{{ site.url }}/public/img/2019-02-12-frida-android-keystore-burp_traffic_sniff.jpg" alt="Traffico in chiaro"></a><figcaption>Il traffico, finalmente in chiaro</figcaption></figure>

Profit.

[1]:	https://github.com/Fuzion24/JustTrustMe
[2]:	https://techblog.mediaservice.net/2017/07/universal-android-ssl-pinning-bypass-with-frida/
[3]:	https://tools.ietf.org/html/rfc7457
[4]:	https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning#Patient_0
[5]:	https://www.ibm.com/support/knowledgecenter/en/SSFKSJ_7.1.0/com.ibm.mq.doc/sy10660_.htm
[6]:	https://github.com/MEiDIK/Cipher.so
[7]:	https://www.frida.re/
[8]:	https://github.com/federicodotta/Brida
[9]:	http://www.whiteboxcrypto.com/
[10]:	https://gist.github.com/ceres-c/cb3b69e53713d5ad9cf6aac9b8e895d2
