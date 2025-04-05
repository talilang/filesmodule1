#set directory
setwd("C:/Users/Ariella's laptop/OneDrive - weizmann.ac.il/MSc weizmann/Coursera exploratory data analysis")
HH = "household_power_consumption.txt"

#read and prep data
data <- read.table(HH, header=TRUE, sep=";", na.strings = "?")
Rdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime_str <- paste(Rdata$Date, Rdata$Time)
DT <- as.POSIXct(datetime_str, format = "%d/%m/%Y %H:%M:%S")
list2env(lapply(setNames(Rdata[, c("Global_active_power", "Global_reactive_power", "Voltage", 
                                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")], 
                  c("gap", "grp", "volt", "sm1", "sm2", "sm3")), as.numeric),.GlobalEnv)

# Create the PNG file with specified width and height
png("plot4.png", width = 480, height = 480)

#plot data for plot4
par(mfrow = c(2, 2))
plot(DT, gap, type="l", xlab="", ylab="Global Active Power")
plot(DT, volt, type="l", xlab="datetime", ylab="Voltage")
plot(DT, sm1, type="l", xlab="", ylab="Energy Submetering")
  lines(DT, sm2, type="l", col="red")
  lines(DT, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1, col=c("black", "red", "blue"), bty="n")
plot(DT, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

# close the PNG file
dev.off()

