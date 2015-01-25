# 2. Have total emissions from PM2.5 decreased in Baltimore City, Maryland from 1999 to 2008?

# Read data files
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset NEI data, select * rows for Baltimore(fip=24510).
baltimoreEmissions <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
baltimoreEmissionsByYear <- aggregate(Emissions ~ year, baltimoreEmissions, sum)

# plot a bar graph
png('plot2.png')
barplot(height=baltimoreEmissionsByYear$Emissions,
        names.arg=baltimoreEmissionsByYear$year,
        xlab="years", 
        ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions in the city of Baltimore, by year'))
dev.off()