# title: "R110: File 처리"
# author: "정원혁, 2014"
# R 세상은 매우 급격히 변한다. read.csv와 read.table, data.frame 이 있지만, fread가 나오고 엄청난 성능을 내고 있다. 
# 여기 내용은 기초 학습용으로만 익히고, __fread__와 __data.table__을 사용하도록 하자. 
# [data.table과 data.frame 성능 비교](https://using.tistory.com/81)


# 작업 위치 지정 ----------------------------------------------------------------

# 파일을 읽고 쓰는 디폴트 위치는 현재 소스파일이 열린 위치다. 
# 다른 위치를 사용하고 싶다면 setwd로 이를 지정해야 한다.
# 윈도우에서 사용하는 \\는 특수 문자이므로 역슬래시 두개를 적어야 한다. 
# 차라리 유닉스에서 사용하는 /로 Path를 적어주는 것이 더 낫다.

# 예: 
# c:\data
# c:/data


## getwd
# 다음 명령으로 현재 위치를 알아낼 수 있다.

getwd()


## setwd
# 다음 명령으로 작업할 위치를 지정할 수 있다. 여기서 모든 파일을 읽고, 쓴다.

setwd('c:\\temp')



# 앞으로는 특별한 언급이 없어도 자신의 작업 폴더를 제대로 지정한 것을 전제로 한다.
# R stuido 메뉴에서 Session / set working directory를 실행해도 된다. 


# 데이터 파일  -----------------------------------------------------------------


# # 데이터 파일 쓰기 -------------------------------------------------------------
View(mtcars)
# mtcars 내용을 csv로 저장해 보자.
getwd() #다시한 번 강조! 이 위치에 저장된다. 
write.csv(mtcars, 'mtcars.csv')
# write.csv(mtcars, 'c:/temp/mtcars.csv') #setwd를 무시하려면 파일명에 path를 함께 적는다.


# 제대로 저장되었는지 확인해 보자.




# 실습  ---------------------------------------------------------------------
# write.csv의 도움말을 찾아보고, 

# 1. 탭으로 구분하여 저장해 보자.
 
# 2. UTF-8 인코딩으로 파일을 저장해 보자.
 
# 3. write.table 로도 1과 2의 실습을 해보자. 차이점이 무엇일까?






## 데이터 파일 읽기 -------------------------------------------------------------


### csv 읽기
# 앞서 저장한 mtcars.csv를 불러오자.
read.csv('mtcars.csv')


# ### 실습  -----------------------------------------------------------------
# 제대로 읽었는지 알 수가 없으니 변수에 저장하고 head, tail, str을 사용해서 확인하는 코드를 완성해 보자. 

m <- read.csv('mtcars.csv')
m

# 여기에 코드 작성





# 이 함수는 사실 read.table과 같다. 단지 디폴트 옵션만 다르게 설정되어 있다.
# read.table로도 같은 작업을 반복해 보자.





# read.table로 읽어오기









# ## 엑셀 읽기 / 쓰기 -----------------------------------------------------------
# 엑셀 보다 csv 가 더 가볍다. 특별한 이유가없다면 csv를 읽도록 하자. 
# 
# "이 라이브러는 rJava를 필요로 한다. rJava가 설치되고 제대로 동작하지 않으면 실행 할 수 없다."
# 
# "020java test.R" 를 실행하고 아무 문제 없을 때만 이후 수행이 가능하므로 안되면 스트레스 받지 말고 csv로 변환하여 읽어오자.



if (!require('xlsx')) install.packages('xlsx')
library(xlsx)  # 엑셀 파일을 읽어 들이기 위한 패키지 먼저 설치후 사용

write.xlsx(mtcars, 'mtcars.xlsx', sheetName="Sheet1", 
           col.names=TRUE, row.names=TRUE, append=FALSE)

read.xlsx('mtcars.xlsx', 1) #sheet 1번 읽기 




# ## encoding 옵션  ---------------------------------------------------------

# 유닉스, 맥, 다른 나라 파일 등은 (한글) 코드 페이지가 다르다. 그럴 때는 encoding / fileEncoding 옵션을 사용해서 깨어짐을 해결한다.

# 컬럼이름 네 개만 한글로 바꾸자. 
m <- mtcars
colnames(m)[1:4] <- c('연비', '실린더', '배기량', '마력')
colnames(m)

# UTF-8 포맷으로 저장한다. 
write.csv(m, 'mtcarsUTF.csv', fileEncoding = 'UTF-8') 
# 필요하면 이 파일을 열어보자. 

