#!/bin/sh

# Generate TeX file from the sources.
./invoice/generator.py -c sender/koodilehto.json -r companies/demo.json -t tex/template.tex -o demo.tex

# Compile the TeX file. Now you should have demo.pdf invoice.
pdflatex demo.tex
rm *.aux *.log *.out
rm demo.tex

