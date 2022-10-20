library(tidyverse)
str(mpg)

mpg %>% filter(manufacturer == 'audi')
mpg %>% filter(displ > 2)
mpg %>% filter(displ >= 2)
mpg %>% filter(displ > 2 & cyl > 6)
mpg %>% filter(manufacturer == 'audi', year == 1999)
mpg %>% filter(manufacturer == 'audi' & year == 1999)
mpg %>% filter(manufacturer == 'audi' | year == 1999) %>% view

### EXCERCISE 1
mpg %>% filter(manufacturer != 'audi', year == 1999) %>% view

#############

mpg %>% 
  filter((manufacturer == 'audi' | manufacturer == 'chevrolet'), year == 1999) %>% 
  view
mpg %>% 
  filter(manufacturer %in% c('audi','chevrolet'), year == 1999) %>%
  count(manufacturer)

### RANDOM SAMPLING
sample_frac(mpg, 0.05, replace = TRUE)  %>% view
mpg %>% sample_n(10,replace = T)

rio2016Models <- read.csv(paste0(getwd(),"/","Rio2016(1).csv",collapse = ""))
rio2016Models %>% arrange(Country)
rio2016Models %>% arrange(desc(Country))
## ordered by first value preference
rio2016Models %>% arrange(desc(Gold),desc(Silver),desc(Bronze))

### EXCERCISE 2
rio2016Models %>% arrange(desc(Gold),desc(Silver),desc(Bronze)) %>% view()

#############

mpg %>% select(manufacturer,hwy)
mpg %>% select(starts_with('d'))
mpg %>% select(manufacturer , hwy) %>% 
  filter(manufacturer == "chevrolet" & hwy >= 20)
mpg %>% select(manufacturer , hwy) %>% 
  filter(manufacturer != "chevrolet" & hwy >= 20) %>% 
  arrange(desc(manufacturer))

rio2016Models %>% mutate(Total = Gold+Silver+Bronze)

summarise(mpg , avg = mean(hwy))
mpg %>% group_by(year,manufacturer) %>% summarise(count = n())

### EXCERCISE 3

mpg %>% 
  select(manufacturer,model) %>% 
  group_by(manufacturer,model) %>% 
  distinct(model) 

mpg %>% 
  mutate(HwyCtyRatio = hwy/cty) %>% view()

########################

library(nycflights13)
nycflights13::airlines
nycflights13::airports

flights2 <- flights %>% select(year:day, hour, origin, dest, tailnum, carrier)
flights2

flights2 %>% left_join(airlines , by = 'carrier')

meals <- read_csv("freeschoolmeals.csv")
View(meals)

summary(meals$FSMTaken)
mean(meals$FSMTaken)
mean(meals$FSMTaken, na.rm = T)

actualFSMTaken<-meals$FSMTaken[meals$FSMTaken!=9999]
length(actualFSMTaken)

mean(actualFSMTaken, na.rm = T)

meals %>% filter(FSMTaken != 9999) %>% count()
meals %>% filter(FSMTaken != 9999 | is.na(FSMTaken)) %>% count()

y <- c(4,5,6,NA)
is.na(y)
y[is.na(y)] <- mean(y,na.rm = T)
y

actualFSMTaken[is.na(actualFSMTaken)]<-floor(mean(actualFSMTaken, na.rm=TRUE))

meals %>% filter((FSMTaken<9999 | is.na(FSMTaken))) %>%
  mutate(newFSMTaken=ifelse(is.na(FSMTaken), floor(mean(FSMTaken, na.rm=TRUE)),
                            FSMTaken))

#### EXCERCISE 4
meals %>% filter(FSMTaken<9999) %>% mutate(newFSMTaken=ifelse(FSMTaken == 9999, 4,
                                    FSMTaken)) %>% summarise(avg = mean(newFSMTaken))

meals %>% filter(FSMTaken<9999) %>% mutate(newFSMTaken=ifelse(FSMTaken == 9999, 0,
                                                              FSMTaken)) %>% summarise(avg = mean(newFSMTaken))
