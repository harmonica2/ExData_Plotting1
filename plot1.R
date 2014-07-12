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
hist(HPCsub$Global_active_power,col="red",main="Global Active Power",
	xlab="Global Active Power (kilowatts)",bg ="transparent" )
setwd("~/Documents/GitHub/ExData_Plotting1")
dev.copy(png, file = "plot1.png")  
dev.off()  
