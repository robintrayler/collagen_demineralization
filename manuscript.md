---
title: Simple, Rapid Extraction of Collagen from Modern Bone
author:
  - Robin B. Trayler
  - Sora L. Kim
bibliography: ./bibtex.bib
csl: ./manuscript_files/geology.csl
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

<!-- pandoc -s manuscript.md -o manuscript.pdf --pdf-engine=xelatex --filter pandoc-crossref --citeproc --number-sections -->

# Notes
* We collected measurements on time-series experiments to quantify changes during the demineralization process
	* mineral loss, carbon and nitrogen gain or loss (deprotienation) isotopic changes
* Develop metrics to evaluate the efficiency and quality of demineralization methods 
* Develop simple tests that labs can do to evaluate their own in-house demineralization methods

## References to include
* @botta2012 - amide band positions
* @roche2010 - preservation and carbonate content
* @grunenwald2014 - carbonate in enamel
* @legeros1991 - enamel IR bands
* @hankermeyer2002 - dissolution rates 
* @lebon2016 - quantification of collagen using FTIR

# Introduction {#sec:introduction}

Extracting bone collagen for stable isotope analysis is one of the most common methods for inferring ecological information from modern and fossil animals [@clementz2012; @koch1994]. Bone is a composite material, made of both mineral and organic components. The mineral component is primarily bioapatite [Ca~5~(PO~4~)~3~OH] with carbonate (CO~3~) substitutions in the phosphate and hydroxyl sites [@elliott2002]. Modern dry bone is about 20 - 30 wt% organic matter, while dentine is about 12 - 33 wt% organic [@driessens1990], which in turn is about 89% collagen [@ambrose1990; @driessens1990; @vanklinken1999]. Since collagen is relatively insoluble [@schwarcz1991] it can persist in the fossil record for ~10^5^ years [@clementz2012]. Furthermore, since the amino acid composition and elemental content (~40% carbon, ~15% nitrogen) are well characterized, it is reasonably straightforward to identify and remove contaminants in collagen prior to analysis [@ambrose1990; @szpak2011; @tuross2002; @tuross1988; @fuller2015]. However, since bioapatite contains ~ 5% structural carbonate [@elliott2002] there are two main reservoirs of carbon in bone. Furthermore, the carbon isotope fractionation between diet and collagen differ significantly from the fractionation between diet and structural carbonate [@passey2005]. This means that collagen must be isolated from the mineral component prior to analysis.

Isolating collagen for stable isotope analysis is usually accomplished via reaction with hydrochloric acid (HCl) to dissolve the mineral component. HCl protonates the carbonate and phosphate groups of the hydroxylapatite structure to form carbonic and phosphoric acid [@hankermeyer2002] which can then be decanted, leaving behind the residual collagen. This is sometimes followed by rinsing with sodium hydroxide (NaOH) to remove lipid and humic acid contaminants [@ambrose1990; @pestle2010; @brown1988; @longin1971]. The rate of mineral dissolution strongly depends on the acid concentration, temperature, the particle size [@hankermeyer2002] and change one of these variable will inevitably lead to faster or slower mineral removal. However, there is considerable variability in published methods for collagen extraction in reaction times, temperature, acid concentration, particle coarseness [@ambrose1990; @pestle2010] leading to ambiguity as to the best practices for mineral removal.

<!-- Note: dentine 12 - 33% organic, bone 20-30% organic. Organic content is ~89% collagen. so that means that dentine is ~10 - 29%, bone is 18 - 27% collagen see [@driessens1990] -->

In this study we do not attempt to resolve the optimal conditions for collagen extraction *per-se*, instead, we focus only on evaluating one variable, the timing of mineral removal, while holding particle size, temperature, and acid concentration constant. Our results provide a simple, viable method for extracting collagen from well preserved modern and fossil bone. Furthermore, our methods provide a framework for evaluating the the efficacy of other collagen extraction methods at removing bone mineral under a variety of experimental conditions.

# Background {#sec:background}

## Collagen Extraction

## Fast Fourier Infrared Spectroscopy

Fast Fourier Infrared Spectroscopy (FTIR) irradiates a sample with a beam of infrared light. Photons of infrared light excite molecules into a higher energy state, and as a result, some wavelengths are absorbed while others are transmitted through the material unaffected.  Since the molecular structure of a material determines which wavelengths are absorbed or transmitted, FTIR can be used to used to semi-quantitatively measure the chemical composition of a material and different absorbance bands can be assigned to specific chemical functional groups [@stuart2004]. There has been considerable work using FTIR to investigate crystallographic and chemical changes to bioapatite and bone collagen during diagenesis [e.g., @grunenwald2014; @roche2010; @sonjuclasen1997; @sponheimer1999; @hassan1977], and as a result the band positions of the major chemical groups of these materials is well understood (@tbl:bands). In particular, it is possible to distinguish the functional groups associated with the organic (collagen), and inorganic (bioapatite) components of bone and dentine [see review of: @olcottmarshall2015]. Carbonate (CO~3~), phosphate (PO~4~), and organic amide groups produce distinct absorbance bands and the relative size of these bands is proportional to concentration [@grunenwald2014; @lebon2016] .



