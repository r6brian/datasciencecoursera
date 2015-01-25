# 4. Across the United States, how have emissions from coal combustion-related sources changed 
# from 1999-2008?

# using ggplot2 library
library(ggplot2)

# Read data files
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# fetch all with columns with Coal from the SSC EI Sector -> logical vector 
isCombustableCoal <- grepl("Fuel Comb*Coal", SCC$EI.Sector, ignore.case=TRUE)
# fetch rows with based on Coal
combustableCoalSources <- SCC[is.combustion.coal,]
# Find emissions from coal combustion-related sources
coalEmissions <- NEI[(NEI$SCC %in% combustableCoalSources$SCC), ]
# aggregate by year to get total of coal emissions
coalEmissionsByYear <- aggregate(Emissions ~ year, coalEmissions, sum)

# plot a bar graph
png('plot4.png')

# plot a bar graph
ggp <- ggplot(coalEmissionsByYear,aes(factor(year),Emissions/10^5)) +
        geom_bar(aes(fill=year),stat="identity") +
        theme_gray() +  
        guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("Coal as a Source of Emissions Across US from 1999-2008"))

print(ggp)

dev.off()