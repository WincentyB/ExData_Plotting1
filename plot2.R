# Script creating plot2.png file
# There is assumption that input file is located 
# in work directory


# reading and filter data
hpc_FileName <-"household_power_consumption.txt"
hpc_file <- file(hpc_FileName)
hpc_Table <- read.table(text = grep("^[1,2]/2/2007", readLines(hpc_file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
close(hpc_file)

hpc_Table$Timestamp <-paste(hpc_Table$Date, hpc_Table$Time)

# Generating Plot 2 (Timestamp, Global_active_power)
png("plot2.png", width=480, height=480)
plot(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
#dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
