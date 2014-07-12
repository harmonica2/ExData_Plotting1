# In order to use this code, download the 
# Electric Power Consumption file from here:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Place the file in the Documents Folder
#Also, it is assumed that the Github repo "Ex_data Plotting 1"
#is nested in a folder named "GitHub" located in the Documents Folder.
#Also, install the package "lubridate".
setwd("~/Documents")
HPC<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                comment.char = "",colClasses=
                        c("character","character","numeric","numeric","numeric"
                          ,"numeric","numeric","numeric","numeric"),na.strings="?")
HPC$datetime<-strptime(paste(HPC$Date,HPC$Time),format="%d/%m/%Y %H:%M:%S")
library(lubridate)
HPCsub<-subset(HPC,month(datetime)==2&(day(datetime)==1|day(datetime)==2)&
                       year(datetime)==2007)
par(mfcol=c(2,2))
plot(HPCsub$datetime,HPCsub$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="",bg ="transparent")
plot(HPCsub$datetime,HPCsub$Sub_metering_1,type="l",
     ylab="Energy sub metering",xlab="",bg ="transparent")
lines(HPCsub$datetime,HPCsub$Sub_metering_2,col="red")
lines(HPCsub$datetime,HPCsub$Sub_metering_3,col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
plot(HPCsub$datetime,HPCsub$Voltage,type="l",
     ylab="Voltage",xlab="datetime",bg ="transparent")
plot(HPCsub$datetime,HPCsub$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="datetime",bg ="transparent")
setwd("~/Documents/GitHub/ExData_Plotting1")
dev.copy(png, file = "plot4.png") 
dev.off()  