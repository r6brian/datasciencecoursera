# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, variable )
# which of these four sources have seen decreases emissions from 1999–2008 for Baltimore City? 
# which have seen increases in emissions from 1999–2008?

# using ggplot2 library
library(ggplot2)

# Read data files
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset NEI data, select * rows for Baltimore(fip=24510).
baltimoreEmissions <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
baltimoreEmissionsByYearType <- aggregate(Emissions ~ year + type, baltimoreEmissions, sum)

# plot a bar graph
png('plot3.png')

ggp <- ggplot(baltimoreEmissions,aes(factor(year),Emissions,fill=type)) +
        geom_bar(aes(fill=year),stat="identity") +
        theme_gray() + 
        guides(fill=FALSE)+
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("Emissions for Baltimore City 1999-2008 by Source Type"))
print(ggp)

dev.off()