hhpc_all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", dec = ".")
hhpc<-hhpc_all[hhpc_all$Date=="1/2/2007" | hhpc_all$Date=="2/2/2007",]
hhpc$DateTime <-  strptime(paste(hhpc$Date, hhpc$Time, sep = " "), format = "%d/%m/%Y %T")

png("plot3.png")

par(mfrow = c(1,1))
plot(hhpc$DateTime, hhpc$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")

series = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors = c(1,2,4)

for(i in 1:3)
{
  lines(hhpc$DateTime, hhpc[[series[i]]], col = colors[i])
}

legend(x = "topright", legend = series, col = colors, seg.len = 1, lwd = 1)

dev.off()


