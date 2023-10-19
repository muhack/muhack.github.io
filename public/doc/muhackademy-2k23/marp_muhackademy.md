---
marp: true
title: Marp_muhackademy
theme: colors
class:  lead-invert-purple 
math: mathjax
paginate: false
---
<!--_backgroundColor: #454D71 -->

![bg 90% hue-rotate:45deg saturate](https://muhack.org/public/img/2023-05-29-muhackademy-school.png)

![bg 90% hue-rotate:225deg saturate](https://muhack.org/public/img/2023-05-29-muhackademy-school.png)

![bg 90% hue-rotate:135deg saturate](https://muhack.org/public/img/2023-05-29-muhackademy-school.png)

![bg 90% hue-rotate:315deg saturate](https://muhack.org/public/img/2023-05-29-muhackademy-school.png)

---

<!--class: lead-invert --> 

![width:15em](https://marp.app/assets/marp.svg) 

## <span style="color:lightcoral">M</span>a <span style="color:lightcoral">A</span>ncora <span style="color:lightcoral">R</span>icorri a <span style="color:lightcoral">P</span>owerpoint?

16 Ottobre 2023 - UniBs

---

<!--class: lead-green --> 

## **Sì, perché me lo chiedi? Lasciami stare** 

No, invece _dobbiamo_ creare delle slide semplici e in poco tempo per la nostra presentazione

### Quali programmi usare?


![bg right:40% 80%](https://raw.githubusercontent.com/muhack/muhack_svg/master/hax/hax-hack-color.svg)

---

# **Powerpoint**

![width:30em](https://www.lifewire.com/thmb/5jvwgpTyPYlWJ-etb9YvQlnjkk0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Capture-5c046ac5c9e77c0001abb529.JPG)

---
# **Latex Beamer**
![width:24em](https://latex-beamer.com/wp-content/uploads/2021/08/Title-page.webp)

---

![bg 110% blur](https://i.ytimg.com/vi/Of33sOpMQs0/maxresdefault.jpg)

---

![bg 110%](https://i.ytimg.com/vi/Of33sOpMQs0/maxresdefault.jpg)

---

<!--class: lead-invert-green --> 

## **Esiste una via di mezzo?**


![bg right:55% 88%](https://haxed.it/artwork/18.png)

---

<!--class: lead-green --> 

![width:12em](https://marp.app/assets/marp.svg) 

## **Markdown Presentation Ecosystem**


a.k.a. Scrivere slide in codice **Markdown**

---

# **Markdown**

Linguaggio di markup per scrivere in modo veloce pagine web, file README.md e nel nostro caso diapositive 

![height:3in](https://resources.jetbrains.com/help/img/idea/2023.2/markdown-code-blocks.png)

---


# **Come scrivere con Marp** 

:computer: Quali tools esistono per preparare le presentazioni?

* [Marp CLI](https://github.com/marp-team/marp-cli)
* Estensione Marp per [vscode](https://github.com/marp-team/marp-vscode) 
    * molto più comodo
    * permette di avere un'anteprima live delle slide durante la scrittura

* :heavy_plus_sign: Marp demo sul sito [web.marp.app](https://web.marp.app)

---

## **Creare un file presentazione Marp**

```markdown
    ---
    marp: true
    title: Titolo_presentazione

    ---

    # TITOLO

    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
```

---

## **Cosa si può fare?**

* Scrivere _testo_ :pencil:

* Inserire _immagini_ :camera:

* Creare _tabelle_ :bar_chart:

* Inserire _gif_ :video_camera:

* Inserire risorse da internet con _link ipertestuali_ :globe_with_meridians:
* e molto altro...
![bg left:48% 90%](https://haxed.it/artwork/10.png)


---

## **Temi**

È possibile decidere a inizio file il tema tra quelli disponibili impostando:

```markdown
    theme: nome_tema
```

La maggior parte dei temi ha all'interno delle varianti di stile impostando, anche per singola slide:

```markdown
    <!-- class: nome_stile-->
```

---

<!-- class: green -->

## Tema stile **default**

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sollicitudin molestie leo sed pharetra. Donec ut tellus elementum, viverra velit id, fringilla elit. Phasellus *fermentum* egestas **sapien** in ***interdum***. 

![width:15em](https://haxed.it/artwork/4.png)

---

<!-- class: lead-green -->

## Tema stile **lead**

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sollicitudin molestie leo sed pharetra. Donec ut tellus elementum, viverra velit id, fringilla elit. Phasellus *fermentum* egestas **sapien** in ***interdum***. 

![width:15em](https://haxed.it/artwork/11.png)

---

<!-- class: invert-green -->

## Tema stile **invert**

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sollicitudin molestie leo sed pharetra. Donec ut tellus elementum, viverra velit id, fringilla elit. Phasellus *fermentum* egestas **sapien** in ***interdum***. 

![width:15em](https://haxed.it/artwork/2.png)

---

<!-- class: lead-invert-green -->

## Tema stile **lead-invert**

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sollicitudin molestie leo sed pharetra. Donec ut tellus elementum, viverra velit id, fringilla elit. Phasellus *fermentum* egestas **sapien** in ***interdum***. 

![width:18em](https://haxed.it/artwork/5.png)

---

<!--class: lead-green -->

## **Lista temi disponibili**

| Nome tema | Disponibilità |
| --- | ----------- |
| default | Incluso in Marp Core |
| uncover | Incluso in Marp Core |
| gaia | Incluso in Marp Core |
| <span style="color:lightcoral">**colors**</span> | Disponibile su [marp-themes](https://github.com/matsubara0507/marp-themes/tree/master) |
| iggg | Disponibile su [marp-themes](https://github.com/matsubara0507/marp-themes/tree/master) |
| olive | Disponibile su [marp-themes](https://github.com/matsubara0507/marp-themes/tree/master) |
| haskell | Disponibile su [marp-themes](https://github.com/matsubara0507/marp-themes/tree/master) |
| github | Disponibile su [marp-themes](https://github.com/matsubara0507/marp-themes/tree/master) |

---

<!--class: lead-green --> 

# Immagini o **Gif**

```markdown
![width:20em](https://muhack.org/media/element/giphy.gif)

```

![width:20em](https://media4.giphy.com/media/QbumCX9HFFDQA/giphy.gif?cid=ecf05e47u6x5tq50b8eoa5hv3o99uocabb2373s2n7zuxlxx&ep=v1_gifs_search&rid=giphy.gif&ct=g)

---

# Immagini o **Gif**

```markdown
![hue-rotate:90deg saturate](https://muhack.org/media/element/giphy.gif)

```

![width:20em hue-rotate:90deg saturate](https://media4.giphy.com/media/QbumCX9HFFDQA/giphy.gif?cid=ecf05e47u6x5tq50b8eoa5hv3o99uocabb2373s2n7zuxlxx&ep=v1_gifs_search&rid=giphy.gif&ct=g)

---

# Immagini o **Gif**

```markdown
![blur](https://muhack.org/media/element/giphy.gif)

```

![width:20em blur](https://media4.giphy.com/media/QbumCX9HFFDQA/giphy.gif?cid=ecf05e47u6x5tq50b8eoa5hv3o99uocabb2373s2n7zuxlxx&ep=v1_gifs_search&rid=giphy.gif&ct=g)

---

# **Math stuff**

_Sintassi markdown/latex_
```markdown
    $$
        e^{i\pi} +1 =0
    $$

    $\mathcal{O}(n\log{n})$
```
_Risultato_

$$
    e^{i\pi} +1 =0
$$

$\mathcal{O}(n\log{n})$

![bg right:45% 90%](https://haxed.it/artwork/12.png) 


---

# **Tabelle**


```
| Label | Pic |
| --- | ----------- |
| hax_type | ![width:5em](https://muhack.org/svg/hax-type.svg) |
| hax_java | ![width:5em](https://muhack.org/svg/hax-java.svg) |
```

| Label | Pic |
| --- | ----------- |
| hax_type | ![width:5em](https://raw.githubusercontent.com/muhack/muhack_svg/master/hax/hax-type-color.svg) |
| hax_java | ![width:5em](https://raw.githubusercontent.com/muhack/muhack_svg/master/hax/hax-java-color.svg) |

---

## **Blocchi di codice**

_Sintassi markdown_
```markdown
    ```python 
        def function():
            result = do_stuff()
            return result
    ```
```
_Risultato_

```python 
    def function():
        result = do_stuff()
        return result
```

![bg right:45% 80%](https://raw.githubusercontent.com/muhack/muhack_svg/master/hax/hax-foss-color.svg)

---

## **Emoji**

_Sintassi markdown_
```markdown
:computer: :heart: :stuck_out_tongue:
```
_Risultato_
# :computer: :heart:  :stuck_out_tongue_winking_eye:

Lista emoji disponibile [qui](https://gist.github.com/rxaviers/7360908)

![bg right:45% 80%](https://haxed.it/artwork/8.png)


---

## File **export**

- **.html** 
    - formato ricco di funzionalità
- **.pdf**
    - occhio ai riferimenti
- **PowerPoint** 
    - ma con qualche limitazione

![bg right:45% 80%](https://haxed.it/artwork/16.png)

---

# Link utili

- [website](https://marp.app/)
- [documentazione utile](https://marpit.marp.app/)
- [github](https://github.com/marp-team/marp)
- [video youtube](https://www.youtube.com/watch?v=EzQ-p41wNEE)
- [sintassi markdown](https://www.markdownguide.org/basic-syntax/)
- [muhack](https://muhack.org)
- [haxed.it](https://haxed.it) :fire:


---

<!--class: lead-invert-green -->

# <!--fit--> Grazie per l'attenzione
![width:17em](https://haxed.it/artwork/17.png) 