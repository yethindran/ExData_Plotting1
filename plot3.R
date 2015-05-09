plot3 <- function() {

## Read input file
	df <- read.table("household_power_consumption.txt",sep=';',na.strings='?',header=TRUE)
	df1 <- na.omit(df)
	df2 <- subset(df1,Date == "1/2/2007" | Date == "2/2/2007")
	rm(df)
	rm(df1)
	
## Draw the plot to a PNG file
	png("plot3.png", width = 480, height = 480)
	with(df2, plot(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_1,,xlab="",ylab="Energy sub metering",type = "l"))
	with(subset(df2, Sub_metering_2 > -1), points(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_2, col = "red",type="l"))
	with(subset(df2, Sub_metering_3 > -1), points(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_3, col = "blue",type="l"))
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	dev.off()

rm(df2)

}