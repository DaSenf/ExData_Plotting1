# Assignment for week 1
# created by Andreas Eßbaumer
# on 08.Nov 2015


#Plot3:
#read the data:
data <- read.table("household_power_consumption.txt", sep=";", dec=".", header=T)
#convert the format of "Date" from factor to a date-classe
times <- as.character(data$Date)
times2 <- strptime(times, "%d/%m/%Y")

#subset the data for the relevant time frame
data$Date <- times2
dates_selected <- strptime(c("01/02/2007","02/02/2007"), "%d/%m/%Y")
#the subset is called "tabel"
tabel <- data[data$Date %in% dates_selected,]

#include the time to the timestamp
times3 <- as.POSIXct(paste(tabel$Date, as.character(tabel$Time)))
tabel$Date <- times3

#because i´m from germany i have to use the following command to get the english names for weekdays for dates
Sys.setlocale("LC_TIME", "C")

#open device
png(filename = "plot3.png")
#plot 
#first lines
plot(as.numeric(as.character(Sub_metering_1))~Date, tabel, type="l", ylab="Energy sub metering",xlab="")
#second lines
lines(as.numeric(as.character(Sub_metering_2))~Date, tabel, type="l", col="red")
#third lines
lines(as.numeric(as.character(Sub_metering_3))~Date, tabel, type="l", col="blue")
#add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))


#close the device
dev.off()