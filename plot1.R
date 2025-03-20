#set directory
setwd("C:/Users/Ariella's laptop/OneDrive - weizmann.ac.il/MSc weizmann/Coursera exploratory data analysis")
HH = "household_power_consumption.txt"

#read and prep data
data <- read.table(HH, header=TRUE, sep=";", na.strings = "?")
Rdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
plot1 <- as.numeric(Rdata$Global_active_power)

# Create the PNG file with specified width and height
png("plot1.png", width=480, height=480)

#plot data for plot1
hist(plot1, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# close the PNG file
dev.off()
