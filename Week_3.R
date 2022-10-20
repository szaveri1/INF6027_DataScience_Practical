library(MASS)
library(tidyverse)
library(readxl)
library(readtext)


data("women")
women
summary(women)

hist(women$height)

hist(x=women$height, breaks=4, 
     main="Histogram showing women's heights",
     xlab="Height") 
par(mfrow = c(1,2))

hist(women$height, main = "Heights", xlab = "Heights")
hist(women$weight, main = "Heights", xlab = "Weights")

par(mfrow = c(1,1))
plot(women)Ṇ

#pie charts

slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# Pie Chart with Percentages
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")

#3D pie chart
library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")

#### reading the files

test_file <- read_tsv("test.tsv")
test_file
test_file <- read_tsv("test.tsv",col_names = FALSE)
test_file

test_csv <- read_csv("freeschoolmeals.csv")
head(test_csv)

test_csv <- read_csv("freeschoolmeals.csv",col_types = 'cciici')
head(test_csv)

excelFile<-file.path("indicator hiv estimated prevalence% 15-49.xlsx")
testExcelFile<-read_excel(excelFile, sheet="Data")
head(testExcelFile)
View(testExcelFile)

testExcelFile<-read_xlsx(excelFile, sheet="Data")

### excercise

par(mfrow = c(1,2))

hist(x = testExcelFile$`1982.0`,
     main = "indicator hiv estimated prevalence% 15-49 for 1982",
     xlab = "Year 1982")
hist(x = testExcelFile$`1983.0`,
     main = "indicator hiv estimated prevalence% 15-49 for 1983",
     xlab = "Year 1983")
###############

readtext("http://ir.shef.ac.uk/cloughie/download/inaugral.txt") -> txt
str(txt)
txt$text

library(rvest)

url <- "https://en.wikipedia.org/wiki/Sheffield"
wikiPage <- read_html(url)

h2Sections <- wikiPage %>% html_nodes("h2")
h2Sections %>% html_text()
wikiPage %>% html_nodes('p') %>% html_text()
