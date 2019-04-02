---
layout: post
title: "MuCluster raggiunge i 200 GFLOPS"
subtitle: "Siamo felici di annuciare che il MuCluster ha raggiunto i 200 gigaFLOPS di potenza! Nato quasi un anno fa, conta adesso 14 nodi di calcolo più nodo master di gestione."
categories: News
date: 2017-03-14
author: MrMoDDoM
header-img: /public/img/2017-03-14-mu-cluster-0.png
---

Circa un anno fa, MuHack è stato contattato del gruppo MotorSport UniBS per trovare una soluzione ai complessi problemi di simulazione aereodinamica che dovevano affrontare, i quali necessitavano di risorse che i normali calcolatori personali non potevano fornire.

Così è nata l'idea di montare un cluster computer per sopperire alle necessità di calcolo, non solo riducendo il tempo necessario per completare l'esecuzione, ma anche ampliando le possibilità di elaborazione!

Iniziarono così i primi lavori, prove e sperimentazioni con pochi nodi, da come installarli a come configurarli, come compilare ed eseguire applicativi parallelizzabili fino al monitoring e fine tuning delle risorse.

Arrivando infine ad oggi, dopo quasi un anno, MuCluster ha raggiunto i 200 gigaFLOPS di potenza (testato con la suite HPL 2.2). Festeggiamo con questa simulazione di aereodinamica del logo di MuHack!

![MuCluster](/public/img/2017-03-14-mu-cluster-1.png)

# Specifiche tecniche
Riportiamo qui alcune delle principali specifiche che caratterizzano MuCluster:

*  ***Hardware:*** 15 nodi - Intel - 4 GB ram - 250 GB HD - 10/100Mbit LAN
*  ***LAN:*** 10/100Mbit ethernet switch
*  ***OS:*** [Rocks 6.2](http://www.rocksclusters.org/wordpress/)
*  ***CFD SW:*** [Star CCM +](http://mdx.plm.automation.siemens.com/star-ccm-plus)
*  ***Message Passing:*** [OpenMPI](https://www.open-mpi.org/)
*  ***Linear Algebra SW:*** [OpenBLAS](http://www.openblas.net/)
*  ***Test Suite:*** [HPL](http://www.netlib.org/benchmark/hpl/)
