# Read the file from the location it has been kept.As of now its been placed in my windows coursera assignements directory
dataFile <- "D:\\Study\\DataScience\\Coursera_Assignments\\Course4\\data\\household_power_consumption.txt"

# Reading the content of file from the location mentioned above
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Getting subset of data between date range asked in assinments
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#  converting the Date and Time variables to Date/Time classes in R as suggested in assignments
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Getting Global Activer Power , Submetering 1, Submetering 2 , Submetering from the subset of data retrieved above
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Creating png in the coursera assignments directory with name,width and height as asked in assignment.
png("D:\\Study\\DataScience\\Coursera_Assignments\\Course4\\plot3.png", width=480, height=480)

# Plotting Energy Submetering against days/dates for submetring 1 , submetering 2 and submetering3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

# Draw information on topright to tell which color indicates which submetering
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Closing the device connection which is windows in my case after plotting is done
dev.off()