install.packages("ggplot2")  #R studio에 들어옴
library(ggplot2)

read.csv(file = "C:\\Users\\1027\\Rworkspace\\Nuri\\2013년_전년대비_시간대별_교통사고_사망자_현황.csv")


x<-c("2","2","3","1","4","4","4")
x
qplot(x)
rm(x)  #remove



# <manufacturer>
# model : model name
# displ : engine displacement, in litres
# year  : year of manufacture
# cyl   : number of cylinders
# trans : type of transmission
# drv   : f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# cty   : city miles per gallon
# hwy   : highway miles per gallon
# fl    : fuel type
# class : "type" of car

##### mpg 데이터 파악하기
#data = mpg, x축에 변수 지정하여 그래프 생성
qplot(data= mpg, x= hwy)
#x 축 cty
qplot(data= mpg, x= cty)

# mpg 데이터를 데이터 프레임으로 만든다
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)  #상위 5개의 데이터보여줌
tail(mpg)   #맨아래 5개의 데이터보여줌
dim(mpg)   #234 :행의 개수, 11:열의 개수 =>구조보여준다
str(mpg)   #structure 분석
summary(mpg)  #

#통합연비 변수 생성
#없던 속성을 mpg$속석명으로 생성 가능
mpg$total<-(mpg$cty+mpg$hwy)/2
head(mpg)
#통합연비 변수 평균
mean(mpg$total)
# 요약 통계량 산출
summary(mpg$total)
hist(mpg$total)
# total 연비의 평균과 중앙값이 약 20이다
# total 연비가 20~25 사이에 해당하는 자동차 모델이 가장 많다
#대부분 25 이하이고, 25넘기는 자동차는 많지 않다


##합격 판정 변수 만들기
##total 이 20이상이면 pass, 미만이면 fail 을 부여하는 test 라는 변수를 생성합니다.

#library 안하면 에러남
mpg$test <-ifelse(mpg$total >=20, "pass", "fail")
head(mpg, 20)
#합격판정을 받은 자동차 수 살펴보자
table(mpg$test)
qplot(mpg$test)

##중첩조건문
##total 30 이상이면 A
# total 20~29 :B
# total ~20 :C

mpg$grade <-ifelse(
  mpg$total >= 30, "A",
  ifelse(
    mpg$total >= 20, "B", "C"
    )
)
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)


mpg$grade <-ifelse(
  mpg$total >= 30, "A",
  ifelse(
    mpg$total >= 20, "B", 
    ifelse(
      mpg$total >= 10, "C", "D"
    )
  )
)



# ggplot2 패키지에는 미국 동북중부 437개 지역의 
# 인구통계 정보를 담은 midwest 라는 데이터가 들어 있습니다.
# midwest 데이터를 사용해 데이터 분석 문제를 해결하시오

# 1.  poptotal 변수를 total 로, popasian 변수를 asian 으로 수정하세요

# 2-1.
# total, asian 변수를 이용해 
# '전체 인구 대비 아시아 인구 백분율' 파생변수를만들고,
# 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보시오.

# 2-2. 
# 아시아 인구 백분율 전체 평균을 구하고, 
# 평균을 초과하고 'large' , 
# 그 외에는 'small' 을 부여하는 파생변수를 만드시오.

# 2-3.
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지 
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.

midwest_test <-as.data.frame(ggplot2::midwest)
summary(midwest_test)
# 1. 
midwest_test$total <- midwest_test$poptotal
midwest_test$asian <- midwest_test$popasian

midwest_test <- subset(midwest_test,select = -poptotal)
midwest_test <- subset(midwest_test,select = -popasian)

# 2-1
midwest_test$asianper <-(midwest_test$asian/midwest_test$total)*100
hist(midwest_test$asianper)
# 2-2
mean(midwest_test$asianper)


midwest_test$asianls <-ifelse(
  midwest_test$asianper > mean(midwest_test$asianper), "large", "small"
  )











