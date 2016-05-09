#Read and process data

housepower <- read.csv("~/Coursera/household_power_consumption.txt", sep=";", na.strings="?")
datefilt <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007"),]
time <-strptime(paste(datefilt$Date, datefilt$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
fin <- cbind(time, datefilt)

#Create fourth plot

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(fin$time, fin$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(fin$time, fin$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(fin$time, fin$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(fin$time, fin$Sub_metering_2, type="l", col="red")
lines(fin$time, fin$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(fin$time, fin$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")