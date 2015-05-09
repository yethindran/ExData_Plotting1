plot2 <- function() {

## Read input file
	df <- read.table("household_power_consumption.txt",sep=';',na.strings='?',header=TRUE,nrows=2075259)
	df1 <- na.omit(df)
	df2 <- subset(df1,Date == "1/2/2007" | Date == "2/2/2007")
	rm(df)
	rm(df1)

## Draw the plot to a PNG file
	png("plot2.png", width = 480, height = 480)
	plot(strptime(paste(df2$Date, df2$Time), format="%d/%m/%Y %H:%M"), df2$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)",pch = '.:',type='l',yaxt="n")
	axis(2, at=2*0:6)
	dev.off()

	rm(df2)
}