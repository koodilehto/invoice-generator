#!/bin/sh

# Generate TeX file from the sources.
./invoice/generator.py -c sender/koodilehto.json -r companies/demo.json -t tex/template.tex -o demo.tex

# Compile the TeX file. Now you should have demo.pdf invoice.
# TODO: These should be done in the code to generate 
# a naming scheme for the output file, e.g., sender_recipient_number.pdf
pdflatex demo.tex
rm *.aux *.log *.out
rm demo.tex

