##Plot 3

##Read in data.
data<-read.table("./data/Data Visualization/household_power_consumption.txt", sep=";", dec=".", na.strings="?", header=T)

##Change date format.
data$Date2<-as.Date(data$Date,"%d/%m/%Y")

##Restrict the data to dates from 2007-02-01 to 2007-02-02.
dat<-subset(data,Date2==as.Date("2007-02-01") | Date2==as.Date("2007-02-02"))

##Get a datetime time stamp combining date and time in a single entity to use for plotting.
##Date and Time are no longer needed.
dat<-within(dat,datetime<-strptime(paste(dat$Date, dat$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

##Create the plot with the legend.

##Create the png file plot3.R.
png(filename="plot3.png",width = 480, height = 480)

##Redefine the margins.
par(mar=c(5,5,2,2))

##Define the plotting area. 
plot(x=dat$datetime,y=dat$Sub_metering_1,type="n",main=" ",xlab="",ylab="Energy sub metering")

##Insert the 3 separate lines joining the points for Sub_metering 1,2,3.

##Sub_metering_1:
lines(dat$datetime,dat$Sub_metering_1,col="black")

##Sub_metering_2:
lines(dat$datetime,dat$Sub_metering_2,col="red")

##Sub_metering_3:
lines(dat$datetime,dat$Sub_metering_3,col="blue")

##Add the legend in the top right.
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()


##This could also have been done by first creating the plot and then copy it in a png.
