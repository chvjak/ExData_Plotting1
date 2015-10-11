hhpc_all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", dec = ".")
hhpc<-hhpc_all[hhpc_all$Date=="1/2/2007" | hhpc_all$Date=="2/2/2007",]
hhpc$DateTime <-  strptime(paste(hhpc$Date, hhpc$Time, sep = " "), format = "%d/%m/%Y %T")

png("plot1.png")

par(mfrow = c(1,1))
hist(hhpc$Global_active_power, density = 100, col = 2, angle = 90, border = 1, xlab = "Global Active Power (kilowatts)", main = "Gloabl Active Power")

dev.off()


