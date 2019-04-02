---
layout: post
title: "Collegare un Raspberry pi zero ad un pc tramite ssh sulla porta USB"
subtitle: ""
categories: Talks
date: 2018-02-05
author: "Federico Giardini"
header-img: https://www.raspberrypi.org/app/uploads/2017/05/Raspberry-Pi-Zero-1-1755x1080.jpg
---


# Collegare un Raspberry pi zero ad un pc tramite ssh sulla porta USB


Qualche giorno fa mi sono ritrovato a dover progettare un dispositivo *headless* (ovvero senza display e senza periferiche di input) basato su un Raspi (abbreviativo di Raspberry Pi) zero [vedi immagine sotto], che, come è noto, non possiede porte ethernet "fisiche", ma solo 2 porte micro USB (di cui una solo per l'alimentazione), una micro HDMI, le due porte proprietarie per la Raspi cam e per il display ed i classici GPIO di tutti i Raspberry, nient'altro.

![Un Raspberry zero](https://www.raspberrypi.org/app/uploads/2017/05/Raspberry-Pi-Zero-1-1755x1080.jpg)

Come fare, quindi, per poter **stabilire una connessione SSH** (Secure SHell, ovvero un terminale remoto) con il mio pc Windows?
Fortunatamente il Raspi zero possiede comunque una **scheda di rete**, integrata nel SoC, che permette di **usare sulla porta USB** disponibile una connessione di rete (anche ad internet, volendo).

Ecco i passi necessari per riuscire a stabilire una connessione SSH tra il **Raspi zero ed un pc**:

1. **Flashare l'ultima versione di raspbian** (è il sistema operativo ufficiale supportato dal raspberry, è basato su Debian, una distro Linux) 
 - scaricate raspbian [qui](https://www.raspberrypi.org/downloads/raspbian/), troverete 2 versioni: una completa ed una senza l'interfaccia grafica, scegliete quella che volete. Dovrebbero essere 2 file: un archivio zip ed un file di una immagine del sistema operativo. 
 - scaricate [Etcher](https://etcher.io) (è il migliore burner di immagini che conosca), serve a formattare correttamente la scheda microsd del raspberry ed a caricarci il sistema operativo.  
 - con Etcher selezionate la vostra scheda sd ed il file zip di raspbian (non serve decomprimerlo), ed eseguite la scrittura (dovrebbe impiegarci circa 10 minuti). 
 - Estrarre e reinserire la scheda sd, dato che Etcher la smonta in automatico una volta terminata la formattazione.

2. Adesso dovremo **modificare alcuni file** presenti nella cartella "boot" della scheda micro sd per convincere il Raspi zero ad **usare la porta USB come una ethernet**: 
 - selezionate il file cmdline.txt e dopo la parola rootwait aggiungete uno spazio e copiate la stringa
  ` modules-load=dwc2,g_ether ` esattamente così com'è (non ci deve essere lo spazio dopo la virgola). In questo file i separatori sono gli spazi bianchi, assicuratevi che sia tutto su una sola linea (disattivate il "word wrap" del blocco note) 
 - selezionate il file "config.txt", dopo l'ultima riga andate a capo e copiate la stringa
  `dtoverlay=dwc2` (in questo file i separatori sono i caratteri "newline") ![](https://lh3.googleusercontent.com/sGjP09KngKVjCIdkopu9piT12WyU8BoVIgpffcXuW7EYHYaTwTFUygy3da8qyIpWxHpqplSM81FF)
 - Adesso dobbiamo **abilitare l'SSH sul Raspi**, dato che dalle ultime versioni, per motivi di sicurezza, è stato disabilitato di default. Per farlo andate sempre nella cartella di boot e create un file SENZA ESTENSIONE chiamato ssh. Questo file verrà cancellato al primo avvio del Raspi e serve a riabilitare la connessione SSH lato Raspi. 
![](https://lh3.googleusercontent.com/zfDAgJV9SYH4UFcNmMix9NcKEbFnI_3eRN_OenNxsfUpRBhvdDH2c6KpGb5-zVoT5wzsp29CzvH8)
3. Bene, lato raspberry abbiamo finito, adesso è il momento di **metterlo in comunicazione con Windows**: 
 - installate i **servizi di stampa Bonjour** (servono per la comunicazione ssh). Li trovate [qui](https://support.apple.com/kb/dl999?locale=it_IT).
 - Inserite la scheda sd e collegate il raspberry tramite la porta USB, date tempo al Raspi di avviarsi (circa 90 secondi), aprite putty (che trovate [qui](https://www.putty.org/)) e nella barra indirizzo digitate `pi@raspberrypi.local` assicurandovi di aver spuntato "ssh" sul radio button e avere selezionato la porta 22. ![](https://lh3.googleusercontent.com/xrqxtPXomLQcEWsm5hzxyiAioDbFkJolCVF1FNfaV4MltN9UQuA76M_12vTE9s0YVPlNb05-DZGZ)
 
4. Adesso possono succedere 2 cose:
 - Vi si apre il terminale del Raspi con l'utente pi (se è la prima volta che avviate il raspberry e non avente modificato nient'altro la **password è `raspberry`** ) ![enter image description here](https://lh3.googleusercontent.com/bN1tinARH13eC2ZxWLOX5wAy-YvQbR7XPAPyuFHb0Xw5eUH9xSykAY_xzpyfow0Og1BjrGd94qi1)
 - Putty vi restituisce una schermata di **errore come questa** ![](https://lh3.googleusercontent.com/A8PrL9mUbp9oqmzVDpY-Tl3Jvsp3iQU5ppLTWDGC1HtxfyADscSFAHbvOFPI-0cpDWJjwNJWgSPR)

Nel caso di errore preparatevi perchè c'è **parecchio da smanettare** tra driver e _windows che fa lo **sgargiullo**_, procediamo con ordine.

1. Aprite la "gestione dispositivi" di windows 
![enter image description here](https://lh3.googleusercontent.com/YSv_kVAmFrwv9lkBoOvvIbExNdYkNB1JmgP7M0Q6KPBedJydYnlUMhx2vZRI5B3qz0nmSJtyXCNC)
 
2. Verificate che non ci sia un dispositivo **non riconosciuto**, viene segnalato da un triangolo giallo di errore.

3. Se si verifica proviamo la prima strada:
 - click destro sul dispositivo>
 - aggiorna driver>
 - cerca nel computer>
 - scegli da un elenco di driver disponibili>
 - sul lato sinistro selezionate microsoft>
 - sul lato destro selezionate dispositivo RNDIS e cliccate ok

 **Se siete fortunati questo dovrebbe bastare** a correggere i driver e far riconoscere il Raspi come dispositivo USB Ethernet/RNDIS Gadget. 

**Se neanche questo basta usiamo driver alternativi.**
 
Scaricate [questo pacchetto](domotique.caron.ws/wp-content/uploads/telechargement/RPI%20Driver%20OTG.zip), decomprimetelo, poi ripetete la procedura precedente con alcune modifiche:

 - gestione dispositivi>
 - click destro sul dispositivo>
 - aggiorna driver>
 - cerca nel computer>
 - selezionate la cartella che avete appena decompresso ed installate i driver. 

 **Adesso dovremmo esserci.**

_NB: occhio che Windows (soprattutto il 10) è un birbantello e può essere necessario ripetere l'installazione dei driver._


Bene! adesso ripetete la procedura di log in con putty e dovremmo essere a cavallo!

*Happy Hacking!*


_Federico Giardini_




<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU4MTk2ODA2MF19
-->
