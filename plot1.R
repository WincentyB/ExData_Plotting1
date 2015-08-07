# Script creating plot1.png file
# There is assumption that input file is located 
# in work directory


# reading and filter data
hpc_FileName <-"household_power_consumption.txt"
hpc_file <- file(hpc_FileName)
hpc_Table <- read.table(text = grep("^[1,2]/2/2007", readLines(hpc_file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
close(hpc_file)

# Generating Plot 1 (Global_active_power)
png("plot1.png", width=480, height=480)
hist(hpc_Table$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
#dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()