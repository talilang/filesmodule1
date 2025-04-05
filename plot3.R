#set directory
setwd("C:/Users/Ariella's laptop/OneDrive - weizmann.ac.il/MSc weizmann/Coursera exploratory data analysis")
HH = "household_power_consumption.txt"

#read and prep data
data <- read.table(HH, header=TRUE, sep=";", na.strings = "?")
Rdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime_str <- paste(Rdata$Date, Rdata$Time)
DT <- as.POSIXct(datetime_str, format = "%d/%m/%Y %H:%M:%S")
list2env(lapply(setNames(Rdata[, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")], 
                         c("sm1", "sm2", "sm3")), as.numeric), .GlobalEnv)

# Create the PNG file with specified width and height
png("plot3.png", width = 480, height = 480)

#plot data for plot3
plot(DT, sm1, type = "l", col = "black", ylab = "Energy Submetering", xlab = "")
lines(DT, sm2, type = "l", col = "red")
lines(DT, sm3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the PNG file
dev.off()
