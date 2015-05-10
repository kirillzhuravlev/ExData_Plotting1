House_Cons<- read.table("household_power_consumption.txt", sep=";", 
skip=66637, nrow=2880) ##Reads data from file
names(House_Cons)<- c("Date", "Time", "Global_Active_Power",
  "Global_Reactive_Power","Voltage","Intensity",
    "Submetering_1","Submetering_2","Submetering_3") ## Assigns names to columns
png(file="plot1.png")
with(House_Cons, hist(Global_Active_Power,col="red",
  main="Global Active Power",xlab="Global Active Power (kiloWatts)")) ##Plots the graph to file
dev.off()