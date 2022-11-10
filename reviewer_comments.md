---
title: "Evaluating the Efficacy of Collagen Isolation Using Stable Isotope Analysis and Infrared Spectroscopy - Response to Reviewers"
author:
  - Robin B. Trayler
  - Pedro Valencia Landa
  - Sora L. Kim
mainfont: "Helvetica"
fontsize: 12pt
geometry: margin=1.0in
bibliography: ./bibtex.bib
csl: ./journal-of-archaeological-science.csl
tblPrefix: Table
figPrefix: Figure
secPrefix: Section
indent: true
header-includes:
    - \usepackage{lineno}
    - \linenumbers
    - \usepackage{setspace}
    - \doublespacing
---

<!-- this will complete the manuscript using pandoc -->
<!-- PDF --> 
<!-- pandoc -s reviewer_comments.md -o reviewer_comments.pdf --pdf-engine=xelatex --filter pandoc-crossref --citeproc -->

<!-- word --> 
<!-- pandoc -s reviewer_comments.md -o reviewer_comments.docx --filter pandoc-crossref --citeproc --reference-doc=reference.docx -->

# Comments from the editors 

* The submitted manuscript by Trayler et al. provides a valuable contribution to methodological considerations in stable isotope analysis; I concur with both reviewers that following modest revisions, this paper is a suitable contribution to JAS and more broadly to isotope bioarchaeology/zooarchaeology.

# Reviewer 1 

## Overview
* This paper investigates the timing and efficacy of the removal of mineral (0.1 M HCL) from bone and tooth dentin using FTIR measurements. The study reinforces the need to remove structural carbonates from bone and dentinal collagen in order to obtain accurate stable C and N isotope measurements. The main conclusion is that FTIR can be used to track mineral loss in samples, which is useful for isotope researchers working with bone and tooth collagen samples. This paper does have significant merit and provides a procedure for evaluating demineralization times. I can see this being useful in the early phases of a research project in estimating ideal treatment times that are tailored to a set of samples of similar preservation. 

* The main concerns regarding the manuscript is that there are only three samples used and they are all different taxa. A larger sample size would provide more robust results and confidence in the conclusions. However, I understand that the authors were more interesting in showing these data as proof of concept.

> The reviewer is correct that our sample sample size is small. We also agree that this study serves as a proof of concept for method testing and development and not as a comprehensive review of collagen isolation across taxonomic groups.

* A more extensive literature review should be included that minimally covers how FTIR has been used to examine collagen and mineral properties. I realize most of the literature is about diagenesis (not sample treatment times and efficacy) but some discussion is warranted. 

> We have expanded section 2.3 "Fast Fourier Infrared Spectroscopy" to include more discussion of the past used of FTIR on bone and collagen in archaeological and paleontological contexts including investigating changes to bioapatite carbonate, crystallinity, organic content, as well as as a screening tool for radiocarbon and ancient DNA analysis. 

* There are also other methods that have been used to determine whether samples are still reacting with HCl as an indication of demineralization. This should be discussed as well.

> We have added some discussion of how previous studies have assessed the completeness of demineralization to section 2.2. Our understanding is that most stable isotope and radiocarbon studies of collagen have used qualitative metrics to assess the degree of demineralization that look for some combination of the cessation of bubbling from CO~2~ release, the "squishiness" of the bone pieces, and the visual appearance of a translucent collagen pseudomorph. For example:

>> Decalcification was determined by the flexibility and translucence of the sample and lack of effervescence. [@sealy2014]

>> As with method A, the samples were demineralized in 1 M HCl, at 4C for 1.5 -- 10h, until the release of CO~2~ could no longer be observed. [@jorkov2007]

>> ... 200–300 mg of bone was immersed in 0.5 M HCl, and the solution was changed every 24 h until the samples appeared visually demineralized. [@wilson2022] 

>> After all mineral had been removed, as evidenced by a translucent pale yellow collagen replica, the residue was washed 15 times ... [@tuross1988]

## Minor comments
* Abstract (page 1): SIA of bone and dentinal collagen is more commonly used on more recent archaeological remains (human and nonhuman fauna) than on extinct human and animal remains (where collagen preservation is more variable). I would rephrase this sentence to reflect this.

> We do not feel that stable isotope analysis on extinct taxa is rare. Yes, collagen isotope extraction is easier, and therefore more common, when working with more recent archaeological remains but it not uncommon with older material. Collagen isotope analysis is routinely used on Late Pleistocene fossils [@coltrain2004; @fox-dobbs2008; @fox-dobbs2006; @fox-dobbs2005; @landry2021; @fuller2020] including extinct human species [@bocherens2005; @bocherens2009]. Furthermore, *extinct* does not necessarily imply pre-Holocene and many recently extinct faunas have been investigated using stable isotope analysis of collagen including lemurs [@crowley2011], Moas [@rawlence2016], and giant tortoises [@vandersluis2014]. 
  
* Line 20: remove second "of" after "efficacy-of"

> Fixed

