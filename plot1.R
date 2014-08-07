##Plot1.R
##png of a histogram Frequency/GlobalActive Power (kilowatts) in red. Frequency is default.

##Read the data in data. NA is "?".
data<-read.table("./data/Data Visualization/household_power_consumption.txt", sep=";", dec=".", na.strings="?", header=T)

##Change the date format.
data$Date<-as.Date(data$Date, "%d/%m/%Y")

##Restrict the data to dates from 2007-02-01 to 2007-02-02.
dat<-data[data$Date %in% as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d"),]

##The required plot1 is a histogram Frequency/GlobalActive Power (kilowatts) in red. Frequency is default.

##Creating the plot directly in a file with width=heigth=480:
png(filename="plot1.png",width = 480, height = 480)
hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


##The plot could have also been created first and then copied to a png.
##Problem: How do I set the width and height of the png this way?
##Create the histogram.
##hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##Copy the histogram to plot1.png
##dev.copy(png, file="plot1.png")
##dev.off()


