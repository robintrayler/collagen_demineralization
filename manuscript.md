---
title: Collagen Demineralization Manuscript
author: Robin B. Trayler and Sora L. Kim
bibliography: /Users/robintrayler/Zotero/ref_library.bib
csl: /Users/robintrayler/Zotero/styles/geology.csl
pdf-engine: xelatex
mainfont: "Helvetica"
geometry: margin=1.0in
tblPrefix: Table
figPrefix: Figure
secPrefix: Section
link-citations: true
indent: true
header-includes:
	- \usepackage{float}
    - \usepackage{lineno}
    - \linenumbers
    - \usepackage[font=small, skip=1pt]{caption}
---

# Introduction {#sec:introduction}

Extracting bone collagen for stable isotope analysis is one of the most common methods for inferring ecological information from modern and fossil animals [@clementz2012]. Removing the mineral component of bone is usually accomplished via reaction with dilute hydrochloric acid (HCl), although there is considerable variation in both the acid concentration and reaction time [@ambrose1990; @pestle2010]. Furthermore, improvements in measurement techniques and instrument sensitivity mean that the required samples sizes for δ^13^C and δ^13^N analysis have fallen making preparation of smaller samples viable.

# Background {#sec:background}

# Methods {#sec:methods}

## Sample Collection {#sec:methods_collection} 

We selected three materials for analysis; dentine from a modern goat (*Capra hircus*), bone from a white tailed deer (*Odocoileus viginianus*) and dentine from blue shark (*Prionace glauca*) teeth. Goat dentine was collected by milling out several grams of powder from in-between enamel loops using a 0.5 mm inverted cone carbide dental drill bit and a handheld Dremel rotary tool. Deer bone and shark teeth were homogenized in a SPEX ball mill (**put model number here**) for 20 minutes. For shark teeth, since our experiments required several hundred milligrams of material, we homogenized several teeth from the same individual. No attempt was made to remove the thin outer layer of enameled. The resulting powders for each animal were homogenized via repeated stirring using a vortexer to ensure that ontogenetic differences in isotope composition were minimized.

## Sample Preparation {#sec:methods_preparation}

We demineralized aliquots of each material (deer bone, goat and shark dentine) using 0.1M hydrochloric acid (HCl) at 4°C. We demineralized aliquots for different amounts of time in 5 minute increments from 0 to 60 minutes, and in 10 minute increments from 60 to 120 minutes

## FTIR {#sec:methods_ftir}

After demineralization we collected FTIR spectra from an aliquot at each time step to characterize changes to bulk chemistry. We used a Bruker Vertex 70 Far-Infrared FTIR, housed in the Nuclear Magnetic Resonance Facility at the University of California Merced. We collected infrared absorbance spectra from 4000 cm^-1^ to 400 cm^-1^ for 32 scans at a resolution of 1 cm^-1^. We subtracted the background of each spectra by fitting a smoothed spline to several baseline points using a custom R script [@rcoreteam2021], which is included in the supplementary material. 

### Spectral Indices

Several indices have been proposed to characterize the crystal-chemical properties of bone apatite and collagen (@tbl:indices). We the ratio of the amide 1  indices related to total carbonate and phosphate content as well as organic (collagen) content.

|          Index          |              Formula                |    Reference    |
|:-----------------------:|:-----------------------------------:|:---------------:|
|          *PCI*          | $\frac{B_{605} + B_{565}}{V_{590}}$ | @sponheimer1999 |
|          *BPI*          |     $\frac{B_{1415}}{B_{605}}$      | @legeros1991    |
|          *API*          |     $\frac{B_{1545}}{B_{605}}$      | @sponheimer1999 |
|         *WAMPI*         |     $\frac{B_{1650}}{B_{605}}$      | @roche2010      |
| $\frac{amide~1}{PO_4}$  |     $\frac{B_{1650}}{B_{1000}}$     | @lebon2016      |

: FTIR indices used in this study. *B* indicates the absorbance band height at the specified wavenumber, while *V* indicates the depth of the "valley". Since the maximum height of a particular absorbance band may not occur at exactly the reported wavenumber, we instead calculated the indices above using the local maxima or minima within ±15 cm^-1^. {#tbl:indices}

# Results {#sec:results}

![FTIR spectra for *Capra hircus* dentine and dental collagen.](./figures/dentine_spectra.pdf){#fig:dentine width=50%}

# Discussion {#sec:discussion}

# Supplementary Information {#sec:sup_info}
All infrared spectra, stable isotope data, analysis code, and a draft version of this manuscript are available on at [github.com/robintrayler/collagen_demineralization](https://github.com/robintrayler/collagen_demineralization)

# References {-}
:::{#refs}
:::