##Plot 4
##Plot 4 shows 4 plots in a 2*2 array, with the 2 plots in the first column being plot2 and plot3.

##Read in data.
data<-read.table("./data/Data Visualization/household_power_consumption.txt", sep=";", dec=".", na.strings="?", header=T)

##Change date format.
data$Date2<-as.Date(data$Date,"%d/%m/%Y")

##Restrict the data to dates from 2007-02-01 to 2007-02-02.
dat<-subset(data,Date2==as.Date("2007-02-01") | Date2==as.Date("2007-02-02"))

##Get a datetime time stamp combining date and time in a single entity to use for plotting.
##Date and Time are no longer needed.
dat<-within(dat,datetime<-strptime(paste(dat$Date, dat$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

##Create the plot.

##Create the png file plot4.R.
png(filename="plot4.png",width = 480, height = 480)

##Create the plotting area as a 2*2 matrix. 
##Plots will be added by row.
par(mfrow=c(2,2))

##1st plot is the same as plot2.
        ##Define the plotting area. 
        plot(x=dat$datetime,y=dat$Global_active_power,type="n",main=" ",xlab="",ylab="Global Active Power")
        
        ##Insert lines between data points.
        lines(dat$datetime,dat$Global_active_power)

##2nd plot is a voltage/datetime plot.
        ##Define the plotting area.
        plot(x=dat$datetime,y=dat$Voltage,type="n",xlab="datetime",ylab="voltage")
        
        ##Insert lines between data points.
        lines(dat$datetime,dat$Voltage)

##3rd plot is the same as plot3.
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
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

##4th plot is a Global_reactive_power/Datetime graph, quite similar to plot2.
        ##Define the plotting area. 
        plot(x=dat$datetime,y=dat$Global_reactive_power,type="n",main=" ",xlab="datetime",ylab="Global_reactive_power")
        
        ##Insert lines between data points.
        lines(dat$datetime,dat$Global_reactive_power)

dev.off()





