data<-read.csv("p1_data/household_power_consumption.txt",header = TRUE, sep = ";", colClasses = c("factor","Date", "factor","numeric","numeric","numeric","numeric","numeric"))
 
library(lubridate) 
data$Date <- dmy(data$Date)
dadosValidos <- data[ data$Date == ymd( "2007-02-01") | data$Date == ymd("2007-02-02") , ]
head(dadosValidos)


png("plot1.png",width = 480,height = 480)

f<- (  dadosValidos$Global_active_power )

dadosValidos$GAP <- as.numeric(levels(f))[f]
hist(dadosValidos$GAP ,co="red", main = "Global Active Power" ,xlab = "Global Active Power (kilowats)")
dev.off()
