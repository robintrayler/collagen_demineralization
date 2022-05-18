---
title: "Evaluating the Efficacy of Bone Collagen Isolation Using Stable Isotope Analysis and Infrared Spectroscopy"
author:
  - Robin B. Trayler
  - Pedro Valencia Landa
  - Sora L. Kim
bibliography: ./bibtex.bib
csl: ./rapid-communications-in-mass-spectrometry.csl
mainfont: "Baskerville"
fontsize: 12pt
geometry: margin=1.0in
tblPrefix: Table
figPrefix: Figure
secPrefix: Section
link-citations: true
indent: true
header-includes:
    - \usepackage{lineno}
    - \linenumbers
    - \usepackage{setspace}
    - \doublespacing
---

<!-- this is a comment -->

<!-- this will complete the manuscript using pandoc -->
<!-- pandoc -s manuscript.md -o manuscript.pdf --pdf-engine=xelatex --filter pandoc-crossref --citeproc --number-sections -->

<!-- pandoc -s manuscript.md -o manuscript.docx --pdf-engine=xelatex --filter pandoc-crossref --citeproc --number-sections --reference-doc=reference.docx -->

# Rationale {.unnumbered}
This introduction must convey the significance of the research and consist of 2–3 sentences (approximately 50 words) describing the importance of the study to a broad, non-expert audience. Authors may consider the following questions in the composition of their rationale: What is the problem? Why is the research important?What significance does it have to the immediate scientific community or to society as a whole?

# Methods {.unnumbered}
A succinct description of the specialized processes, techniques and mass spectrometry instrumentation used in the study (maximum of 75 words). For example, the ionization technique and the type of mass spectrometer used will be of particular importance to other mass spectrometrists.

# Results {.unnumbered}
Up to 75 words describing the outcome of the study. This should include the most importantexperimental findings. For example, for a classical analytical assay figures of merit and validation data should be summarized. A structural elucidation study may list important new compounds, proposed dissociation mechanisms and associated data such as accurate mass measurements and measurement uncertainties. For proteomics and metabolomics it is important to give the number of significant features, ion suppression effects, newly discovered biomarker molecules, etc

# Conclusions {.unnumbered}
One or two sentences (approximately 50 words) to explain the significance of the results and the conclusions drawn. The conclusions may also answer a question that was outlined in the Rationale section, and/or provide implications of the described research or examples for further applications. These conclusions should be understandable by a broad non-specialist specific audience.
Example

# Introduction {#sec:introduction}

Analyzing collagen via stable isotope analysis is one of the most common methods for inferring ecological information from the remains of modern and fossil animals [@clementz2012; @koch1994]. Collagen has a relatively slow turnover rate [@hedges2007], and analyzing its stable carbon (δ^13^C) and nitrogen (δ^15^N) isotope composition provides time-averaged insights about diet and trophic dynamic [@deniro1978; @deniro1981; @clementz2012; @koch1994; @ambrose1990]. Furthermore, since collagen is relatively insoluble [@schwarcz1991] it persists in the fossil record for ~10^5^ years, allowing the investigation of animal ecology from the late Pleistocene through the Holocene [@clementz2012]. The amino acid composition and elemental content (~35% carbon, ~11% nitrogen) are well characterized, so it is relatively straightforward to identify and remove contaminants in collagen prior to stable isotope analysis [@ambrose1990; @szpak2011; @tuross2002; @tuross1988; @fuller2015]. However, analysis of biologic material such as teeth or bone is complicated as these are composite materials with both mineral and organic (i.e., collagen, lipids) components. While only the organic (collagen) contains significant nitrogen contents, both the mineral and organic components contain carbon. Bulk bone and dentine contains about 9% collagen-bound carbon and 1% carbonate-bound carbon.  Furthermore, since the diet-tissue stable isotope enrichment factors for carbonate-bound (~ +14‰) and collagen-bound (~ +5‰) carbon are significantly different [@passey2005a; @ambrose1993], stable isotope analysis of bulk bone or dentine will lead to δ^13^C values that reflect a weighted average of both components.

