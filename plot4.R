plot4 <- function() {

## Read input file
	df <- read.table("household_power_consumption.txt",sep=';',na.strings='?',header=TRUE)
	df1 <- na.omit(df)
	df2 <- subset(df1,Date == "1/2/2007" | Date == "2/2/2007")
	rm(df)
	rm(df1)


## Draw the multiplots
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar=c(4,4,2,1)) 
with(df2, plot(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Global_active_power, pch = '.:', type = "l",xlab = "", ylab = 'Global Active Power'))  

with(df2, plot(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Voltage, pch = '.:', type = "l",xlab = "datetime", ylab = 'Voltage'))

with(df2, (plot (strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_1 ,main = "" , xlab = "" , ylab = "Energy sub metering", type ="l")))
with(subset(df2, Sub_metering_2 > -1), points(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_2 , type = "l", col = "red"))
with(subset(df2, Sub_metering_3 > -1), points(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_3 , type= "l", col = "blue"))
legend("topright", lty = 1, bty = 'n', col = c("black","red" ,"blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(df2, plot(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Global_reactive_power, pch = '.:', type = "l",xlab = "datetime"))
dev.off()

rm(df2)
	

}