#4.Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)

nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

coal <- grep("coal",scc$Short.Name, ignore.case = T)
coalData <- scc[coal,]

mergeData <- merge(nei, coalData, by = "SCC")
emmissions <- tapply(mergeData$Emissions, mergeData$year, sum)

png("plot4.png", width = 480, height = 480)

barplot(emmissions, xlab = "Year", ylab = "Total Emissions PM2.5 Tons From Coal", 
        col = c("RED","BLUE","GREEN","YELLOW"), main = "Total PM2.5 emission From Coal")
dev.off()