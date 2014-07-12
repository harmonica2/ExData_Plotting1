setwd("~/Documents")
HPC<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                comment.char = "",colClasses=
                        c("character","character","numeric","numeric","numeric"
                          ,"numeric","numeric","numeric","numeric"),na.strings="?")
HPC$datetime<-strptime(paste(HPC$Date,HPC$Time),format="%d/%m/%Y %H:%M:%S")
library(lubridate)
HPCsub<-subset(HPC,month(datetime)==2&(day(datetime)==1|day(datetime)==2)&
                       year(datetime)==2007)
plot(HPCsub$datetime,HPCsub$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
setwd("~/Documents/GitHub/ExData_Plotting1")
dev.copy(png, file = "plot2.png") 
dev.off()  