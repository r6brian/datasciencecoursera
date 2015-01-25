# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California 

# using ggplot2 library
library(ggplot2)

# Read data files
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# for  source = motor vehicle
# Subset NEI data, select * rows && aggregate using sum of all emissions data by year
baltimoreRoadEmissions <- NEI[(NEI$fips=="24510" & (NEI$type=="ON-ROAD")),]
baltimoreRoadEmissionsByYear <- aggregate(Emissions ~ year, baltimoreRoadEmissions, sum)
baltimoreRoadEmissionsByYear$city <- "Baltimore City, MD"

# Subset NEI data, select * rows && aggregate using sum of all emissions data by year
losAngelesRoadEmissions <- NEI[(NEI$fips=="06037" & (NEI$type=="ON-ROAD")),]
losAngelesRoadEmissionsByYear <- aggregate(Emissions ~ year, losAngelesRoadEmissions, sum)
losAngelesRoadEmissionsByYear$city <- "Los Angeles County, CA"

# merge the two aggregrates of data
cityRoadEmissionByYear <- rbind(baltimoreRoadEmissionsByYear, losAngelesRoadEmissionsByYear)

# plot a bar graph
png("plot6.png",width=480,height=680,units="px",bg="transparent")

# plot a bar graph
ggp <- ggplot(cityRoadEmissionByYear,aes(factor(year),Emissions, fill=city)) +
        facet_grid(city  ~ ., scales="free") +
        geom_bar(aes(fill=year),stat="identity") +
        theme_gray() +  
        guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
        labs(title=expression("Comparison of the Total Emissions from vehicles in the cities \n of Baltimore & Los Angeles from 1999-2008"))

print(ggp)

dev.off()
