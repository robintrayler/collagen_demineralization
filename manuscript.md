---
title: Simple, Rapid Extraction of Collagen from Modern Bone
author:
  - Robin B. Trayler:
      institute: ['Department of Life and Environmental Sciences, University of California, Merced']
      correspondence: "yes"
      email: rtrayler@ucmerced.edu
  - Pedro Valencia Landa:
      institute: ['Department of Ecology and Evolutionary Biology, University of California, Santa Cruz']
  - Sora L. Kim:
      institute: ['Department of Life and Environmental Sciences, University of California, Merced']
      email: skim380@ucmerced.edu
bibliography: /Users/robintrayler/Zotero/ref_library.bib
csl: /Users/robintrayler/Zotero/styles/geology.csl
pdf-engine: xelatex
mainfont: "Helvetica"
geometry: margin=1.0in
tblPrefix: Table
figPrefix: Figure
secPrefix: Section
link-citations: true
# indent: true
header-includes:
    - \usepackage{float}
    - \usepackage{wrapfig}
    - \usepackage{lineno}
    - \linenumbers
    - \usepackage[font=small, skip=1pt]{caption}
---

# Notes

<!-- pandoc -s manuscript.md -o manuscript.pdf --pdf-engine=xelatex --filter pandoc-crossref --citeproc  --lua-filter scholarly-metadata.lua --lua-filter author-info-blocks.lua -->

## References to include
* @botta2012 - amide band positions
* @roche2010 - preservation and carbonate content
* @grunenwald2014 - carbonate in enamel
* @legeros1991 - enamel IR bands
* @hankermeyer2002 - dissolution rates


# Introduction {#sec:introduction}

Extracting bone collagen for stable isotope analysis is one of the most common methods for inferring ecological information from modern and fossil animals [@clementz2012; @koch1994].
Bone is a composite material, made of both mineral and organic components. The mineral component is primarily of bioapatite [Ca~5~(PO~4~)~3~OH] with carbonate (CO~3~) substitutions in the phosphate and hydroxyl sites [@elliott2002].
Dry bone is about 20 - 22wt% collagen which in turn is about 40% carbon and 15% nitrogen by weight[@ambrose1990; @vanklinken1999].
Since collagen is relatively insoluble [@schwarcz1991] it persists in the fossil record for ~10^5^ years.
Furthermore since the amino acid composition and elemental contents collagen are well understood and characterized [@ambrose1990; @szpak2011; @tuross1988; @tuross2002] it is reasonably straight forward to identify contaminants in collagen and remove them prior to analysis.

Isolating collagen for stable isotope analysis is usually accomplished via reaction with hydrochloric acid (HCl) to dissolve the mineral component.
HCl protonates the carbonate and phosphate groups of the hydroxylapatite structure to form carbonic and phosphoric acid [@hankermeyer2002] which can then be decanted, leaving behind the residual collagen.
This is sometimes followed by rinsing with sodium hydroxide (NaOH) to remove lipid and humic acid contaminants [@ambrose1990; @pestle2010; @brown1988; @longin1971].
The rate of mineral dissolution strongly depends on the acid concentration, temperature, the particle size [@hankermeyer2002]and change one of these variable will inevitably lead to faster or slower mineral removal.
Indeed, there is considerable variability in published methods for collagen extraction in reaction times, temperature, acid concentration, particle coarseness [@ambrose1990; @pestle2010].

In this study we do not attempt to resolve the optimal conditions for collagen extraction *per-se*, instead, we focus only on evaluating one variable, the timing of mineral removal, while holding particle size, temperature, and acid concentration constant.
Our results provide a simple, viable method for extracting collagen from well preserved modern and fossil bone.
Furthermore, our methods provide a framework for evaluating the the efficacy of other collagen extraction methods at removing bone mineral under a variety of experimental conditions.

# Background {#sec:background}


# Methods {#sec:methods}


## Sample Collection {#sec:methods_collection}

We selected three materials for analysis; dentine from a modern domestic goat (*Capra hricus*), bone from a white tailed deer (*Odocoileus viginianus*), and dentine from a blue shark (*Prionace glauca*).
The goat tooth and deer bone were fortuitously collected while the blue shark teeth were collected as part of a previous study (**citation from Sora?**).
We cleaned each sample of surficial contamination using a toothbrush grinding into a fine powder.
The deer and blue shark samples were ground in a *SPEX 8000M Mixer Mill* for 20 minutes each.
For shark teeth we homogenized several teeth from the same individual in order to obtain enough material for our time-step experiments.
The goat dentine was hand milled form in between enamel loops and did not require further grinding. The resulting powders were further homogenized via repeated stirring using vortexer to ensure that ontogenetic difference in isotope composition were minimized.

## Demineralization {#sec:methods_preparation}

We demineralized aliquots of each bioapatite (deer bone, goat and shark dentine) using 0.1M hydrochloric acid at 4°C. We demineralized in 5 minutes increments from 5 to 60 minutes and in 10 minute increments from 70 to 120 minutes.
For each time step we weighed 2.5 - 3 mg of powdered bioapatite into 1.7 mL micro-centrifuge tubes and added 1 mL of 0.1M HCl.
The bioapatite was then placed in a 4°C refrigerator for the specified amount of time. Five minutes before the specified amount of time, the samples were centrifuged for 5 minutes at 10,000 RPM and promptly rinsed using demonized water.
for example, for the 60 minute time step, the samples spent 55 minutes in the refrigerator and the 5 minutes in the centrifuge for a total of 60 minutes in acid. After rising the samples were frozen and lyophilized prior to FTIR and stable isotope analysis.

