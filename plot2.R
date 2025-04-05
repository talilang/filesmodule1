#set directory
setwd("C:/Users/Ariella's laptop/OneDrive - weizmann.ac.il/MSc weizmann/Coursera exploratory data analysis")
HH = "household_power_consumption.txt"

#read and prep data
data <- read.table(HH, header = TRUE, sep = ";", 
                   col.names = c("date", "time", "globalActivePower",
                                 "globalReactivePower", "voltage", "globalIntensity",
                                 "subMetering1", "subMetering2", "subMetering3"),
                   colClasses = c("character", "character", rep("numeric", 7)), 
                   na.strings = "?")
data$date <- as.Date(data$date, format = "%d/%m/%Y")
data <- subset(data, date == as.Date("2007-02-01") | date == as.Date("2007-02-02"))
datetime <- data$globalActivePower

# Create the PNG file with specified width and height
png("plot2.png", width = 480, height = 480)

#plot data for plot2
plot(datetime, type="l",xaxt="n",ylab="Global Active Power (kilowatts)", xlab = "")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu","Fri","Sat"))  

# close the PNG file
dev.off()

