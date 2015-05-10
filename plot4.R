House_Cons<- read.table("household_power_consumption.txt", sep=";", 
skip=66637, nrow=2880) ##Reads data from file
names(House_Cons)<- c("Date", "Time", "Global_Active_Power",
  "Global_Reactive_Power","Voltage","Intensity",
    "Submetering_1","Submetering_2","Submetering_3") ## Assigns names to columns
png(file="plot4.png")
par(mfcol=c(2,2))
plot(strptime(paste(House_Cons$Date,House_Cons$Time), 
   format="%d/%m/%Y %H:%M:%S"), House_Cons$Global_Active_Power, 
       type="l", xlab="", ylab="Global Active Power (kiloWatts)") ##Plots line graph

with(House_Cons, plot(strptime(paste(House_Cons$Date,House_Cons$Time), 
   format="%d/%m/%Y %H:%M:%S"), House_Cons$Submetering_1, type="n", 
     xlab=" ", ylab="Energy sub metering"))
lines(strptime(paste(House_Cons$Date,House_Cons$Time), 
   format="%d/%m/%Y %H:%M:%S"), House_Cons$Submetering_1, col="black")
lines(strptime(paste(House_Cons$Date,House_Cons$Time), 
   format="%d/%m/%Y %H:%M:%S"), House_Cons$Submetering_2, col="red")
lines(strptime(paste(House_Cons$Date,House_Cons$Time), 
   format="%d/%m/%Y %H:%M:%S"), House_Cons$Submetering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), bty="n",
 legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##Plots second graph with three energy submeterings and a legend

plot(strptime(paste(House_Cons$Date,House_Cons$Time), 
   format="%d/%m/%Y %H:%M:%S"), House_Cons$Voltage, 
       type="l", xlab="datetime", ylab="Voltage") ##Plots voltage graph
plot(strptime(paste(House_Cons$Date,House_Cons$Time), 
   format="%d/%m/%Y %H:%M:%S"), House_Cons$Global_Reactive_Power, 
       type="l", xlab="datetime", ylab="Global_reactive_power")
 ##Plots reactive power graph
dev.off()