## assigning file to local variable
dataFile <- "./data/household_power_consumption.txt"

## reading csv file and assigning it to a local data frame
hpc<-read.csv(dataFile, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## create a variable for the start date of the subset of data
startDate <- as.Date("2007-02-01")

## create a variable for the end date of the subset of data
endDate <- as.Date("2007-02-02")

## convert the hpc$Date to the default data format 16/12/2006 -> 2006-12-16 
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")

## create a subset of the date based upon the startDate and endDate
hpcSubset <- subset(hpc, subset = (hpc$Date >= startDate & hpc$Date <= endDate))

## convert date & time columns into a single dateTime object
## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## extract only the active power column from the subset of data as a numeric vectory
globalActivePower <- as.numeric(hpcSubset$Global_active_power)

## create a local plot to screen
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
