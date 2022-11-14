# Evaluating the Efficacy of Collagen Isolation Using Stable Isotope Analysis and Infrared Spectroscopy

This repository contains the data, code, and manuscript for **Trayler, R. B., Valencia Landa, P., Kim, S. L., (in review) *Evaluating the Efficacy of Collagen Isolation Using Stable Isotope Analysis and Infrared Spectroscopy*, Journal of Archaeological Science** 

## File Structure 

```
.
├── data
    └── deer_ATR          # raw deer data 
    └── goat_ATR          # raw goat data
    └── shark_ART         # raw shark data
    └── isotope_data      # stable isotope data
    └── processed_spectra # post processed FTIR spectra 
├── R                     # R scripts to be run in numerical order 0 - 4
    └── functions         # data processing functions 
├── figures               # output directory for pdf figures
├── manuscript.md         # pandoc markdown formatted manuscript
├── reviewer_comments.md  # pandoc markdown formatted responce to reviwers
└── README.md
```

## Manuscript

This manuscript is written in [`Pandoc`](https://pandoc.org) flavored markdown. Follow the instructions [here](https://pandoc.org/installing.html) to install `pandoc`. The manuscript also relies on the [`pandoc-crossref`](https://github.com/lierdakil/pandoc-crossref) filter to handle figure, table, and section numbering. 

The manuscript file, `manuscript.md` can be compiled into a nicely formatted pdf but running the following pandoc command.

```bash
pandoc -s manuscript.md -o manuscript.pdf --pdf-engine=xelatex --filter pandoc-crossref --citeproc --number-sections
```



