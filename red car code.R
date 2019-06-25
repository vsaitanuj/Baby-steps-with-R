## working directory
getwd()
setwd("C:/R programs great lakes/hands on R")

##importing dataset
car_data = read.csv("RedCar_Dataset.csv",header = TRUE)
View(car_data)

##Deriving Age and Car Colour

age_car = car_data[,c("AGE","RED_CAR")]








Age.Group = cut(age_car$AGE,c(0,35,48,49),labels = c("Less than 35","35-48","49+"))
summary(Age.Group)
age_car$AGE = Age.Group
age_car$AGE = as.ordered(age_car$AGE)

class(age_car$AGE)

tab = table(age_car$AGE,age_car$RED_CAR)
tab = as.data.frame.array(tab,colnames(tab))
colnames(tab)
tab$yes
View(tab$yes)

table = table(Age.Group)
table = as.data.frame(table)
colnames(table) = c("Age.Group","Number.of.Cars")
colnames(table)
View(table)


red_count = table(age_car$AGE,age_car$RED_CAR)
View(red_count)
red_count = as.data.frame(red_count)
colnames(red_count) = c("group","owning","Number of Red Cars")
red_count$`Number of Red Cars`
Number.Of.Red.Cars = c(red_count$`Number of Red Cars`[4],red_count$'Number of Red Cars'[5],red_count$'Number of Red Cars'[6])
table2 = cbind(table,Number.Of.Red.Cars)
View(table2)

library(dplyr)

percent = table2$Number.Of.Red.Cars/table2$Number.of.Cars
View(percent)
Percentage.of.red.cars = percent*100
Percentage.of.red.cars = paste0(Percentage.of.red.cars,"%")
View(Percentage.of.red.cars)

table_final = cbind(table2,Percentage.of.red.cars)
View(table_final)


colnames(table_final)
colnames(table_final) = make.names(colnames(table_final))
colnames(table_final) = c("Age Group","Number of Cars","Number of Red Cars","Percentage of Red Cars")

View(table_final)


test
