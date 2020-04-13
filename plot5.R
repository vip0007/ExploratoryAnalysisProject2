#5.How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

vehicle  <- grep("vehicle", scc$SCC.Level.Two, ignore.case=TRUE)
vehicalData <- scc[vehicle,]

mergeData <- merge(nei, vehicalData, by = "SCC")
emmissions <- tapply(mergeData$Emissions, mergeData$year, sum)

png("plot5.png", width = 480, height = 480)

barplot(emmissions, xlab = "Year", ylab = "Total Emissions PM2.5 Tons From vehicle", 
        col = c("RED","BLUE","GREEN","YELLOW"), main = "Total PM2.5 emission From vehicle")
dev.off()
