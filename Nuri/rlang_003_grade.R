#[Grade] 국어,영어,수학 -> 총점, 평균, 등급

n<-"홍길동"
k<-100
e<-60
m<-80
cat("|이름 :", n
    ,"\n |총점 :", k+e+m
    ,"\n |평균 :", (k+e+m)%/%3
    ,"\n |등급 :",switch(toString((k+e+m)%/%30),
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
    )
)


## stmt 를 합치면 function이 된다
## 4가지가 반드시 있어야 function이 된다.. R syntax
grade <- function(name,kor,eng,math){
  x<-c(kor,eng,math)
  sum<-sum(x)
  avg<-mean(x)
  grade <- switch(
    toString(avg%/%10),
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
  )
  return(c(name,sum,avg,grade))
}
res<-grade('홍길동',100,80,70)
cat(" |이름 :", res[1]
    ,"\n |총점 :", res[2]
    ,"\n |평균 :", res[3]
    ,"\n |등급 :",res[4]
)

## 축약
grade <- function(name,kor,eng,math){
  x<-c(kor,eng,math)
  return(c(name,sum(x),mean(x), switch(
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
res<- grade("강감찬",60,60,60)
cat(" |이름 :", res[1]
    ,"\n |총점 :", res[2]
    ,"\n |평균 :", res[3]
    ,"\n |등급 :",res[4]
)