all: importAndPlot importAndProcess

importAndPlot: gapminderDataFiveYear.txt 01_importAndPlot.R
	Rscript 01_importAndPlot.R

importAndProcess: gDat.continentSortedByLifeExp.txt 02_importAndProcess.R
	Rscript 02_importAndProcess.R

clean:
	/bin/rm Rplots.pdf gDat.continentSortedByLifeExp.txt *.svg