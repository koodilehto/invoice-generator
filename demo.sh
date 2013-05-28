#!/bin/sh

./invoice/generator.py -c sender/koodilehto.json -r companies/demo.json -t tex/template.tex -o demo.tex

#pdflatex demo.tex
#rm *.aux *.log *.out

