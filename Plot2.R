# Plot2
library(sqldf)
file<-'course4/household_power_consumption.txt'
Inpfile <- read.csv.sql(file, sep=";",sql = 'select * from file 
                        where Date in( "1/2/2007","2/2/2007")')

#Inpfile$Date<-as.Date(Inpfile$Date,format="%Y/%m/%d")

# Checking the if the inp file is having any NAs.
colSums(is.na(Inpfile))


 
Inpfile$Date <- strptime(paste(Inpfile$Date,Inpfile$Time), "%d/%m/%Y %H:%M:%S")

png(filename="Plot2.png",width=480,height=480,units='px')
with(Inpfile,plot(Date,Global_active_power,type='l',xlab='',ylab='Global Active Power(kilowatts)'))
#dev.copy(png,file='Plot2.png')
dev.off()