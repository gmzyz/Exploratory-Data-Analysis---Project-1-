getwd()
library(data.table)
#load data#
EPCfull<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##convert the date variable to date class
EPCfull$Date <- as.Date(EPCfull$Date, format="%d/%m/%Y")

#subset the data
epc <- subset(EPCfull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
head(epc,3)
rm(EPCfull)

#dates and times
datetime <- paste(as.Date(epc$Date), epc$Time)
epc$datetime <- as.POSIXct(datetime)


# Plot 3
Sys.setlocale("LC_TIME", "English")

plot(epc$Sub_metering_1 ~ epc$datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(epc$Sub_metering_2 ~ epc$datetime, col="Red")
lines(epc$Sub_metering_3 ~ epc$datetime, col="Blue")
legend("topright",lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
       
#save plot 1 as png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

