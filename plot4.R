##Exploratory Data Analysis Class
## plot4.R
##loads household_power_consumption.txt
##household_power_consumption.txt must be in same directory as this script
##generates plot4.png

library("lubridate")

data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
##add new column to data with R DateTime
data$DateTime<- strptime( paste ( data[,1] ,  data[,2]),"%d/%m/%Y %H:%M:%S")

##find  2007-02-01 and 2007-02-02
date_data<-data[ data[,'Date']=='1/2/2007' | x[,'Date']=='2/2/2007',]


##set row columns
par(mfrow=c(2,2))
##reset margins
par(mar=c(2,4,2,2))

##Global_active_power plot
plot_dataA<-date_data[,c('DateTime','Global_active_power')]
plot(plot_dataA, type="l", col="black")

##Voltage plot
plot_dataB<-date_data[,c('DateTime','Voltage')]
plot(plot_dataB, type="l", col="black")

##Sub metering plot
plot_data1 <- date_data[,c('DateTime','Sub_metering_1')]
plot_data2 <- date_data[,c('DateTime','Sub_metering_2')]
plot_data3 <- date_data[,c('DateTime','Sub_metering_3')]
plot(plot_data1, type="n", ylab="Energy Sub Metering",xlab="")
points(plot_data1,type="l",col="black")
points(plot_data2,type="l",col="red")
points(plot_data3,type="l",col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

##Global_reactive_power plot
plot_dataC<-date_data[,c('DateTime','Global_reactive_power')]
plot(plot_dataC, type="l", col="black")

dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()

