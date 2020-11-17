# title: "R123: data.frame"
# author: "정원혁, 2014"



# 열 추가 --------------------------------------------------------------------
library(ggplot2)
str(diamonds)

dia <- diamonds
str(dia)
dia$volume <- dia$x * dia$y * dia$z
dia$volume <- round(dia$volume, 1)
dia$volume2 <- NA
str(dia)
head(dia)

dia <- data.frame(diamonds)
str(dia)
dia$volume <- dia$x * dia$y * dia$z
dia$volume <- round(dia$volume, 1)
dia$volume2 <- NA
str(dia)
head(dia)


# 열 삭제 --------------------------------------------------------------------
dia$volume2 <- NULL
dia$volume <- NULL
head(dia)



# 원하는 데이터 조회하기  ----------------------------------------------------
## 데이터 프레임 복습
a <- airquality
str(a)

head(a)
a[2, 4]
a[2, ]
a[, 4]
a[, 4, drop=F]

a[, c('Wind', 'Day')]


head(a)
a[ a$Wind ==7.4, ]

a[ a$Day == 1, c('Wind', 'Day')]

a[ a$Ozone ==41, ] #왜 NA가 많이 나오나? 
sum(is.na(a$Ozone))



# 더 큰 데이터에서
subset(dia,
       select = c("carat", "color", "price"),
       subset = (color == "E" & price > 1000))

# library(dplyr)
# dia %>% 
#     filter(color == "E", price > 1000) %>% 
#     select (carat, color, price)

dia$color == "E" & dia$price > 1000
dia[dia$color == "E" & dia$price > 1000, ]

x <- dia$color == "E" & dia$price > 1000
dia[x, ]
dia[ x <- dia$color == "E" & dia$price > 1000 ,  ]

y <- c("carat", "color", "price")
dia[x, y]

dia[dia$color == "E" & dia$price > 1000, c("carat", "color", "price")]



# which
which (a$Day ==1)
a[124, ]
a[which (a$Day ==1), ]
a[ (a$Day ==1), ]

which(dia$color == "E" & dia$price > 1000)

dia[which(dia$color == "E" & dia$price > 1000),
    c("carat", "color", "price")]


# attach
attach(dia)
dia$carat
carat

detach(dia)
dia$carat
carat




# 데이터 프레임 합치기  ----------------------------------------------------

cust_id <- c("c01", "c02", "c03", "c04")
last_name <- c("Kim", "Lee", "Choi", "Park")

cust_mart_1 <- data.frame(cust_id, last_name)
head(cust_mart_1)
str(cust_mart_1)

# rbind
cust_mart_2 <- data.frame(cust_id = c("c05", "c06", "c07"),
                          last_name = c("Bae", "Kim", "Lim"))

cust_mart_12 <- rbind(cust_mart_1, cust_mart_2)
head(cust_mart_12)


# cbind
cust_mart_5 <- data.frame(age = c(20, 25, 19, 40, 32, 39, 28),
                          income = c(2500, 2700, 0, 7000, 3400, 3600, 2900))
cust_mart_125 <- cbind(cust_mart_12, cust_mart_5)
head(cust_mart_125)
