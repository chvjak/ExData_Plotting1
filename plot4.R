plot2<-function(){
  plot(hhpc$DateTime, hhpc$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(hhpc$DateTime, hhpc$Global_active_power)
}

plot3<-function(){
  plot(hhpc$DateTime, hhpc$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
  
  series = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  colors = c(1,2,4)
  
  for(i in 1:3)
  {
    lines(hhpc$DateTime, hhpc[[series[i]]], col = colors[i])
  }
  
  legend(x = "topright", legend = series, col = colors, seg.len = 1, lwd = 1)
}

plot4<-function(){
  plot(hhpc$DateTime, hhpc$Voltage, type="n", ylab = "Volatge", xlab = "datetime")
  lines(hhpc$DateTime, hhpc$Voltage)
}

plot5<-function(){
  plot(hhpc$DateTime, hhpc$Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab = "datetime")
  lines(hhpc$DateTime, hhpc$Global_reactive_power)
}


plot_all<-function(){
  par(mfrow=c(2,2))
  
  plot2()  
  plot4()
  plot3()
  plot5()
}

hhpc_all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", dec = ".")
hhpc<-hhpc_all[hhpc_all$Date=="1/2/2007" | hhpc_all$Date=="2/2/2007",]
hhpc$DateTime <-  strptime(paste(hhpc$Date, hhpc$Time, sep = " "), format = "%d/%m/%Y %T")

png("plot4.png")

plot_all()

dev.off()


