# title: "R120: Data type"
# author: "정원혁, 2014"


# 변수의 선언, 설정, 읽기, 출력  -----------------------------------------------------

# 변수명 <- 값
# <- 는 Alt와 - 를 누르면 된다. 
# = 을 사용해도 되긴 하다.

rm(list = ls())
a =  "Hello"
b <- 'R World!'
bmi <- weight / height ** 2

# 출력은 print(변수) 를 해도 되지만, 그냥 변수명만 써도 된다.

print(a)
b

c <- a + b  # Error in d + e : non-numeric argument to binary operator

# 위의 것은 오류다. 결합할 때는 paste를 써야 한다. sep는 두 변수 사이에 뭘 둘 것인가를 지정한다. 
f <- paste(a, b, sep = ' ')
f


# R의 자료형  -----------------------------------------------------------------
## 1. 문자 character

## 2. 수치형numeric 
 
### 2.1 정수 interger: 1L, 2L  # L 을 붙여 정수형이라고 알려준다. 
### 2.2 실수 double: 1, 3.14, -300

## 3. 복소수 complex

## 4. 논리 logical: TRUE (T, 1), FALSE (F, 0) #대소문자 구분한다. 


# R의 자료 구조 ----------------------------------------------------------------
## 1. vector
## 2. matrix
## 3. array
## 4. data frame
## 5. list
## 6. factor 


# R의 자료형 더 자세히  -----------------------------------------------------------
# mode(), typeof() 는 자료형을 보여주는 함수다.

mode(1)
mode(1L)
mode(3.24)
mode(TRUE)
mode('홍길동')
mode(3+4i)

typeof(1)
typeof(1L)
typeof(2.3)
typeof(TRUE)
typeof('홍길동')
typeof(3+4i)



# vector   ----------------------------------------------------------------

# 1차원 배열이다. 
x <- 1
x

x[1] <- 1
x[1]
x

# R에는 스칼라가 없다. 엘리먼트 1인 vector만 있다. (R에서 스칼라처럼 보이는 것은 실제로 한개의 원소로 구성된 벡터이다.)
# 위의 x도 사실은 
# x[1] 
# 과 같다. (벡터의 인덱스는 0이 아닌 1 부터 시작한다)
# 벡터의 원소는 모두 같은 데이터 타입(mode)이어야 한다. 

x <- 1:10 # 1부터 10까지 
x


## vector 더 자세히 


x <- c(2,3, 10:15, 4)  # 원소들이 모두 정수! # 정수 아닌 것이 오면?
x
str(x) # str == structure

# c == concatenate / combine 
w = c('a', 'x')
w

x = c(1, 100)
x

# 정수 아닌 것이 오면 무슨일이 벌어질까? 
y <- c(100, x, 20.4, "what")    # 원소 타입들이 다 같지 않다 
y  # 모든 원소 타입들이 character 로 바뀌었다. R이 에러를 내지 않고 바꾼다


str(x) # num 즉 numeric 형을 가지고 있다.
str(y) # chr 즉 character 형을 가지고 있다.


# typeof() 는 벡터의 mode, 즉 원소들의 자료형을 보여준다

typeof(x)
typeof(y)


# 우측 변수 창에서 이 변수들이 어떤 타입인지 보면서 한 줄씩 실행한다.
rm(list=ls())
x <- c(0.5, 0.6)  # numeric
x <- c(TRUE, FALSE)  # logical
x <- c(T, F)  # logical
x <- c("a", "b", "c") # character
x <- 9:29  # integer
x <- c(1+0i, 2+4i)  # complex

# 길이 10, 즉 10개 배열을 가진 벡터를 만든다. 값이 할당되지 않았다.
x <- vector("numeric", length = 10) 
x


y <- c(1.7, "a")  # character
y <- c(TRUE, 2)  # numeric
y <- c("a", TRUE) # character


x <- 0:6
class(x)


## 벡터의 조작 

# 벡터의 원소들은 메모리에 연속된 위치로 저장되기에 중간에 새로운 원소를 끼워 넣던가 또는 잘라낼 수 없다.  
# 따라서, 기존 벡터를 편집하려면 새 벡터를 만들어 다시 기존 (벡터)변수에 배정해야 한다.

x <- c(1,2,3,5)
x
c(x[1:3],      4,        x[4])
x <- c(x[1:3],      4, x[4])
x 



## 벡터의 길이  


x
length(x)   # vector의 길이 알기


## 벡터 recycling 


(a <- 1:2)
(b <- 11:14)
a+b

#    1,  2,  1,  2  
# + 11, 12, 13, 14
# 로 갯수를 더 큰 벡터의 갯수에 맞추어 재활한다. 



# matrix  -----------------------------------------------------------------
# 2차원의 배열. 즉 2차원의 vector이다. 

x <- matrix(1:10, 5,2)
x


## matrix 더 자세히 

m <- matrix(nrow = 2, ncol = 3) 
m


x <- matrix(1:12, 5,2) # 오류.

# 배열인 경우 배열의 크기를 알려준다. 세로, 가로(column, row)의 순서다. 
dim(m)


attributes(m)