Collagen can be isolated from the mineral component of bone or dentine either by acid digestion of the mineral fraction using either hydrochloric acid (HCl) or via the calcium binding chelating agent Ethylenediaminetetraacetic acid (EDTA) [@ambrose1990; @tuross1988; @longin1971]. However there is considerable variation in published (and practiced) demineralization methods. Some studies recommend higher acid concentrations but shorter reaction times [@pestle2010; @ambrose1990], while others use lower acid concentrations and long reaction times [@sealy2014], or forgo mineral removal all together [@brault2014; @turnertomaszewicz2015; @jacob2005; @mateo2008]. In this study, we do not attempt to resolve the optimal conditions (e.g., time, temperature, acid concentration, etc.) for all collagen extraction methods. Instead we focus on developing a framework for assessing the efficacy of a given mineral removal method, with set experimental conditions. We held acid concentration and temperature in our experiments constant and varied the acid-reaction time from 5 minutes to 24 hours (@fig:workflow). We used this experimental design to test the rate of mineral removal in three materials collected from modern animals; white tailed deer bone (*Odocoileus virginianus*), goat dentine (*Capra hircus*), and blue shark dentine (*Prionace glauca*). We assessed our methods using three metrics 1) Collagen yield and quality 2) stable isotope compositions and 3) the ratio of organic to inorganic material. Our results show that for a given method, the extent of mineral removal can be quantified using standard techniques available at many major research universities, and these metrics can be used as a framework to evaluate the preferred collagen extraction technique  coupled with bioapatite of interest to any research group. 

