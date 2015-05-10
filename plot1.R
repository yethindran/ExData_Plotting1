plot1 <- function() {

## Read input file, subset for dates "1/2/2007", "2/2/2007" and omit NAs
	df <- read.table("household_power_consumption.txt",sep=';',na.strings='?',header=TRUE, nrows = 2075259)
	df1 <- subset(df,(Date == "1/2/2007" | Date == "2/2/2007"))
	df1 <- na.omit(df1)
	rm(df)

## Draw the histogram for Global Active Power to a PNG file
	png("plot1.png", width = 480, height = 480)
	hist(df1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
	dev.off()
	
	rm(df1)
}