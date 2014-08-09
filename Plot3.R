# Plot3
library(sqldf)
file<-'course4/household_power_consumption.txt'
Inpfile <- read.csv.sql(file, sep=";",sql = 'select * from file 
                        where Date in( "1/2/2007","2/2/2007")')

#Inpfile$Date<-as.Date(Inpfile$Date,format="%Y/%m/%d")

# Checking the if the inp file is having any NAs.
colSums(is.na(Inpfile))


Inpfile$Date <- strptime(paste(Inpfile$Date,Inpfile$Time), "%d/%m/%Y %H:%M:%S")

png(filename="Plot3.png",width=480,height=480,units='px')
with(Inpfile,plot(Date,Sub_metering_1,type='l',xlab='',ylab='Energy sub metering'))
with(Inpfile,points(Date,Sub_metering_2,col='red',type='l'))
with(Inpfile,points(Date,Sub_metering_3,col='blue',type='l'))
legend('topright',lty=1,lwd=2,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2'
  ,'Sub_metering_3'),text.width<-c(1,1,1),cex=1,ncol=1)
dev.off()
     
 



