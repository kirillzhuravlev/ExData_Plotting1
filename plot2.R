House_Cons<- read.table("household_power_consumption.txt", sep=";", 
skip=66637, nrow=2880) ##Reads data from file
names(House_Cons)<- c("Date", "Time", "Global_Active_Power",
  "Global_Reactive_Power","Voltage","Intensity",
    "Submetering_1","Submetering_2","Submetering_3") ## Assigns names to columns
png(file="plot2.png")
plot(strptime(paste(House_Cons$Date,House_Cons$Time), 
   format="%d/%m/%Y %H:%M:%S"), House_Cons$Global_Active_Power, 
       type="l", xlab="", ylab="Global Active Power (kiloWatts)") ##Plots line graph
dev.off()