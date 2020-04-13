#6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
#Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater 
#changes over time in motor vehicle emissions?


nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")


vehicle  <- grepl("vehicle", scc$SCC.Level.Two, ignore.case=TRUE)
vehicalData <- scc[vehicle,]

vehicleData <- merge(nei, vehicalData, by = "SCC")

data <- subset(vehicleData, fips=='24510' | fips=='06037')
data$city <- ifelse(data$fips=="24510", "Baltimore", "Los Angeles")

data1 <- aggregate(Emissions ~ year + city, data, sum)

png("plot6.png", width = 480, height = 480)

ggplot(data = data1, aes(x=year, y=Emissions, color = city)) + geom_line() 

dev.off()

#Another method
#g <- ggplot(bothAGG, aes(factor(year), Emissions))
#p <- g + xlab("Year") + ylab("PM2.5 Emissions (tons)") + facet_grid(. ~ fips) + geom_bar(stat = "identity") + ggtitle("PM2.5 Emission from Motor Vehicles in Baltimore City and Los Angeles")

#labels <- c("24510" = "Baltimore", "06037" = "Los Angeles")
#plot6 = ggplot(Balt.LA.Motveh, aes(x=as.factor(year), y=log10(Emissions), group = year))
#plot6 = plot6 + geom_boxplot() + facet_grid(.~fips, labeller = labeller(fips = labels)) + labs(title = "PM2.5 Emissions of motor vehicle-related sources in Baltimore and Los Angeles", x = "Year")