* Introduction (page 2: line 31): Collagen preservation from Middle Pleistocene samples is pretty rare based on my understanding of the literature. I would rephrase this sentence. 

> We have changed this to say "Late Pleistocene"

* Lines 37: "contains significant nitrogen contents" is awkward phrasing. 

> We have reworded this sentence to be less awkward. It now reads "has a significant nitrogen content..."

* Introduction (page 3: lines 58-60): It's unclear why results are being presented already in the Introduction section. Most of "Page 3" is really Materials and Methods and seems out of place here.

> We have moved some of the details of collagen extraction (lines ~42-45 in the submission manuscript) to the background section. We would prefer to keep the brief discussion of our results at the end of the introduction. we feel that summarizing the major points a a study early in the manuscript is a common technique to help orient a reader. 

* Elemental Composition of Bone (page 5: line 96): "collagen" is misspelled

> Fixed

* Line 101: "Demineralization " should be capitalized at the beginning of the sentence; 

> Fixed

lines 108-109: Sodium hydroxide is routinely used to remove contaminants from old samples (instead of saying "sometimes").

> Fixed

* Collagen Extraction (page 6: lines 124-125): In general, the Pestle et al. (2014) study found C and N collagen to be comparable but there were a couple of labs with results that deviated strongly from the average for all labs.

> We agree that there is at least one "outlier" lab in the cited study of @pestle2014. We have added "in most cases". We do note that the original study of  states: 

>>  However, the average pairwise difference between any two participating laboratories was only 0.2‰ for δ^13^C~col~ and 0.4‰ for δ^15^N~col~. These values are of such a small magnitude as to not be cause for great concern. As to causality, neither of the most obvious differences in pretreatment between participating laboratories (demineralizing reagent or humic acid removal) had a significant effect on the resulting isotope values.

> Which we feel in compatible with our interpretation of their results. 

* Collagen Extraction (page 7: lines 143-152): I recommend reading and citing this recent paper on C:N ratios (Schwarcz, Henry P., and Harmeet Nahal. "Theoretical and observed C/N ratios in human bone collagen." Journal of Archaeological Science 131 (2021): 105396.); 

> We have added a citation and short discussion of this paper to the last paragraph of section 2.2

* Line 158: remove comma after "quantitatively"

> Fixed

* Materials and Methods (page 8): lines 180-181: Clarify what is meant by "and in the functional position to obtain enough material for our experiments"

> Since sharks grow rows of teeth with a conveyer belt like system, functional position refers to the position in each column of teeth. In our case we collected several teeth from the same individual from the front-most tooth position. We have changed to text to say "from the same individual..." for clarity. 

* Collagen Yield and Quality (page 12): line 254: change "with in" to "within"

> Fixed

* Collagen Yield and Quality (page 14): line 290: remove comma after "(o minutes)"

> Fixed

* Fidelity of Stable Isotope Compositions (page 16) line 315: Change "significantly affected" to "affected." No stats were run.

> Fixed, we have changed this to say "substantially affected" which we feels reflects our data (~1‰ shifts) without the statistical implications of "significant"

* The Need for Mineral Removal (page 17): line 337: change "focus" to "focused"

> Fixed

* The Need for Mineral Removal (page 18): line 346: change "are" to "is"

> Fixed

* Evaluating Demineralization Methods (page 19): line 370: change "and approach" to "an approach"

> Fixed

* Conclusions (page 19): line 388: add "but" before "does not appear..."

> We have slightly reworded this sentence so that it is clear that the *acid* does not appear to affect the isotope compositions.  

# Reviewer 2
## Overview

* This is a nice short study on the need for mineral removal before collagen analysis and fits into the larger ecosystem of testing what we think we know about stable isotope analysis, with recent papers on quality control, body size effects, and the effects of bone turnover. The authors set up the study well and used varied materials of interest to the question at hand. The resulting quick demineralization of most samples was interesting as I was expecting a weak HCl solution to slow down the demineralization time. I did appreciate the easy to read graphics, which can be difficult in papers like these with multiple samples from multiple individuals and varied treatments. 

* Wondering if it should be stated a bit more clearly that perhaps the slow reaction time in Prionace teeth was due to the high mineral content of teeth? 

> We have added a two sentences to the end of section 4.2 explicitly states we view the mineral content and lower solubility as the reason for slower demineralization of the shark teeth. 

>> In contrast to mammals, shark bioapatite is primarily fluorapatite [Ca~5~(PO~4~)F], has overall lower CO3 contents, and is less soluble [@posner1984]. As a result of homogenizing whole teeth, Our Prionace samples also have a higher mineral content, which likely explains the slower demineralization of these samples.  

* I would publish with minor revisions, as this paper quite nicely shows the necessary step of removing mineral from collagen.

## Minor Comments 
* Line 337: focused instead of focus

> Fixed

* Line 370: "provides AN" instead of "provides AND"

> Fixed

* Line 392: coarse instead of course

> Fixed

\pagebreak

# References {.unnumbered}
:::{#refs}
:::