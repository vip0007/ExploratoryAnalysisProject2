#1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all
#sources for each of the years 1999, 2002, 2005, and 2008.


setwd("/Users/vipinaggarwal/Desktop/DataScienceRCS/4.ExploringData/Project2/ExploratoryAnalysisProject2")

nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")


emmissions <- tapply(nei$Emissions, nei$year, sum)

png("plot1.png", width = 480, height = 480)
barplot(emmissions, xlab = "Year", ylab = "Total Emissions PM2.5 Tons", 
        col = c("RED","BLUE","GREEN","YELLOW"), main = "Total PM2.5 emission")
dev.off()
