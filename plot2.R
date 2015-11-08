# Assignment for week 1
# created by Andreas Eßbaumer
# on 08.Nov 2015


#Plot2:
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
png(filename = "plot2.png")

#plot
plot(as.numeric(as.character(Global_active_power))~Date, tabel, type="l", ylab="Global Active Power (kilowatts)", xlab="")


#close the device
dev.off()