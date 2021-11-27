HG <- read.csv("HGSampleData.csv")

NetRevenue <- (12.99/14.21)*(HG$Purchase.Amount) - 
              HG$Return.Amount - HG$Dicount.Amount # Needs fixing
NetRevenue <- round(NetRevenue, 2)
NetRevenue

NumSold <- HG$Purchases - HG$Returns

saleDate <- "2021-10-24"
as.Date(saleDate) + 1 # how to increment a given date

# Create Random sample of NetRevenue of Bath & Body Department
BathBody <- round(rnorm(162, NetRevenue[1], 97.655), 2)
hist(BathBody, breaks = 30)
mean(BathBody)

# Make bar plot relating all store departments to their Net Revenues
par(mai=c(1,2,1,1))
barplot(NetRevenue, names.arg = HG$Department, las = TRUE,
        horiz = TRUE)

# Make data frame to hold randomized weekly revenue of every
# department across n weeks
# Rows of data frame will look like:
# Date, Body&Bath Revenue, Charity Sales, BathShop Sales,...
# Sales in the above line means Net Revenue for given department

weeksObserved = 162
Date <- seq(as.Date("2016-01-03"), by = 7, len = weeksObserved)
RevenueData <- data.frame(Date)


for(var in 1:length(HG$Department)) {
  StdDev = (1.25*NetRevenue[var] - NetRevenue[var])/3
  DepartmentSales <- rnorm(weeksObserved, NetRevenue[var], StdDev)
  DepartmentSales <- round(DepartmentSales, 2)
  RevenueData[, HG$Department[var]] <- DepartmentSales
}
