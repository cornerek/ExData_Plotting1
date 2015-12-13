dane <- read.csv("household_power_consumption.txt",sep = ";", na.strings="?")
dane$Date <- as.Date(dane$Date, format="%d/%m/%Y")
dane$Date<-paste(dane$Date, dane$Time)
dane$Time<-NULL
sub.dane = subset(dane, as.Date(Date)>= '2007-02-01'& as.Date(Date)<='2007-02-02')
sub.dane$Date<-as.POSIXct(strptime(sub.dane$Date, "%Y-%m-%d %H:%M:%S"))
Sys.setlocale("LC_TIME", "C") ##this ensures that weekdays will be in English
png(filename="plot3.png", width=480, height=480)
plot(sub.dane$Date, sub.dane$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(sub.dane$Date, sub.dane$Sub_metering_2, col="red")
lines(sub.dane$Date, sub.dane$Sub_metering_3, col="blue")
legend("topright", lwd = 1, col=c("black", "red", "blue"), legend=c("Sub_Metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()