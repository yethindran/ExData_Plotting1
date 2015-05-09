plot1 <- function() {

## Read input file
	df <- read.table("household_power_consumption.txt",sep=';',na.strings='?',header=TRUE, nrows = 2075259)
	df1 <- subset(df,(Date == "1/2/2007" | Date == "2/2/2007"))
	df1 <- na.omit(df1)
	rm(df)

## Draw the plot to a PNG file
	png("plot1.png", width = 480, height = 480)
	hist(df1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power", xaxt="n", yaxt="n")
	axis(1, at=2*0:6)
        axis(2, at=200*0:1200)
	dev.off()
	
}