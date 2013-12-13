545A_hw06
=========

A two part analysis of Gapminder data

Start with emtpy directory.  Download the following:
1. Makefile
2. 01_importAndPlot.R
3. gapminderDataFiveYear.txt

Run 'make importAndPlot' to run the first part of the analysis to generate
1. meanLifeExpPerContinent.svg
2. gDat.continentSortedByLifeExp.txt

> NOTE: in JB fork, svg replaced by png globally

To run the second part of the analysis.  Download script 02_importAndProcess.R and 
run 'make importAndProcess' to generate plots of countries with best and worst life
expectancy for per continents in svg format.

Run the two part analysis back to back by 'make'.

Clean up the directories by 'make clean'.