Several indices have been proposed to assess the quality and preservation of either the collagen or mineral components of bone (@tbl:indices). However many of these indices rely on regions where there is considerable overlap among organic and inorganic absorbance bands or where the index cannot be reliably calculated for both unaltered bone and fully demineralized collagen. For example the API and BPI indices are commonly used to quantify carbonate content bone and tooth enamel [@grunenwald2014; @roche2010; @sponheimer1999]. Calculating these indices relies on a reliable measurement of absorbance at wavenumber ~1020 cm^-1^, the location of the most prominent phosphate band. However, in fully demineralized collagen wavenumber ~1020 cm^-1^ is instead 



 A variety indices have been proposed to characterize the crystal-chemical properties of bone apatite and collagen (@tbl:indices). @sponheimer1999 used 

We used the ratio of the amide-I  indices related to total carbonate and phosphate content as well as organic (collagen) content.

|  band position (cm^-1^) | Chemical Group          | Reference                |
|:-----------------------:|:-----------------------:|:------------------------:|
|           1630          | Amide I (CO–NH)         | @botta2012               |
|           1551          | Amide II (CO–NH)        | @botta2012               |
|           1545          | A-Type Carbonate (CO~3~)| @legeros1991; @rey1991   |
|           1415          | B-Type Carbonate (CO~3~)| @legeros1991; @rey1991   |
|           1231          | Amide III (CO–NH)       | @botta2012               |
|           1020          | Phosphate (ν~3~PO~4~)   |                          |
|           880           | Carbonate (CO~3~)       |                          |
|           565           | Phosphate (ν~2~PO~4~)   |                          |

