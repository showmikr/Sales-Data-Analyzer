HG <- read.csv("HGSampleData.csv")

NetRevenue <- (12.99/14.21)*(HG$Purchase.Amount) -
              HG$Return.Amount - HG$Dicount.Amount # Needs fixing
NetRevenue <- round(NetRevenue, 2)
NetRevenue

NumSold <- HG$Purchases - HG$Returns

saleDate <- "2021-10-24"
as.Date(saleDate) + 1 # how to increment a given date

# Create Random sample of NetSales of Bath & Body Department
BathBody <- round(rnorm(162, NetRevenue[1], 97.655), 2)
hist(BathBody, breaks = 30)
mean(BathBody)

# Make bar plot relating all store departments to their Net Revenues
par(mai=c(1,2,1,1))
barplot(NetRevenue, names.arg = HG$Department, las = TRUE,
        horiz = TRUE)
