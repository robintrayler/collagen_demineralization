<!-- copy and paste this into the terminal to compile to a PDF -->
cd ~/Dropbox/collagen_demineralization
name="collagen_manuscript_$(date +%Y%m%d)"
pandoc -s --filter pandoc-crossref --citeproc --number-sections --pdf-engine=xelatex -o "./pdf_drafts/$name.pdf" manuscript.md


<!-- copy and paste this into the terminal to compile to a HTML file -->
cd ~/Dropbox/collagen_demineralization
name="collagen_manuscript_$(date +%Y%m%d)"
pandoc -s --filter pandoc-crossref --citeproc --number-sections --pdf-engine=xelatex -o "./pdf_drafts/$name.html" manuscript.md