: Nominal FTIR band positions of several relevant chemical groups. Actually band positions may be shifted by several cm^-1^. {#tbl:bands}





|         Index          |              Formula              |    Reference    |
| :--------------------: | :-------------------------------: | :-------------: |
|          PCI           | $\frac{B_{605}+B_{565}}{V_{590}}$ | @sponheimer1999 |
|          BPI           |    $\frac{B_{1415}}{B_{605}}$     |  @legeros1991   |
|          API           |    $\frac{B_{1545}}{B_{605}}$     | @sponheimer1999 |
|         WAMPI          |    $\frac{B_{1650}}{B_{605}}$     |   @roche2010    |
| $\frac{amide~1}{PO_4}$ |    $\frac{B_{1650}}{B_{1000}}$    |   @lebon2016    |

: FTIR indices used in this study. *B* indicates the absorbance band height at the specified wavenumber, while *V* indicates the depth of the "valley". Since the maximum height of a particular absorbance band may not occur at exactly the reported wavenumber, we instead calculated the indices above using the local maxima or minima within ±15 cm^-1^. {#tbl:indices}



# Methods {#sec:methods}

## Sample Collection {#sec:methods_collection}

We selected materials for analysis; dentine from a modern domestic goat (*Capra hircus*), bone from a white tailed deer (*Odocoileus virginianus*), and dentine from a blue shark (*Prionace glauca*). The goat and deer specimens were fortuitously collected and the shark teeth were collected as part of a previous study (**citation from Sora?**). We cleaned each sample of surficial contamination using a toothbrush and deionized water before grinding into a fine powder using either an agate mortar and pestle or SPEX 8000M Mixer Mill. Since blue shark teeth are quite small, we homogenized several teeth from the same individual to obtain enough material for our experiments. The resulting powders for all specimens were further homogenized via repeated stirring using a vortexer to minimize effects from isotopic zoning in mammal teeth  [@trayler2017; @kohn1998] and variations among multiple teeth from individual sharks [@shipley2021]. 

## Demineralization {#sec:methods_preparation}

![Diagram of methods.](./figures/workflow.pdf){#fig:workflow width=100%}

We tested the efficacy of mineral removal in 5 minute increments from 5 to 60 minutes, in 10 minute increments from 70 to 120 minutes and at 18 and 24 hours. All experiments were performed in triplicate. For each time step we weighed 2.5 - 4 mg of powdered bone or dentine into 1.7 mL micro-centrifuge tubes and added 1 mL of cold (4°C) 0.1M hydrochloric acid. Sample were briefly stirred using a vortexer and then placed in a 4°C refrigerator (@fig:workflow). Five minutes before the specified amount of time for each aliquot the samples were removed from the refrigerator and centrifuged at 10,000 RPM for five minutes, and promptly rinsed 5 times with deionized water. For example, the 60-minute time step samples spent 55 minutes in the refrigerator and 5 minutes in the centrifuge for a total of 60 minutes in acid. After rising the samples were frozen and lyophilized prior to FTIR and stable isotope analysis.

## FTIR {#sec:methods_ftir}

We collected ATR-FTIR spectra using a Bruker Vertex 70 Far-Infrared FTIR housed in the Nuclear Magnetic Resonance Facility at the University of California, Merced. Spectra were collected from 400 - 2000 cm^-1^ for 32 scans at a resolution of 4 cm^-1^.  We subtracted the background of each of each spectrum by fitting a smoothed spline to several baseline points (points expected to have an FTIR absorbance of 0) and smoothed each spectra slightly [@stuart2004] using a custom R script [@rcoreteam2021].



We collected FTIR absorbance spectra from an aliquot at each time step to characterize changes to bulk chemistry. We used Bruker Vertex 70 Far-Infrared FTIR housed in the Nuclear Magnetic Resonance Facility at the University of California, Merced. We collected infrared absorbance spectra from 4000 cm^-1^ to 400 cm^-1^ for 32 scans at a resolution of 1 cm^-1^. We subtracted the background of each spectra by fitting a smoothed spline to several baseline points using a custom R script [@rcoreteam2021], which is included in the supplementary material. A variety indices have been proposed to characterize the crystal-chemical properties of bone apatite and collagen (@tbl:indices). @sponheimer1999 used 

We used the ratio of the amide-I  indices related to total carbonate and phosphate content as well as organic (collagen) content.


|         Index          |              Formula              |    Reference    |
| :--------------------: | :-------------------------------: | :-------------: |
|          PCI           | $\frac{B_{605}+B_{565}}{V_{590}}$ | @sponheimer1999 |
|          BPI           |    $\frac{B_{1415}}{B_{605}}$     |  @legeros1991   |
|          API           |    $\frac{B_{1545}}{B_{605}}$     | @sponheimer1999 |
|         WAMPI          |    $\frac{B_{1650}}{B_{605}}$     |   @roche2010    |
| $\frac{amide~1}{PO_4}$ |    $\frac{B_{1650}}{B_{1000}}$    |   @lebon2016    |

: FTIR indices used in this study. *B* indicates the absorbance band height at the specified wavenumber, while *V* indicates the depth of the "valley". Since the maximum height of a particular absorbance band may not occur at exactly the reported wavenumber, we instead calculated the indices above using the local maxima or minima within ±15 cm^-1^. {#tbl:indices}

## Stable Isotope Analysis {#sec:methods_isotopes}

the δ^13^C and δ^15^N values and elemental carbon and nitrogen contents of all samples were measured using a Costech 4010 Elemental Analyzer coupled with a Delta V+ Isotope Ratio Mass Spectrometer housed in the Stable Isotope Ecosystem Laboratory at the University of California, Merced. Carbon and nitrogen isotope compositions were corrected for instrument drift, mass linearity, and standardized to the international VPDB and AIR scales using the USGS 40 and USGS 41a standard reference materials. Mean carbon and nitrogen isotope compositions were XXXXXX XXXXXX, XXXXX, XXXXX for USGS 40 and 41a, respectively. We also analyzed several aliquots of a homogenized squid tissue as an in house reference which returned δ^13^C and δ^15^N of YYYY and YYYY which are indistinguishable from the long-term average (ZZZZ).

# Results {#sec:results}
## Collagen Yields
![Collagen yields at each time step for all samples.](./figures/yield.pdf){#fig:spectra width=100%}

## FTIR Spectra
![FTIR spectra for *Capra*, *Odocoileus*, and *Prionace* bioapatite and collagen. ](./figures/all_spectra.pdf){#fig:yield width=100%}

## Stable Isotopes
![Stable isotope data (A-C: δ^13^C;  D-F: δ^15^N) and FTIR index (G-I: Amide I / PO~4~) for all samples. Triangular points are 25°C experiments, circular points are 5°C experiments. Colored points with error bars are the mean ±2 standard deviations for each time step. In many cases the error bars are smaller than the symbol. The dashed grey lines on panels A - F indicate long-term ±2σ analytical reproducibility, centered on the data. The shaded grey band on panels G - H indicates the range of WAMPI values for 18 and 24 hours samples, which we interpret as the WAMPI for fully demineralized collagen.](./figures/isotope_data.pdf){#fig:index width=100%}

# Discussion {#sec:discussion}



# Supplementary Information {#sec:sup_info}

All infrared spectra, stable isotope data, analysis code, and a draft version of this manuscript are available on at [github.com/robintrayler/collagen_demineralization](https://github.com/robintrayler/collagen_demineralization)


\pagebreak

# References {-}
:::{#refs}
:::