![Diagram of methods.](./figures/final_figures/workflow.pdf){#fig:workflow width=100%}

# Background {#sec:background}

## Elemental Composition of Bone {#sec:background_composition}

Bone and dentine are composite materials, with both mineral and organic components. Both phases are commonly analyzed for their stable isotope composition (δ^13^C, δ^15^N) to infer diet, trophic position, and geographic provenance. Essentially all nitrogen in bone is contained in the organic phase, and some studies have analyzed dentine for δ^15^N values without mineral removal [@guiry2016]. Most pertinent to this study, both the mineral and the organic components contain carbon sources, which must be isolated prior to analysis. <!-- Bioapatite appears to exchange hydrogen with or absorb ambient moisture on timescales of minutes, making it of limited use for d^2^H analyses [@drewicz2020], while the d^2^H values of collagen are used to infer trophic dynamics and geographic provenance [@reynard2008].  Both collagen and bioapatite are routinely analyzed for their oxygen isotope compositions (δ^18^O) [@hedges2004; @france2015; @kohn2002]. --> The mineral phase is primarily bioapatite [Ca~5~(PO~4~)~3~OH] with carbonate (CO~3~) substitutions in the hydroxyl (type-A CO~3~) and phosphate (type-B CO~3~) crystallographic sites [@elliott1985; @elliott2002; @driessens1990]. Bioapatite carbonate contents vary considerably, with reported values ranging from 3 to 13% [@driessens1990].  Since carbonate is empirically 20% carbon, assuming an average carbonate content of about 5% [@sydney-zax1991; @zazzo2005] means that bone contains about 1% carbonate-bound carbon, by mass. Modern dry bone and dentine are 12 to 33% collagen by weight [@driessens1990; @vanklinken1999; @ambrose1990]. Collagen carbon contents can vary significantly based on preservation, but well preserved samples are usually 35±8% carbon [@vanklinken1999]. Therefore, an average bone is about 9% collagen-bound-carbon by weight. 

Since the carbon isotope diet-to-tissue enrichment factors (ε) differ for mineral and organic phases, bulk stable isotope analysis of bone without isolating either component will result in δ^13^C values that represent a mixture of the two components. For example, bioapatite-carbonate in large mammalian herbivores is enriched relative to diet by 11-14‰ depending on body size and gut physiology [@passey2005a], while collagen is enriched by about 5‰ [@ambrose1993]. Given the the average carbon contents of each phase (discussed below), bulk analysis of bone is expected to be enriched by 6‰ relative to diet. Alternatively, bulk bone analyses δ^13^C values are expected to be enriched but 1‰ relative to purified collagen.

$$\left( \frac{(diet + 14‰)\times 0.01 + (diet + 5‰) \times 0.09}{0.01 + 0.09} \approx diet +6‰ \right)$$

## Collagen Extraction {#sec:background_extraction}

Isolating bone collagen prior to stable isotope analysis is accomplished via reaction with either HCl or Ethylenediaminetetraacetic acid [@ambrose1990; @tuross1988; @longin1971]. EDTA demineralization is usually recommended for archaeological or paleontological specimens where collagen may be poorly preserved. However, EDTA demineralization is often slow and can take weeks to months to fully remove bone mineral, and in well preserved specimens, HCl may be preferred due to its rapid reaction speed. HCl is a potent protein hydrolyzing agent [@rosenberg2013] and it can induce amino-acid loss in poorly preserved specimens which may alter stable isotope compositions [@pestle2010]. 

HCl protonates the carbonate and phosphate groups of bioapatite, to form carbonic and phosphoric acid [@hankermeyer2002] which can then be decanted, leaving behind the residual collagen. This is sometimes followed by rising with sodium hydroxide (NaOH) to remove lipid and humid contaminants [@ambrose1990; @pestle2010; @brown1988; @longin1971]. The rate of mineral dissolution is strongly dependent on the acid concentration, temperature, reaction time, and particle size [@hankermeyer2002], and changes to one of these variables should lead to more or less mineral removal. However there is considerable variation in published methods for collagen extraction. While some studies suggest rapid removal of mineral using higher acid concentrations [@pestle2010], others use lower HCl concentrations, in particular when archaeological or fossil specimens are thought to be poorly preserved [@sealy2014; @tuross1988; @beaumont2013]. Particle size also varies considerably across methods, and furthermore, can strongly influence the rate of demineralization [@hankermeyer2002]. While some authors suggest using bone "chunks", others use methods suggest first grinding samples into small pieces or fine powders see review of:[@sealy2014]. While collagen extraction methods vary significantly across published studies, inter-laboratory comparisons show that different methods produce comparable stable isotope compositions (δ^13^C, δ^15^N) [@pestle2014] and therefore, method development should focus on producing  collagen of satisfactory quality. 

The primary criteria used to assess collagen quality in modern and ancient specimens are collagen yield, collagen carbon and nitrogen content, and the ratio of carbon to nitrogen content (C:N~atomic~). These criteria are based on the conservative amino acid composition of collagen which varies little across a wide variety of taxa [@szpak2011]. Collagen content in fresh bone should be about 34.8±8.8% [@vanklinken1999], although these contents may be lower in dentine or degraded bone. Low collagen yields may indicate alteration due to degradation and preferential loss of amino acids [@vanklinken1999]. Ambrose @ambrose1990 initially suggested that samples that yield less that 3.5% were suspect, though later work has lowered this threshold to 1% yield [@vanklinken1999]. Similarly, total collagen carbon and nitrogen contents can indicate alteration, with proposed minimum contents of 13% and 4.5% for carbon and nitrogen respectively [@guiry2020]. 

The sources of contamination in modern and fossil collagen are endogenous lipids, humic acids, and non-collagenous proteins [@guiry2021]. Both humic acids and lipids are carbon rich but nitrogen poor and lead to higher C:N~atomic~ values. Furthermore, since lipids are relative ^13^C depleted, they can significantly change δ^13^C values if not properly removed [@liden1995]. This is especially true for fish and marine mammals which can have very high bone lipid contents. @deniro1985 proposed a C:N~atomic~ range of 2.9--3.6 as indicative of well preserved collagen, although this range has been suggested to be somewhat too liberal, where samples with carbon-bearing lipid or humid compounds may still have C:N~atomic~ values that fall within the "acceptable" range. Other authors have suggested either narrower C:N~atomic~ or taxon specific (e.g., fish, mammals) ranges. @vanklinken1999 suggests a range of 3.1--3.5 based on long term data collection in the Oxford radiocarbon facility. Guiry and Szpak[@guiry2021] suggested adjusting the upper limit of the DeNiro[@deniro1985] range (2.9--3.6) for fossil collagen from various taxa, depending on preservation characteristics, likelihood of contamination, and research tolerance for altered isotopic compositions. The same authors also suggested a C:N~atomic~ range of 3.00--3.30 for modern fish, mammals, and birds [@guiry2020]. 

## Fast Fourier Infrared Spectroscopy {#sec:background_ftir}

Fast Fourier Infrared Spectroscopy (FTIR) irradiates a sample with a beam of infrared light. Infrared photons excite molecules into a higher energy state, and as a result, some wavelengths are absorbed while others are transmitted through the material. Since the molecular structure of a material determines which wavelengths are absorbed or transmitted, FTIR can be use to semi-quantitatively, determine the chemical composition of a material ad assign different absorbance bands to specific chemical functional groups [@stuart2004].   

There has been considerable work using FTIR to investigate crystallographic and chemical changes to bioapatite and collagen during diagenesis and fossilization [@grunenwald2014; @roche2010; @sponheimer1999; @hassan1977; @sonjuclasen1997]. As a result, the absorbance band position of the major chemical functional groups of both materials is well understood. It is possible to distinguish the functional groups associated with the organic and inorganic components of bone. Carbonate (CO~3~), phosphate (PO~4~), and organic amide groups produce distinct absorbance bands and the relative size of these bands is proportional to concentration [@grunenwald2014; @lebon2016], meaning that FTIR can be used to track changes in mineral/ collagen abundance and alteration (see review of:Marshall and Marshall @olcottmarshall2015).

Several indices have been proposed to assess the quality and preservation of the collagen and bioapatite components of bone. However, many of these rely on regions where there is considerable overlap among the band derived from organic and inorganic functional groups. As a result, some indices cannot be reliably calculated for both unaltered bone and and fully demineralized collagen, limiting their usefulness in our case. For example, quantifying carbonate content or loss is complicated by the overlap among carbonate, phosphate, and amide bands. The A-carbonate-on-phosphate and B-carbonate-on-phosphate indices, are commonly used to infer carbonate content in bone and tooth enamel [@grunenwald2014; @roche2010; @sponheimer1999; @sydney-zax1991]. However, calculating these indices require reliable measures of the and the A-CO~3~ and B-CO~3~ absorbance bands at 1545 cm^-1^ and 1415 cm^-1^, respectively. However, the A-CO~3~ and B-CO~3~ bands partially overlap the organic amide II and amide III bands. Taken together, this means it is difficult to quantify CO~3~ and PO~4~ loss using these absorbance bands.

Instead of directly measuring carbonate loss, we instead focus quantifying the reduction of phosphate relative to organic content as a proxy for mineral removal. Since most carbonate is bound in the PO~4~ crystallography site, and CO~3~ content affects bioapatite solubility [@elliott2002; @sillen1991], phosphate removal should directly track carbonate loss. @lebon2016 used the ratio of the amide I and ν~3~PO~4~ absorbance bands $\left( \frac{B_{1650}}{B_{1020}} \right)$ to track the carbon and nitrogen content of archaeological bone samples. The ν~3~PO~4~ band is poorly resolved in demineralized collagen and the 1020 cm^-1^ region and is instead a broad slope, on the "shoulder" of the amide III region (see: @fig:workflow). @roche2010 proposed a similar index the Water-Amide-on-Phosphate-Index (WAMPI) as the ratio of the Amide I and ν~2~PO~4~ absorbance bands $\left( \frac{B_{1650}}{B_{605}} \right)$ to track organic loss fossil bone. We use the WAMPI as our proxy for ratio of the organic and inorganic components of bone, where higher WAMPI values should correspond to mineral removal. 

# Materials and Methods {#sec:methods}

## Sample Collection {#sec:methods_collection}

We selected three materials for analysis; dentine from a modern domestic goat (*Capra hircus*) tooth, bone from a white tailed deer (*Odocoileus virginianus*), and teeth from a blue shark (*Prionace glauca*). The goat and deer specimens were fortuitously collected and the shark teeth were collected as part of a previous study [@kim2012a]. We cleaned each sample of surficial contamination using a toothbrush and deionized water before grinding into a fine powder using either an agate mortar and pestle or SPEX 8000M Mixer Mill. Since blue shark teeth are quite small, we homogenized several teeth from the same individual and functional position to obtain enough material for our experiments. The resulting powders for all specimens were further homogenized via repeated stirring using a vortexer to minimize effects from isotopic zoning in mammal teeth  [@trayler2017; @kohn1998] and variations among multiple teeth from individual sharks [@shipley2021]. 

## Demineralization {#sec:methods_preparation}

We tested the efficacy of mineral removal in 5 minute increments from 5 to 60 minutes, and 10 minute increments from 70 to 120 minutes. Finally we also tested 18 and 24 hours time steps. All experiments were performed in triplicate. For each time step we weighed 2.5 - 4 mg of powdered bone or dentine into 1.7 mL micro-centrifuge tubes and added 1 mL of cold (4°C) 0.1M hydrochloric acid. Sample were briefly stirred using a vortexer and then placed in a 4°C refrigerator (@fig:workflow). Five minutes before the specified amount of time for each aliquot the samples were removed from the refrigerator and centrifuged at 10,000 RPM for five minutes, and promptly rinsed 5 times with deionized water. For example, the 5-minute sample was placed directly in the centrifuge after acidification, and the 60-minute time step samples spent 55 minutes in the refrigerator and 5 minutes in the centrifuge for a total of 60 minutes in acid. After rising the samples were frozen and lyophilized prior to FTIR and stable isotope analysis.

## FTIR {#sec:methods_ftir}

We collected ATR-FTIR spectra using a Bruker Vertex 70 Far-Infrared FTIR housed in the Nuclear Magnetic Resonance Facility at the University of California, Merced. Spectra were collected from 400 - 2000 cm^-1^ for 32 scans at a resolution of 4 cm^-1^.  We subtracted the background of each of each spectrum by fitting a smoothed spline to several baseline points (points expected to have an FTIR absorbance of 0) and smoothed each spectra slightly [@stuart2004]. We then calculated the WAMPI for each spectrum by dividing the height of the amide I band at 1630 cm^-1^ by the height of the ν~2~PO~4~ band at 535 cm^-1^. Since the band positions are approximate, we located the local maxima for each band with a window of ±15 cm^-1^. All corrections and calculations were performed  using a custom R scripts [@rcoreteam2021], available in the supplementary material.

## Stable Isotope Analysis {#sec:methods_isotopes}

The δ^13^C and δ^15^N values and elemental carbon and nitrogen contents of all samples were measured using a Costech 4010 Elemental Analyzer coupled with a Delta V+ Isotope Ratio Mass Spectrometer housed in the Stable Isotope Ecosystem Laboratory of the University of California, Merced (SIELO). Carbon and nitrogen isotope compositions were corrected for instrument drift, mass linearity, and standardized to the international VPDB and AIR scales using the USGS 40 and USGS 41a standard reference materials. The average reproducibility for these reference materials was ±0.12‰ for δ^13^C and ±0.15‰ for δ^15^N. We also analyzed several aliquots of a homogenized squid tissue as an in-house reference which returned δ^13^C and δ^15^N values of -18.8±0.1‰ and 11.8±0.2‰, respectively, which are indistinguishable from the long-term SIELO average.

# Results and Discussion {#sec:results}

All data (FTIR spectra, elemental content, and stable isotope compositions) are available in the supplemental material and at [github.com/robintrayler/collagen_demineralization](https://github.com/robintrayler/collagen_demineralization). 

![Fractional weight remaining (A-C) and C/N ratios (D-F) for all samples. The dashed lines in panels D-F indicates proposed acceptable ranges for well preserved collagen. Long dashes (black):  is the 2.9--3.6 range of DeNiro[@deniro1985] and Ambrose[@ambrose1990]. Paired-dash line (medium grey) is the more conservative range of 3.00--3.30 of Guiry and Szpak[@guiry2020] and short-dashed line (light grey) is 3.1--3.5 acceptable range of Van Klinken[@vanklinken1999].](./figures/final_figures/yield.pdf){#fig:yield width=100%}

## Collagen Yield and Quality {#sec:results_yield}

The fractional weight remaining and C:N~atomic~ for all samples are shown in @fig:yield. In general, all samples showed a rapid reduction in fractional weight after 5 minutes of acid treatment, followed by a prolonged period of weight loss until the fractional weight stabilized. We interpret the weight of time-steps making up this plateau as indicative of the final collagen yield. *Capra* dentine sample weights stabilized after only 5 minutes for an average yield of 9.5±1.1%. The *Odocoileus* bone sample weights took longer to stabilize, with a plateau after about 20 minutes, for a final yield of 18.6±2.6%. Finally, while the *Prionace* sample weights appear to plateau after about 30 minutes, the 18 and 24 hour time steps show a further reduction in sample weight suggesting that full mineral removal took between 2 and 18 hours.

In all cases, untreated samples (time 0) had C:N~atomic~ higher than 3.6 indicating the contribution of carbonate-bound carbon. Most acid treated samples had C:N~atomic~ within the broadest acceptable range for well preserved collagen (2.9--3.6) [@ambrose1990; @vanklinken1999] although not all samples fell within the more conservative ranges proposed by Guiry and Szpak[@guiry2020] and Van Klinken et al.[@vanklinken1999]. In particular the C:N~atomic~ values for our *Odocoileus* and *Prionace* samples were systematically higher than the 3.30 Guiry and Szpak[@guiry2020]. Given that we did not attempt to remove lipids from  our collagen samples prior to analysis, we attribute these slightly higher C:N~atomic~ values to lipid inclusion. 

## FTIR Spectroscopy {#sec:results_ftir}
Infrared spectra for all samples are shown in @fig:spectra. Untreated samples (0 minutes) show the expected spectra for collagen-bioapatite mixtures, with prominent absorbance bands for mineral (CO~3~: 880, 1415, 1545 cm^-1^; PO~4~: 565 1020 cm^-1^) and organic (amide I; 1630 cm^-1^) phases. As acid treatment time increased, the absorbance bands associated with structural phosphate and carbonate became less prominent, while the bands associated with organic content became more pronounced. 

![FTIR spectra for *Capra*, *Odocoileus*, and *Prionace* bioapatite and collagen.](./figures/final_figures/all_spectra.pdf){#fig:spectra width=100%}

The 18 and 24 hour treatment groups returned the expected spectrum for pure collagen, and the mean WAMPI for these samples across all materials is 6.7±1.5 (±2σ; absorbance/absorbance) which we use as the acceptable range for complete mineral removal (see shaded area on @fig:isotopes panel G-I). With the exception of untreated dentine, nearly all of our *Capra* samples fell within the acceptable range for full mineral removal. However, the 110 and 120 minute time steps did not but FTIR spectra for these samples (@fig:spectra) do not show any residual CO~3~ or PO~4~ derived absorbance bands. *Odocoileus* WAMPI values do not overlap the acceptable range until 20 minutes of acidification, which corresponds well with our observation that the sample fractional weight reached a plateau at this time (@fig:yield). None of the 0 minute to 2 hour  *Prionace* samples had WAMPI values within the acceptable range, suggesting that full mineral removal took between 2 and 18 hours. Again, this agrees with our fractional weight observations where *Prionace* samples show a prolonged, gradual reduction in sample weight over the entire period of observation. 

![Stable isotope data (A-C: δ^13^C values;  D-F: δ^15^N values) and FTIR index (G-I: WAMPI) for all samples. Colored points with error bars are the mean ±2 standard deviations for each time step. In many cases the error bars are smaller than the symbol. The dashed grey lines on panels A - F indicate long-term ±2σ analytical reproducibility, centered on the data. The shaded grey band on panels G - H indicates the mean±2σ of WAMPI values for 18 and 24 hours samples, which we interpret as the WAMPI range for fully demineralized collagen.](./figures/final_figures/isotope_data.pdf){#fig:isotopes width=100%}

## Stable Isotopes {#sec:results_isotope}

### Carbon Isotopes

Both *Capra* and *Odocoileus* carbon isotope compositions shifted lower after 5 minutes of acid treatment, suggesting a rapid removal of structural carbonate. After 5 minutes δ^13^C values for these two materials show small variations in isotopic composition although within analytical uncertainty. *Prionace* samples δ^13^C values show very little change from 0 minutes to 2 hours, but the 18 and 24 hour time steps have lower δ^13^C values relative to the shorter time steps. Furthermore, this shift is larger than the analytical uncertainty envelope, suggesting material changes to isotope compositions in the 18 and 24 hour samples. Curiously, the untreated *Prionace* samples do not show carbon isotope enrichment associated with carbonate-bound present in both the *Capra* and *Odocoileus* samples, suggesting either lower carbonate contents or a smaller enrichment between CO~3~ and collagen. 

### Nitrogen Isotopes  

While δ^15^N values from each material show small changes across time steps, none of the variation was larger than the analytical reproducibility envelope (@fig:isotopes D-E). **I need to flesh this out more**

## Carbonate Removal {#sec:carbonate_removal}

Several studies have suggested that acid treatment of mineralized tissues is unwarranted as it may influence δ^13^C and δ^15^N values, and the influence of carbonate bound carbon is small [@turnertomaszewicz2015; @jacob2005; @mateo2008; @mateo2008]. However, these studies have mostly focused on marine invertebrates with only @turnertomaszewicz2015 investigating the influence of mineral removal in vertebrate bone, from marine turtles. At least for mammals, our results clearly contradict this recommendation and show that removing carbonate bound carbon has significant, measurable effects on δ^13^C values, and little to no effect on δ^15^N values, for our test materials. For reference, the *Capra* and *Odocoileus* samples show a 0.5 to 1‰ reduction in δ^13^C after carbonate removal, in line with our predictions (see: @sec:background_composition). Small changed in carbon isotope composition will affect paleoenviromental and paleodietary interpretations. For example, a 1‰ shift in δ^13^C could have a large impact on dietary modeling [e.g., @phillips2012] and paleoprecipitation calculations [@kohn2010]. Since bone carbonate contents can vary significantly, we feel the most straightforward method of accounting for the different isotopic fractionations among diet, carbonate, and collagen is to simply remove the carbonate-bearing mineral fraction.

The need for mineral removal in our shark teeth is less clear. There is no obvious influence of carbonate-bound carbon of δ^13^C values from 0 minutes to 2 hours in our experiments, while the 18 and 24 hour time steps have slightly lower and more variable δ^13^C values. In contrast to mammals, shark bioapatite is primarily fluorapatite [Ca~5~(PO~4~)F] and has overall lower CO~3~ contents, and the diet-tissue carbon isotope enrichment factor for shark bioapatite are poorly understood  and may even vary [@vennemann2001]. This suggests that there may not be a large carbon isotope fractionation between carbonate and collagen, at least in the case of our specific *Prionace* sample. Fluroapatite is also less soluble that hydroxyapatite [@posner1984]. Since the our measured WAMPI values for *Prionace* teeth suggest that full mineral removal took between 2 and 18 hours, so an alternative explanation for the observed trend in δ^13^C values is that carbonate-bound carbon was not completely removed until after 2 hours of reaction time. 

## Evaluating Demineralization Methods
* lipids can also be detected using FTIR [@liden1995]


# Conclusions {#sec:conclusions}



# Supplementary Information {#sec:sup_info}

All infrared spectra, stable isotope data, analysis code, and a draft version of this manuscript are available on at [github.com/robintrayler/collagen_demineralization](https://github.com/robintrayler/collagen_demineralization)

# Acknowledgments
We thank Maya Morris for her help with time step experiments and Dr. David Rice for  his assisting with FTIR data collection. We also thank Gina Palefsky for providing the *Odocoileus* bone and Matthew J. Kohn for providing the *Capra* tooth.

\pagebreak

# Supplemental Tables 

|  band position (cm^-1^) | Chemical Group          | Reference                |
|:-----------------------:|:-----------------------:|:------------------------:|
|           1630          | Amide I (CO–NH)         | @botta2012               |
|           1551          | Amide II (CO–NH)        | @botta2012               |
|           1545          | A-Type Carbonate (CO~3~)| @legeros1991; @rey1991   |
|           1415          | B-Type Carbonate (CO~3~)| @legeros1991; @rey1991   |
|           1231          | Amide III (CO–NH)       | @botta2012               |
|           1020          |  Phosphate (ν~3~PO~4~)  |                          |
|            880          |  Carbonate (CO~3~)      |                          |
|            545          |  Phosphate (ν~2~PO~4~)  |                          |

Table: Nominal FTIR band positions of several relevant chemical groups. Actually band positions may be shifted by several cm^-1^. {#tbl:bands}

|         Index          |              Formula              |    Reference    |
| :--------------------: | :-------------------------------: | :-------------: |
|          PCI           | $\frac{B_{605}+B_{565}}{V_{590}}$ | @sponheimer1999 |
|          BPI           |    $\frac{B_{1415}}{B_{605}}$     |  @legeros1991   |
|          API           |    $\frac{B_{1545}}{B_{605}}$     | @sponheimer1999 |
|        WAMPI^\*^       |    $\frac{B_{1650}}{B_{545}}$     |   @roche2010    |
| $\frac{amide~I}{PO_4}$ |    $\frac{B_{1650}}{B_{1020}}$    |   @lebon2016    |

Table: Commonly used FTIR indices. *B* indicates the absorbance band height at the specified wavenumber, while *V* indicates the depth of the "valley". Since the maximum height of a particular absorbance band may not occur at exactly the reported wavenumber, we instead calculated the indices above using the local maxima or minima within ±15 cm^-1^. ^\*^Index used in this study. {#tbl:indices}

# References {.unnumbered}
:::{#refs}
:::