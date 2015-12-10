# Read the file from the location it has been kept.As of now its been placed in my windows coursera assignements directory
dataFile <- "D:\\Study\\DataScience\\Coursera_Assignments\\Course4\\data\\household_power_consumption.txt"

# Reading the content of file from the location mentioned above
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Getting subset of data between date range asked in assinments
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#  converting the Date and Time variables to Date/Time classes in R as suggested in assignments
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Getting global active power dataset from the subset retrieved above.
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Creating png in the coursera assignments directory with name,width and height as asked in assignment.
png("D:\\Study\\DataScience\\Coursera_Assignments\\Course4\\plot2.png", width=480, height=480)

# Plotting Global active power against days/dates
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Closing the device connection which is windows in my case after plotting is done
dev.off()