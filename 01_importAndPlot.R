library(plyr)
library(ggplot2)

# import data from tab delimited file
gDat <- read.delim("gapminderDataFiveYear.txt", header = TRUE)

# plot mean life expectancy over the years for each continent
ggplot(ddply(gDat, ~continent + year, summarize, meanLifeExp = mean(lifeExp)), aes(year, meanLifeExp, color = continent)) + geom_point() + geom_smooth(method = "loess")

# write plot to SVG output file 
svg("meanLifeExpPerContinent.svg")
ggplot(ddply(gDat, ~continent + year, summarize, meanLifeExp = mean(lifeExp)), aes(year, meanLifeExp, color = continent)) + geom_point() + geom_smooth(method = "loess")
dev.off()

# Funtion to order life expectancy
orderByLifeExp <- function(x) {
x[order(x$lifeExp),]
}

# Write to tab-delimited file of data sorted by life expectany per continent
write.table(ddply(gDat, ~continent, orderByLifeExp), "gDat.continentSortedByLifeExp.txt", quote = FALSE, sep = "\t")
