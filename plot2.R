##Exploratory Data Analysis Class
## plot2.R
##loads household_power_consumption.txt
##household_power_consumption.txt must be in same directory as this script
##generates plot2.png

library("lubridate")



data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
##add new column to data with R DateTime
data$DateTime<- strptime( paste ( data[,1] ,  data[,2]),"%d/%m/%Y %H:%M:%S")

##find  2007-02-01 and 2007-02-02
date_data<-data[ data[,'Date']=='1/2/2007' | data[,'Date']=='2/2/2007',]



plot_data<-date_data[,c('DateTime','Global_active_power')]

par(mfrow=c(1,1))
plot(plot_data, type="l", col="black", ylab="Global Active Power(kilowatts)",xlab="")

dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()