# Packages Used
library("dplyr")
library("data.table")
library("lubridate")

data <- fread(input = "household_power_consumption.txt")
data_sub <- filter(data, dmy(Date) <= ymd("2007-02-02") , dmy(Date) >= ymd("2007-02-01"))
rm(data)

data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
data_sub <- data_sub %>% mutate(posixDate=dmy_hms(paste(data_sub$Date, data_sub$Time)))

png(file = "plot4.png", bg = "transparent", height = 480, width = 480)
par(mfrow=c(2,2))

with(data_sub, {
  plot(Global_active_power ~ posixDate, type="l", ylab = "Global Active Power", xlab="")

  plot(Voltage ~ posixDate, type="l", ylab = "Voltage", xlab = "datetime")

  plot(Sub_metering_1 ~ posixDate, type="l", ylab="Energy sub metering", xlab="")
  lines(posixDate,Sub_metering_2,col="red", type="l")
  lines(posixDate,Sub_metering_3,col="blue", type="l")
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty="n", cex=0.7)

  plot(Global_reactive_power ~ posixDate, type="l", ylab = "Global_Reactive_Power", xlab = "datetime" )
})

dev.off()
