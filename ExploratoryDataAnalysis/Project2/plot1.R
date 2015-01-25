# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

# Read data files
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# aggregrate based upon Emissions and Years
totalEmissions <- aggregate(Emissions ~ year, NEI, sum)

# plot a bar graph
png('plot1.png')
barplot(height=totalEmissions$Emissions/10^6, 
        names.arg=totalEmissions$year,
        xlab="years", 
        ylab=expression('total PM'[2]*' emission(10^6 Tons)'),
        main=expression('Total PM'[2]*' emissions at various years'))
dev.off()