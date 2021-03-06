##Exploratory Data Analysis Class
## plot1.R
##loads household_power_consumption.txt
##household_power_consumption.txt must be in same directory as this script
##generates plot1.png
##Tested on Windows 7, R Studion Version 0.98.1091 


data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
##add new column to data with R DateTime
data$DateTime<- strptime( paste ( data[,1] ,  data[,2]),"%d/%m/%Y %H:%M:%S")

##find  2007-02-01 and 2007-02-02
date_data<-data[ data[,'Date']=='1/2/2007' | data[,'Date']=='2/2/2007',]

png("plot1.png",width=480,height=480)

par(mfrow=c(1,1))
plot_data<-date_data[,'Global_active_power']
hist(plot_data,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

dev.off()