read.csv('mtcarsUTF.csv', fileEncoding="CP949") # 인코딩 때문에 오류
read.csv('mtcars.csv', fileEncoding="UTF-8") # 인코딩 때문에 오류
read.csv('mtcarsUTF.csv', fileEncoding="UTF-8") # 제대로 읽힌다.
# read.csv('mtcars.csv', fileEncoding="UTF-8", encoding="UTF-8") # 필요하면






# ## 인터넷 파일 읽어오기 ----------------------------------------------------------

# 인터넷 상에 있는 것도 동일하게 읽어 올 수 있다.

w <- read.csv("https://raw.githubusercontent.com/MateLabs/Public-Datasets/master/Datasets/wine.csv")
head(w)





# ### 실습 ------------------------------------------------------------------

# Kaggle 사이트에는 많은 데이터가 있다. 
# 
# 1. 회원 가입을 하고, 
# 2. 다음 파일을 다운로드 받는다. 
# https://www.kaggle.com/hesh97/titanicdataset-traincsv/downloads/titanicdataset-traincsv.zip/1
# 3. 압축을 푼다. 
# 4. str로 읽어온 파일을 살펴보자.



# 여기에 코드를 작성하자.







##속도가 더 빠른 fread



# 탁월하게 속도가 빠르다. 
# 더 공부한 후에 "111 파일 다루기 성능비교.R" 코드를 실행해보자. 


if(!require('data.table'))  install.packages('data.table')
library(data.table)
f <- fread('mtcars.csv')


# 출력 리디렉션 -----------------------------------------------------------------

# R은 모든 출력을 원하는 대로 자유롭게 보낼 수 있다.
# 다음 코드의 의미는 신경쓰지 말고 실행해보자. 





if(!require('party')) install.packages('party')
library(party)

i <- ctree(Species ~ ., iris)
i
plot(i)

plot(ctree(mpg ~ ., mtcars))







## PDF로 출력



# 이제 이 결과를 PDF로 저장하자. 
# 그림만 저장된다.



getwd() # 현재 폴더를 다시 한번 확인 한다. 이곳에 저장된다.

pdf("tmp.pdf")
  i <- ctree(Species ~ ., iris)
  i # 이건 저장되지 않는다.
  plot(i)
  
  plot(ctree(mpg ~ ., mtcars))
dev.off()




# pdf()
# 
# 와 
# 
# dev.off()
# 
# 사이에 있는 그림 출력은 모두 tmp.pdf 에 저장된다.
# 저장된 파일을 찾아서 확인해보자.







## 텍스트 출력을 저장



# 그림뿐 아니라 텍스트 출력을 파일로 보낼 수도 있다.(그래픽은 pdf()를 사용한다.)

getwd()

sink('Routput.txt', append=FALSE, split=TRUE) # 파일로 저장하기 시작
# split=TRUE 화면에도 출력한다. 

  ctree(Species ~ ., iris) 
  plot(ctree(Species ~ ., iris)) # 이건 저장되지 않는다.

  
sink() #파일로 보내는 것을 중지한다.









# 메모리  --------------------------------------------------------------------

# R은 재연가능한 방법을 제공한다. 그래서 메모리 상태를 그대로 저장하고 불러올 수 있다. 
# 데이터 수집과, 전처리 작업은 꽤나 지루하고, 긴 시간을 요구한다. 예를 들어 크롤링을 한다면 24시간 이상이 걸릴 수도 있다. 그래서 이미 수집된 자료, 정제된 자료를 가지고 작업을 시작하고 싶다면 이 과정이 끝난 상태를 저장하면 된다.



# ## 이미지 쓰기 ---------------------------------------------------------------

# save() 와 save.image()를 사용하여 이미지를 저장할 수 있다.
# 우측 변수 창에 나나탄 변수 목록을 확인해 두자.
ls()


# 현재까지 작업한 상태를 그대로 파일에 저장해보자. 
save.image("110rFile.RData")

# 또는 특정 변수만 지정하여 저장할 수도 있다.
save(w, file='w.RData') # w 변수만 저장한다.

# 저장된 파일을 확인해 보자.


# ## 이미지 읽기  --------------------------------------------------------------
# 우선 메모리를 비우자.
rm(list=ls())
ls()

# 이미 저장된 파일을 불러온다. 
load('w.RData')
ls()

load('110rFile.RData')
ls()

# 당연히 결과는 교재와 다를 수 있다. 자신이 저장했던 당시 목록과 일치한다.

