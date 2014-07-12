setwd("~/Documents")
HPC<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                comment.char = "",colClasses=
                        c("character","character","numeric","numeric","numeric"
                          ,"numeric","numeric","numeric","numeric"),na.strings="?")
HPC$datetime<-strptime(paste(HPC$Date,HPC$Time),format="%d/%m/%Y %H:%M:%S")
library(lubridate)
HPCsub<-subset(HPC,month(datetime)==2&(day(datetime)==1|day(datetime)==2)&
                       year(datetime)==2007)
plot(HPCsub$datetime,HPCsub$Sub_metering_1,type="l",
     ylab="Energy sub metering",xlab="")
lines(HPCsub$datetime,HPCsub$Sub_metering_2,col="red")
lines(HPCsub$datetime,HPCsub$Sub_metering_3,col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
setwd("~/Documents/GitHub/ExData_Plotting1")
dev.copy(png, file = "plot3.png") 
dev.off()  