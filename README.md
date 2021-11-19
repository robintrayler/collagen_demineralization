# Collagen Demineralization

This repository contains the data, code, and manuscript for a project looking at the systematics of collagen extraction from bone using FTIR and stable isotope analysis.

## File Structure 

```
.
├── data
    └── deer_ABS          # raw deer data 
    └── goat_ABS          # raw goat data
    └── shark_ABS         # raw shark data
    └── isotope_data      # stable isotope data
    └── processed_spectra # post processed FTIR spectra 
├── R                     # R scripts to be run in numerical order 0 - 3
    └── functions         # data processing functions 
├── figures               # output directory for pdf figures
├── manuscript.md         # pandco markdown formatted manuscript
├── manuscript_files      # files required for manuscript compiling
└── README.md

```

## Compiling 

```
pandoc -s manuscript.md -o manuscript.pdf --pdf-engine=xelatex --filter pandoc-crossref --citeproc --lua-filter scholarly-metadata.lua --lua-filter author-info-blocks.lua
```
 
