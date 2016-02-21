# Packages Used
library("dplyr")
library("data.table")
library("lubridate")

data <- fread(input = "household_power_consumption.txt")
data_sub <- filter(data, dmy(Date) <= ymd("2007-02-02") , dmy(Date) >= ymd("2007-02-01"))
rm(data)

data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
data_sub <- data_sub %>% mutate(posixDate=dmy_hms(paste(data_sub$Date, data_sub$Time)))



png(file = "plot2.png", bg = "transparent", height = 480, width = 480)

plot(data_sub$Global_active_power ~ data_sub$posixDate, type="l", ylab="Global Power (kilowatts)", xlab="")

dev.off()
