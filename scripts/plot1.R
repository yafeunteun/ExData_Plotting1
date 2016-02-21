# Packages Used
library("dplyr")
library("data.table")
library("lubridate")

data <- fread(input = "household_power_consumption.txt")
data_sub <- filter(data, dmy(Date) <= ymd("2007-02-02") , dmy(Date) >= ymd("2007-02-01"))
rm(data)

data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)

png(file = "plot1.png", bg = "transparent", height = 480, width = 480)

hist(data_sub$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")


dev.off()