## FTIR {#sec:methods_ftir}

We collected infrared absorbance spectra from 4000 to 400 cm^-1^ for 32 scans at a resolution of 4 cm^-1^ from each aliquot to characterize changes to bulk chemistry, and in particular, the loss of phosphate and carbonate functional groups over time. 
We subtracted the background of each spectra by fitting a smoothed spline to several baseline points and smoothed each spectra slightly [@stuart2004] using a custom R script [@rcoreteam2021]. 
Several indices have been proposed proposed to characterize the chemical-crystal properties of bone apatite and collagen (@tbl:indices). However most of these indices focus on characterizing the 

We collected FTIR absorbance spectra from an aliquot at each time step to characterize changes to bulk chemistry.
We used Bruker Vertex 70 Far-Infrared FTIR housed in the Nuclear Magnetic Resonance Facility at the University of California, Merced. We collected infrared absorbance spectra from 4000 cm^-1^ to 400 cm^-1^ for 32 scans at a resolution of 1 cm^-1^.
We subtracted the background of each spectra by fitting a smoothed spline to several baseline points using a custom R script [@rcoreteam2021], which is included in the supplementary material.
A variety indices have been proposed to characterize the crystal-chemical properties of bone apatite and collagen (@tbl:indices). @sponheimer1999 used 

We the ratio of the amide 1  indices related to total carbonate and phosphate content as well as organic (collagen) content.


|  band position (cm^-1^) |           Chemical Group            |    Reference    |
|:-----------------------:|:-----------------------------------:|:---------------:|
|          1630           |            Amide I (CO–NH)          |    @botta2012   |
|          1551           |            Amide II (CO–NH)         |    @botta2012   |
|          1545           |       A-Type Carbonate (CO~3~)      |                 |
|          1415           |       B-Type Carbonate (CO~3~)      |                 |
|          1231           |            Amide III (CO–NH)        |    @botta2012   |
|          1020           |         Phosphate (ν~3~PO~4~)       |                 |
|           880           |           Carbonate (CO~3~)         |                 |
|           565           |         Phosphate (ν~2~PO~4~)       |                 |

: Nominal FTIR band positions of several relevant chemical groups. {#tbl:bands}


|          Index          |              Formula                |    Reference    |
|:-----------------------:|:-----------------------------------:|:---------------:|
|          *PCI*          | $\frac{B_{605} + B_{565}}{V_{590}}$ | @sponheimer1999 |
|          *BPI*          |     $\frac{B_{1415}}{B_{605}}$      | @legeros1991    |
|          *API*          |     $\frac{B_{1545}}{B_{605}}$      | @sponheimer1999 |
|         *WAMPI*         |     $\frac{B_{1650}}{B_{605}}$      | @roche2010      |
| $\frac{amide~1}{PO_4}$  |     $\frac{B_{1650}}{B_{1000}}$     | @lebon2016      |

: FTIR indices used in this study. *B* indicates the absorbance band height at the specified wavenumber, while *V* indicates the depth of the "valley". Since the maximum height of a particular absorbance band may not occur at exactly the reported wavenumber, we instead calculated the indices above using the local maxima or minima within ±15 cm^-1^. {#tbl:indices}

## Stable Isotope Analysis {#sec:methods_isotopes}

the δ^13^C and δ^15^N values and elemental carbon and nitrogen contents of all samples were measured using a Costech 4010 Elemental Analyzer coupled with a Delta V+ Isotope Ratio Mass Spectrometer housed in the Stable Isotope Ecosystem Laboratory at the University of California, Merced.
Carbon and nitrogen isotope compositions were corrected for instrument drift, mass linearity, and standardized to the international VPDB and AIR scales using the USGS 40 and USGS 41a standard reference materials.
Mean carbon and nitrogen isotope compositions were XXXXXX XXXXXX, XXXXX, XXXXX for USGS 40 and 41a, respectively.
We also analyzed several aliquots of a homogenized squid tissue as an in house reference which returned δ^13^C and δ^15^N of YYYY and YYYY which are indistinguishable from the long-term average (ZZZZ).

# Results {#sec:results}

![FTIR spectra for *Capra hircus* dentine and dental collagen. **EVENTUALLY THIS FIGURE WILL HAVE SPECTRA FOR ALL 3 MATERIALS**](./figures/all_spectra.pdf){#fig:spectra width=100%}


![Stable isotope compositions for *Capra hircus* dentine and dental collagen. **EVENTUALLY THIS FIGURE WILL HAVE DATA FOR ALL 3 MATERIALS**](./figures/dentine_isotopes.pdf){#fig:isotopes width=50%}


![ **EVENTUALLY THIS FIGURE WILL HAVE DATA FOR ALL 3 MATERIALS**](./figures/ap_ratio_dentine.pdf){#fig:index width=50%}

# Discussion {#sec:discussion}

this is a minor change.

# Supplementary Information {#sec:sup_info}

All infrared spectra, stable isotope data, analysis code, and a draft version of this manuscript are available on at [github.com/robintrayler/collagen_demineralization](https://github.com/robintrayler/collagen_demineralization)


\pagebreak

# References {-}
:::{#refs}
:::