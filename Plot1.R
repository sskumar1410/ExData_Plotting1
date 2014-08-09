# Plot1 
library(sqldf)
file<-'course4/household_power_consumption.txt'
Inpfile <- read.csv.sql(file, sep=";",sql = 'select * from file 
                        where Date in( "1/2/2007","2/2/2007")')

Inpfile$Date<-as.Date(Inpfile$Date,format="%Y/%m/%d")

# Checking the if the inp file is having any NAs.
colSums(is.na(Inpfile))

png(filename="Plot1.png",width=480,height=480,units='px')
hist(Inpfile$Global_active_power,col='red',xlab='Global Active Power(Kilowatts)',main='Global Active Power')
#dev.copy(png,file='Plot1.png')
dev.off()
        