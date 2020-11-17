# title: "R140: Function"
# author: "정원혁, 2014"



# 함수 만들기  -----------------------------------------------------------------


f <- function(x) return(x+1)


# 함수 코드 보기  ---------------------------------------------------------------

f


# 함수 호출 -------------------------------------------------------------------
f(10)


# 사용 예 --------------------------------------------------------------------

## 벡터를 받아서 리턴하는 것도 가능하다.

a <- 1:4
f(a)

# 두개 값을 리턴할 때
f <- function(x) {
  c(x+1,
    x*2
  )
}
f(10)


## 벡터를 받고, 메트릭스를 리턴하는 것도 가능하다.
f <- function(x) return (matrix(x, x+1))
a <- 1:4
f(a)


## 표준 편차를 구하는 함수를 만들어 본다.

data <- c(9, 2, 5, 4, 12, 7, 8, 11, 9, 3, 7, 4, 12, 5, 4, 10, 9, 6, 9, 4)
my.sd <- function(v)    # local 변수를 사용하지 않음 
{
  sqrt( sum( (v - mean(v))^2 ) / (length(v) - 1) )
}
sd(data)      
my.sd(data)   # 결과가 같다



## 홀수만 리턴하는 함수를 만든다
oddcount <- function(x)  {
  k <- 0  # assign 0 to k
  for (n in x)  {
    if (n %% 2 == 1) k <- k+1  # %% is the modulo operator
  }
  return(k)
}
oddcount(1)
oddcount(2)




## 자주 사용하게 될 기술 통계 함수를 만들어 보자.
desc.stat <- function(x) {
  c(n = length(x), na.count = sum(is.na(x))
    , min = min(x, na.rm = T)
    , qt1st = quantile(x, 0.25,na.rm = T)
    , median = median(x, na.rm = T)
    , mean = mean(x, na.rm = T)
    , qt3st = quantile(x, 0.75,na.rm = T)
    , max = max(x, na.rm = T)
    , range = max(x, na.rm = T) - min(x, na.rm = T)
    , sd = sqrt( sum( (x - mean(x))^2 ) / (length(x) - 1) )
    )
}

desc.stat(mpg$displ)

# soucre()를 사용하면 이 함수를 별도의 파일에 두고 호출하여 사용하는 것이 가능하다. 
source('desc.stat.R')

