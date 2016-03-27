setwd("~/Dokumente/Data_Science/Explanatory Data Analysis/Week 1")

library(stringr)

# loads the relevant data
df_colnames <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2880, skip = 66637)
colnames(df) <- names(df_colnames)

# removes "?" and replaces it by NA
variables <- names(df)
for (i in variables) {
  df[i][df[[i]] == "?"]  <- NA
}

# makes the Date variables
df$Date <- as.Date(df$Date, "%d/%m/%Y")


# generating the forth plot


png(filename = "plot4.png", width = 480, height = 480, bg = "white")

par(mfrow = c(2,2))

with(df, {

plot(Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" , xaxt = 'n')
axis(1, at = c(1, 1500, 2900),  labels = c("Thu", "Fri", "Sat" ))

plot(Voltage, type = "l", ylab = "Voltage",  xaxt = 'n')
axis(1, at = c(1, 1500, 2900),  labels = c("Thu", "Fri", "Sat" ))

plot(Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "" , xaxt = 'n')
lines(Sub_metering_2, type = "l", ylab = "Energy sub metering", xlab = "" , xaxt = 'n', col = "red")
lines(Sub_metering_3, type = "l", ylab = "Energy sub metering", xlab = "" , xaxt = 'n', col = "blue")
axis(1, at = c(1, 1500, 2900),  labels = c("Thu", "Fri", "Sat" ))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Global_reactive_power, type = "l",  xaxt = 'n')
axis(1, at = c(1, 1500, 2900),  labels = c("Thu", "Fri", "Sat" ))

})

dev.off()

