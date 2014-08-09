# Plot3
library(sqldf)
file<-'course4/household_power_consumption.txt'
Inpfile <- read.csv.sql(file, sep=";",sql = 'select * from file 
                        where Date in( "1/2/2007","2/2/2007")')

#Inpfile$Date<-as.Date(Inpfile$Date,format="%Y/%m/%d")

# Checking the if the inp file is having any NAs.
colSums(is.na(Inpfile))


Inpfile$Date <- strptime(paste(Inpfile$Date,Inpfile$Time), "%d/%m/%Y %H:%M:%S")

png(filename="Plot4.png",width=480,height=480,units='px')

par(mfcol=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(Inpfile,{
#plot1
        plot(Date,Global_active_power,type='l',xlab='',ylab='Global Active Power(kilowatts)')
        
#plot2  
        with(Inpfile,plot(Date,Sub_metering_1,type='l',xlab='',ylab='Energy sub metering'))
        with(Inpfile,points(Date,Sub_metering_2,col='red',type='l'))
        with(Inpfile,points(Date,Sub_metering_3,col='blue',type='l'))
        legend('topright',lty=1,lwd=2,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2'
                                                                           ,'Sub_metering_3'),text.width<-c(1,1,1),cex=1)
        
      
#plot3
        plot(Date,Voltage,type='l',xlab='datetime',ylab='Voltage')
#plot4
        plot(Date,Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')
        
        
})


dev.off()




