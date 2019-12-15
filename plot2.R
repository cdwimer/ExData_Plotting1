filename <- "exdata_data_household_power_consumption.zip"
if(!file.exists(filename)){
    fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileurl, "exdata_data_household_power_consumption.zip")
}

if(!file.exists("household_power_consumption.txt")){
    unzip(filename)
}

hpc<-read.table(file.path(getwd(), "household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetHPC <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
weekday <- strptime(paste(subsetHPC$Date, subsetHPC$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(weekday, as.numeric(subsetHPC$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()