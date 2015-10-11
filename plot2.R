hhpc_all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", dec = ".")
hhpc<-hhpc_all[hhpc_all$Date=="1/2/2007" | hhpc_all$Date=="2/2/2007",]
hhpc$DateTime <-  strptime(paste(hhpc$Date, hhpc$Time, sep = " "), format = "%d/%m/%Y %T")

png("plot2.png")

par(mfrow = c(1,1))
plot(hhpc$DateTime, hhpc$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(hhpc$DateTime, hhpc$Global_active_power)

dev.off()


