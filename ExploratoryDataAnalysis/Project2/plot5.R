# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# using ggplot2 library
library(ggplot2)

# Read data files
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset NEI data, select * rows for Baltimore(fip=24510) && where source = motor vehicle
baltimoreRoadEmissions <- NEI[(NEI$fips=="24510" & (NEI$type=="ON-ROAD")),]

# Aggregate using sum the Baltimore emissions data by year
baltimoreRoadEmissionsByYear <- aggregate(Emissions ~ year, baltimoreRoadEmissions, sum)

# plot a bar graph
png('plot5.png')

# plot a bar graph
ggp <- ggplot(baltimoreRoadEmissionsByYear,aes(factor(year),Emissions)) +
        geom_bar(aes(fill=year),stat="identity") +
        theme_gray() +  
        guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
        labs(title=expression("Emissions from vehicles in the city of Baltimore from 1999-2008"))

print(ggp)

dev.off()