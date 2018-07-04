##c() 대신 list()사용할때

## Data Frame 만들기

grade <- function(name,kor,eng,math){
  x<-c(kor,eng,math)
  return(list(name=name,
              sum=sum(x),
              mean=mean(x), 
              grade=switch(
                toString(mean(x)%/%10),
                  '10'='A',
                  '9'='A',
                  '8'='B',
                  '7'='C',
                  '6'='D',
                  '5'='E',
                  '4'='F',
                  '3'='F',
                  '2'='F',
                  '1'='F'
  )))
}
kang<- grade("강감찬",60,60,60)
kim <-grade("김유신",80,80,80)
hong <-grade("홍길동",70,70,70)
han <-grade("한그루",90,90,90)
yang <-grade("양세형",50,50,50)
cat(" |이름 :", res[1]
    ,"\n |총점 :", res[2]
    ,"\n |평균 :", res[3]
    ,"\n |등급 :",res[4]
)

grade
class(kang$name)
class(kang$sum)
class(kang$mean)
class(kang$grade)


grade.data <- data.frame(
  grade_id = c(1:5),
  grade_name = c(kang$name,kim$name,hong$name,han$name,yang$name),
  grade_sum = c(kang$sum,kim$sum,hong$sum,han$sum,yang$sum),
  grade_mean = c(kang$mean,kim$mean,hong$mean,han$mean,yang$mean),
  grade_grade = c(kang$grade,kim$grade,hong$grade,han$grade,yang$grade),
  stringsAsFactors = FALSE
)
print(grade.data) 



##Extract 이름, 합계
print (
  data.frame(grade.data$grade_name,grade.data$grade_sum)
)



##바차트
barplot(grade.data$grade_mean, names.arg=grade.data$grade_name)

barplot(grade.data$grade_mean, 
        names.arg=grade.data$grade_name, 
        col = "pink", 
        border = NA, 
        xlab = "students", 
        ylab = "Average")



##파이차트
x <- grade.data$grade_mean
pct <- round(x / sum(x) * 100)
labels <- paste(grade.data$grade_name, pct,"%",sep="")
pie(x,labels)


##히스토그램
hist(grade.data$grade_mean,
     xlab = "Average Score",
     ylab = "number",
     col = "yellow",
     border = "blue")

## 라인차트
plot( grade.data$grade_mean,type = "o",xlab = "students")




