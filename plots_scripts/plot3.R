#Read and process data

housepower <- read.csv("~/Coursera/household_power_consumption.txt", sep=";", na.strings="?")
datefilt <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007"),]
time <-strptime(paste(datefilt$Date, datefilt$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
fin <- cbind(time, datefilt)

# Create third plot

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(fin$time, fin$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(fin$time, fin$Sub_metering_2, col=columnlines[2])
lines(fin$time, fin$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")