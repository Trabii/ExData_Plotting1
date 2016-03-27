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


# generating the histogram
png(filename = "plot1.png", width = 480, height = 480, bg = "white")
hist(df$Global_active_power, col = "orange", main = "Global Active Power", xlab =  "Global Active Power (kilowatts)") 
dev.off()
