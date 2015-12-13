dane <- read.csv("household_power_consumption.txt",sep = ";", na.strings="?")
dane$Date <- as.Date(dane$Date, format="%d/%m/%Y")
dane$Date<-paste(dane$Date, dane$Time)
dane$Time<-NULL
sub.dane = subset(dane, as.Date(Date)>= '2007-02-01'& as.Date(Date)<='2007-02-02')
png(filename="plot1.png", width=480, height=480)
hist(sub.dane$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", xlim=c(0,6))
dev.off()
