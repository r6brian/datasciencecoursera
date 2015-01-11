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

## extract only the reactive power column from the subset of data as a numeric vectory
globalReactivePower <- as.numeric(hpcSubset$Global_reactive_power)

## extract the voltage column from the subset of data as a numeric vectory
voltage <- as.numeric(hpcSubset$Voltage)

## creating variables for the various sub electric meters
subMetering1 <- as.numeric(hpcSubset$Sub_metering_1)
subMetering2 <- as.numeric(hpcSubset$Sub_metering_2)
subMetering3 <- as.numeric(hpcSubset$Sub_metering_3)

## create a plot diagram with the three various subMetering against time.
png("plot4.png", width=480, height=480)

## create a 2 column 2 row Graphical Parameters
par(mfrow = c(2, 2)) 

## plot 1: 1 x 1 active power against time
plot(data$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## plot 2: 1 X 2 voltage against time
plot(data$Datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## plot 3: 2 X 1 energy sub metering against time with a legend at the topright corner
plot(data$Datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(data$Datetime, subMetering2, type="l", col="red")
lines(data$Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, bty="n", col=c("black", "red", "blue"))

## plot 4: 2 x 2 reactive power against time
plot(data$Datetime, globalReactivePower, type="l", xlab="datetime", ylab="global_reactive_power", cex=0.2)

dev.off()
