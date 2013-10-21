library(lattice)
library(plyr)

# Read file written out from preious script
hDat <- read.delim("gDat.continentSortedByLifeExp.txt", header = TRUE)

# Set minimum year
yearMin <- 1952

# function to return intercept and slope of a linear regression model
lifeExpStats <- function(x) {
estCoefs <- coef(lm(x$lifeExp ~ I(x$year - yearMin)))
names(estCoefs) <- c("intercept", "slope")
return(estCoefs)
}

# caluclate intercept and slope for each country for each continent
lifeExpLM <- ddply(hDat, ~ continent + country, lifeExpStats)

# write function to find best and worst 3 by slope
bestAndWorst <- function(x) {
rbind(x[head(order(x$slope, decreasing = TRUE), n=3),],
x[head(order(x$slope, decreasing = FALSE), n=3),])
}

bestAndWorstRegressionCountries <- ddply(lifeExpLM, ~ continent, bestAndWorst)

svg("bestAndWorstAfricanCountries.svg")
xyplot(lifeExp ~ year | country, subset(hDat, country %in% bestAndWorstRegressionCountries$country), subset = continent == "Africa", type = c("p", "r"))
dev.off()

svg("bestAndWorstAmericanCountries.svg")
xyplot(lifeExp ~ year | country, subset(hDat, country %in% bestAndWorstRegressionCountries$country), subset = continent == "Americas", type = c("p", "r"))
dev.off()

svg("bestAndWorstAsianCountries.svg")
xyplot(lifeExp ~ year | country, subset(hDat, country %in% bestAndWorstRegressionCountries$country), subset = continent == "Asia", type = c("p", "r"))
dev.off()

svg("bestAndWorstEuropeanCountries.svg")
xyplot(lifeExp ~ year | country, subset(hDat, country %in% bestAndWorstRegressionCountries$country), subset = continent == "Europe", type = c("p", "r"))
dev.off()
