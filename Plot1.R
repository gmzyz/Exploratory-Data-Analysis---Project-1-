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


# Plot 1

hist(epc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save plot 1 as png
dev.copy(png,file="plot1.png", height=480, width=480)
dev.off()

