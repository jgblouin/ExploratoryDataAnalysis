##Plot 2

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

##Redefine the margins.
par(mar=c(5,5,2,2))

##Define the plotting area. 
plot(x=dat$datetime,y=dat$Global_active_power,type="n",main=" ",xlab="",ylab="Global Active Power(kilowatts)")

##Insert lines between data popints.
lines(dat$datetime,dat$Global_active_power)

##Save to plot2.png.
dev.copy(png,"./plot2.png")
dev.off()

##The following creates the png file with the plot without the need to copy as plot2b.png.
png(filename="plot2b.png",width = 480, height = 480)

        ##Define the plotting area. Type=n says no plotting.
        plot(x=dat$datetime,y=dat$Global_active_power,type="n",main=" ",xlab="",ylab="Global Active Power(kilowatts)")
        
        ##Insert lines between data popints.
        lines(dat$datetime,dat$Global_active_power)

dev.off()