#Read and process data

housepower <- read.csv("~/Coursera/household_power_consumption.txt", sep=";", na.strings="?")
datefilt <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007"),]
time <-strptime(paste(datefilt$Date, datefilt$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
fin <- cbind(time, datefilt)

#create second plot

hist(fin$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")