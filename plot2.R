#2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}
#fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

baltimore <- nei[nei$fips == '24510',]
emmissions <- tapply(baltimore$Emissions, baltimore$year, sum)

png("plot2.png", width = 480, height = 480)
barplot(emmissions, xlab = "Year", ylab = "Total Emissions PM2.5 Tons Baltimore", 
        col = c("RED","BLUE","GREEN","YELLOW"), main = "Total PM2.5 emission Baltimore")
dev.off()