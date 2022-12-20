---
layout: post
title: "Custom Muhack sticker"
subtitle: "Come creare e far stampare in pochi passi il tuo sticker Muhack personalizzato"
categories: Talks
date: 2022-12-20
author: dr-marco
header-img: /public/img/2022-12-20-inkscape-with-logo.png
---


Attaccare adesivi sul proprio computer è una delle cose che accomunano tutte le persone all'interno di un hackerspace e in questo Muhack non fa eccezione. Sono molti gli stickers che si possono ritrovare, da eventi hacker a associazioni sportive e non, da meme bellissimi a luoghi e locali visitati. E molto spesso si possono vedere adesivi disegnati e stampati dagli stessi proprietari del pc.

Anche Muhack ha più volte stampato adesivi da attaccare nei posti più disparati, da banalmente i pc degli associati alle varie città di mezza Europa. Quindi quando siete in giro fateci caso, potreste imbattervi in qualcuno!

<figure><a href="{{ site.url }}public/img/2022-12-20-muhack-sticker-porto.jpg"><img src="{{ site.url }}public/img/2022-12-20-muhack-sticker-porto.jpg" alt="Adesivo Muhack in quel di Porto"></a><figcaption>Adesivo Muhack in quel di Porto</figcaption></figure>

E se volete, in associazione è possibile richiedere stickers classici da attaccare sul vostro computer oppure se dovete prepararvi per la vostra spedizione fuori porta. Insomma, spargere gli adesivi Muhack in nuove città è sempre ben accetto e incoraggiato.

# Creare il proprio design con Inkscape #

Anche se il logo nero, classico, Muhack è molto bello, qualcuno potrebbe voler osare con il design e scegliere qualche colore particolare e alleviare il proprio prurito artistico. Ebbene, __potete farlo!__ Infatti sul repository github [muhack_svg][1] sono disponibili file in formato vettoriale che possono essere scaricati liberamente, non solo il logo utilizzato per gli sticker ma anche i vettoriali della mascotte Hax, altre versioni del logo e pattern utilizzabili come sfondi chat, fondo locandine, et cetera... 

Nel nostro caso utilizzeremo il file `logo_sticker_mule.svg` all'interno della cartella `loghi` presente nel repo. Potete aprire il file con qualsiasi programma supporti i file vettoriali, in questo caso farò affidamento a [Inkscape][3]

<figure><a href="{{ site.url }}public/img/2022-12-20-inkscape-with-logo.png"><img src="{{ site.url }}public/img/2022-12-20-inkscape-with-logo.png" alt="Schermata di Inkscape con il logo Muhack"></a><figcaption>Schermata di Inkscape con il logo Muhack</figcaption></figure>

Aprendo il file possiamo vedere importato il nostro bellissimo logo, in questo caso in versione cyberpunk, ovvero con il contorno, la scritta e il simbolo nero e il fondo giallo ripreso dal famoso videogioco. Il logo è composto da 3 "oggetti" principali:
- `scritta` : la piccola scritta muhack sotto il simbolo µh
- `fondo` : il fondo interno del logo
- `lettere___bordo` : il bordo esterno e le lettere µh

È possibile vedere gli elementi nel layer 1 e per visualizzare il pannello dei layer cliccare `Livello->Livelli e Oggetti...` (nel caso di inkscape in italiano, in inglese guardate la relativa traduzione). 
Per cambiare il colore di questi oggetti basta aprire il pannello `Oggetto->Riempimento e colori...` e selezionato l'oggetto molto semplicemente scegliere il nuovo colore. 

Invito inolte ad approfondire l'utilizzo di Inkscape e, magari, al posto di utilizzare colori a tinta unita sperimentate con gradienti oppure inserendo delle immagini per il fondo.
Il mio consiglio poi è quello di non modificare la forma di questi elementi ma solo i loro colori. Se invece avete più dimestichezza nel lavorare con i vettoriali lascio la parola alla vostra creatività. 

Una volta finito con i colori è giunto il momento di esportare il file ad alta risoluzione. Per farlo basta cliccare in `File->Esporta...` e impostare i `DPI` a un valore abbastanza elevato, ad esempio 500 va più che bene, e scegliere titolo e formato file, ad esempio `.png`. Il file è configurato con una dimensione 76 mm sia in larghezza che in altezza: se volete stampare gli adesivi con il metodo descritto nella prossima sezione mantenete queste dimensioni.


# Stampare il proprio sticker personalizzato #

Ok, ma come faccio a stampare gli adesivi che ho appena creato? E mi costeranno una fortuna farli stampare?
Tranquilli, molto spesso è possibile usufruire di una promozione da parte di [sticker mule][2] che vi permette di stampare una decina di adesivi a 1 solo euro, spedizione inclusa. La promozione è ciclica e a volte potrebbe non essere disponibile. In genere vi conviene fare una breve ricerca su Google (es. "sticker mule 1€") per vedere se la promo è attiva. Nota: la promo di solito è valida come primo acquisto sul sito, quindi per più ordini sarà necessario avere più account.

Per effettuare l'ordine bisogna innanzitutto registrarsi al sito tramite un indirizzo mail e un numero di telefono per la verifica. Una volta registrati è possibile usufruire della promozione dove basterà inserire il file appena estratto. Caricato il file e inserito un indirizzo di spedizione e modalità di pagamento è possibile procedere con l'ordine. Dopo aver confermato l'ordine riceverete una mail chiedendovi l'approvazione della stampa: in questo caso potete vedere una specie di anteprima di come risulteranno gli stickers e nel caso siano a posto si può procedere con l'approvazione e la stampa.

Gli adesivi possono metterci una settimana da quando vengono ordinati prima di arrivare a casa. In questo caso armatevi di pazienza ma una volta ricevuti potrete finalmente avere in mano il vostro adesivo personalizzato.

Un mio ultimo consiglio: portate i vostri adesivi in associazione e scambiateli con quelli di altri associati oppure banalmente lasciate gli stickers che non vi servono in Muhack. Magari qualcun altro potrà apprezzare il vostro lavoro e attaccarli al proprio pc. 

<figure><a href="{{ site.url }}public/img/2022-12-20-custom-sticker.jpg"><img src="{{ site.url }}public/img/2022-12-20-custom-sticker.jpg" alt="Stickers Muhack"></a></figure>

Insomma, divertitevi a personalizzare il logo Muhack con lo stile che più vi piace. Sicuramente ne uscirà qualcosa di bello!




[1]:    https://github.com/muhack/muhack_svg
[2]:    https://www.stickermule.com/it
[3]:    https://inkscape.org/it/