# 매트릭스는 우리 습관과 다르게 컬럼 우선이다. 숫자의 증가 값을 살펴보자. 통계 처리를 할 때 변수별로 컬럼에 담기기 때문일 것으로 생각된다.
m <- matrix(1:6, nrow = 2, ncol = 3) 
m


?matrix

# byrow = FALSE 를 지정하면 row 우선으로 매트릭스를 만들 수 있다.
# TRUE 라고 해도 되고 T만 해도 된다. FALSE 도 F 만 입력해도 된다. 문법에 나온 값이 디폴트 값이다. 

m <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE) 
m



m <- matrix(1:6, nrow = 2, ncol = 3, byrow = T) 
m

# 벡터를 대입하여 매트릭스를 생성할 수도 있다.

m <- 1:10
m

dim(m) <- c(2, 5)   # 2 * 5 빈 매트릭스를 만든다. 거기에 값을 대입한다.
m





# array  ------------------------------------------------------------------



# 3차원 이상.

x <- array(1:36, c(4,3,3))
x


## vector로서 array/ matrix 의 이해 

# array와 matrix 데이터구조도 사실은 벡터이다. 
# 다만 이 것들이 일차원 배열 형태가 아니고, 2차원 이상이며 
# "차원(dimension)"이라는 속성(attribute)을 갖고 있는 것이 단순 벡터와 다른 점이다. 


# data frame  -------------------------------------------------------------


# column 마다 데이터형(mode)이 다른 array
# 테이블 형태로 데이터를 저장한다.
# 모든 요소의 길이가 같은 list로 이해 된다.
# list의 특별한 형태라고도 할 수 있다.

x <- mtcars
x


str(x)


## data frame 더 자세히 

# Data frame 은 row.names 라는 특별한 속성을 갖는다.
# Data frame 은 일반적으로 read.table() 이나, read.csv() 를 통해 만들어진다.
# data.matrix() 함수를 사용해서 matrix 로 변환 가능하다.
x <- data.frame(foo = 1:4, bar = c(T, T, F, F)) 
x

x <- data.frame(1:4, c(T, T, F, F)) 
x


nrow(x)
ncol(x)





# list  -------------------------------------------------------------------

# 완전히 이질적인 데이터를 강제로 모은 것
# list는 특수한 형태의 벡터다. 
# 어렵지만 잘 이해해야 한다. 
# 서로 다른 유형(class)의 원소(element)를 가질 수 있기 때문에 활용도가 뛰어나다.

ls() #메모리에 저장된 변수는 대표적인 list이다. 
x <- matrix(1:10, 5,2)
x

y <- head(mtcars)
str(y)

z <- c( x, y )
str(z)
z



# 아래 1과 2의 차이는?
a <- "a"
b <- 1
c <- TRUE

# 1.
x <- c(a,b,c); x
str(x)
x[1]
x[3]


# 2.
x <- list(a,b,c); x
str(x)
x[1]
x[3]


# 각각이 다른 벡터이기 때문에 더블 브래킷으로 표시한다.

x <- list("char", c(1,2), TRUE, c(T,F), c("a", "b"))
x
str(x)
x[1]
x[2]
x[[2]]
x[[2]][1]
x[[2]][2]

#"b"를 출력하려면?

x <- list("char", num=c(1,2), TRUE, Bool=c(T,F), c("a", "b"))
x
str(x)
x[1]
x[2]
# 리스트의 이름이 있다면 $이름 으로도 사용 가능하다.
x$num
x$num[2]
x[[2]][2]
x$Bool[1]
x$Bool


# Factors  ----------------------------------------------------------------

# 변수가 값 그 자체가 아니라 범주를 의미할 때 factor라고 한다. 
# 숫자 값을 갖더라도 그 것이 숫자로서의 의미가 없다. 
# 예를 들어 성별 0은 여자, 1은 남자 라면 이 값의 평균을 구하거나 합을 구하는 것은 아무 의미가 없다. 

#1
x <- c(1,2,3, 2,2,2, 3)
x
summary(x)
str(x)  #structure

#2
x.f <- as.factor(x)
summary(x.f)

#1
x <- c("yes", "yes", "no", "yes", "no")
summary(x)

#2
x <- factor(c("yes", "yes", "no", "yes", "no")) 
summary(x)


# factor 이기 대문에 level 이 나타난다.
# x 값을 테이블 형태로 변환한다.

table(x) 
x


y <- unclass(x)
y
attr(y,"levels")
str(y)


# 레벨의 순서를 정할 수 있다. 나중에 linear modelling 에서 첫 레벨이 기준이 되기 때문에.
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x
summary(x)

x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("no", "yes"))
x



## split


?split
x <- split(iris, iris$Species)

# iris 150개 행을 Species에 따라 리스트로 다시 나눈다.
summary(x)
str(x)

x$setosa[1,]
x$versicolor[1,]
x$virginica[1,]




# 성능 이야기 ------------------------------------------------------------------

# R 세상은 매우 급격히 변한다. read.csv와 read.table, data.frame 이 있지만, fread가 나오고 엄청난 성능을 내고 있다. 
# 여기 내용은 기초 학습용으로만 익히고, __fread__와 __data.table__을 사용하도록 하자. 
# [data.table과 data.frame 성능 비교](https://using.tistory.com/81)

