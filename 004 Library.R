# title: "R004: 패키지/ 라이브러리"
# author: "정원혁, 2014"


# 패키지 / 라이브러리  ----------------------------------------------------------
## 실습을 위한 준비

rm(list=ls())
remove.packages('ggplot2')

# 위의 결과에서 오류가 나도 문제없다. 계속 진행하자.




# 이제, 다음을 실행하면 오류가 나는 게 정상.

ggplot(iris, aes(Sepal.Length, Sepal.Width))  + geom_point()



# 라이브러리/ 패키지 이름 알아내기 ------------------------------------------------------

# ggplot 이라는 것은 함수인데, 이 함수를 제공하는 라이브러리가 load되어 있어야 실행된다.
# 그럼 이 함수는 어떤 라이브러리에 있는지 먼저 알아야 한다. 
# 코드를 제공하는 사람들은 이 정도는 알아서 할 것이라고 전제하고, 심지어 라이브러리 불러오는 코드까지 제공하지 않는 경우도 종종 있다. 그래서 이 일은 전적으로 각자의 몫이다.
# 별 일이 없다면 함수 이름은 같은 이름의 라이브러리에 있는게 보통이다.
# 아니거나 모르겠다면 
# ?
# ?? 
# 로 검색해보아도 되고, 아예 구글링 해 보아도 된다.
# 검색 키워드: "ggplot r cran"

?ggplot





??ggplot




# 우와 너무 많다. 구글링을 해보자.


# 또는 cran을 빼고 검색해보면


# findFn 함수를 사용해서도 알아낼 수 있다. 


if (!require('sos')) install.packages("sos")
lbirary(sos)

findFn("ggplot2", maxPages = 2)
findFn("car", maxPages = 1)





# 라이브러리의 모든 개체와 구조를 보고 싶다면 다음 명령을 사용한다. 하지만 질려 버릴 것이다.



lsf.str("package:ggplot2")




# 이제 라이브러리 이름을 알아냈다. 라이브러리를 로드 하자.





library(ggplot2)





# 패키지 설치 ------------------------------------------------------------------

# 패캐지가 없으면 설치해야 한다. 
# 설치는 
# 1. 인터넷에 가서 해당 파일을 가져오고, 
# 2. 다운로드 받아 
# 3. 지정된 폴더에 압축을 푸는 것
# 인데 이 모든 것을 다음 명령이 다 해 낸다. 


install.packages("ggplot2")




# 윈도우 기준 지정된 폴더는 'c:\\Program Files\\R\\R-3.5.3\\library' 이다. OneDrive가 설치되면 달라진다. 
# 혹은 다음 명령으로도 알 수 있다.



# 설치된 패키지 경로 확인 -----------------------------------------------------------

.libPaths() 




# 더 심하게는 다음 명령으로도 알 수 있다. 이 명령은 장애가 생기면 참조하고 조사해야 할 명령이다.



Sys.getenv()





# 다시 앞의 코드를 실행해 보자.


ggplot(iris, aes(Sepal.Length, Sepal.Width))  + geom_point()



# 아 여전히 오류다. 패키지 설치만 하고 load를 하지 않았다.



# 라이브러리 load --------------------------------------------------------------

library(ggplot2)

# 다시 앞의 코드를 실행해 보자.

ggplot(iris, aes(Sepal.Length, Sepal.Width))  + geom_point()




# 실행이 잘되어, 그래프가 그려졌다.




# 패키지는 R 세션이 종료되면 사라진다. 다음 번에는 다시 불러야 하지만, 설치를 할 필요는 없다.
# 또 설치를 시도하면 다음과 같이 묻는다.




install.packages('ggplot2')





# 이런 팝업이 뜨면 이미 설치 되어 있으므로 No를 선택하면 된다. Yes를 선택하면 다시 새로 패키지 설치를 하게 되는데 세션이 끊기고 다시 시작되면서 메모리 변수가 지워진다. 그래서 앞서 했던 작업을 다시 해야 한다.


# 라이브러리 unload ------------------------------------------------------------

# 특별히 내려야 할 이유는 없다. 그래도 하겠다면 다음 명령. 
# 아주 가끔 패키지 간 같은 이름의 함수를 가진 경우 충돌을 한다. 그때 내려야 한다.
detach("package:ggplot2", unload=TRUE)
# 메모리에 올라온 모든 패키지 내리기
lapply(paste('package:',names(sessionInfo()$otherPkgs),sep=""),detach,character.only=TRUE,unload=TRUE)




# 이 패키지를 의존하는 다른 패키지가 있을 때는 실패할 수도 있다. 그러면 force = T 옵션을 사용한다.



detach("package:ggplot2", unload=TRUE, force = T)







# 패키지 지우기 -----------------------------------------------------------------
특별히 패키지를 지워야 할 이유는 없다. 그래도 지우겠다면 다음 명령.



remove.packages('ggplot2')





# 패키지 업데이트 하기 -------------------------------------------------------------

## 하나만

update.packages("ggplot2")





## 모든 패키지 업데이트

# update.packages(checkBuilt=TRUE, ask=FALSE) # 주석을 풀어야 한다.


# 단체 강의장 환경에서는 하지 말자. 네트웍이 느려진다. 정말 할 때는 주석을 제거해야 한다. 


## 중복된 Package 삭제



remove.packages(installed.packages() [duplicated(rownames(installed.packages())), 1], lib=.libPaths()[.libPaths() != .Library])






## 우아하게 설치하고 불러오기.

# 패키지가 설치 되어 있지 않으면 설치를 진행한다. 그래서 오류가 나거나 또 설치하겠냐고 묻는 일이 없도록 한다.



if(!require('data.table'))
  install.packages('data.table')
library(data.table)







# 설치 가능한 패키지의 정보 확인하기 

# 구글링이 더 낫다


available.packages() 





# 실습 
# 다음 코드가 동작하도록 필요한 라이브러리를 우아하게 설치하고 불러오자.



plot(ctree(Species ~ ., iris))


