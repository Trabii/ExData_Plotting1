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


# generating the second plot
png(filename = "plot2.png", width = 480, height = 480, bg = "white")
plot(df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" , xaxt = 'n')
axis(1, at = c(1, 1500, 2900),  labels = c("Thu", "Fri", "Sat" ))
dev.off()
