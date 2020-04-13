#3.Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a
#plot answer this question.


library(ggplot2)

nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

baltimore <- nei[nei$fips == '24510',]
emmissions <- aggregate(Emissions ~ year + type, baltimore, sum)

names(emmissions)[1] <- "year"

png("plot3.png", width = 480, height = 480)

ggplot(data = emmissions, aes(x=year, y=Emissions, color = type)) + geom_line() 

dev.off()


#Another method
#g<-ggplot(aes(x = year, y = Emissions, fill=type), data=NEIdataBaltimore)
#g+geom_bar(stat="identity")+
#  facet_grid(.~type)+
#  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
#  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))+
#  guides(fill=FALSE)
