help("solve")
?solve
#java : int a = 3;
# System.out.print(a);
a <- "3"
a
b <-4
b
c <- a + b
a <- 3
c<- a+ b
c

a<- c(1,2,3,4)
a
a<-c(1,"2",3,"4")
a
# int[] arr = new int[3];
#arr[0]= 1;
#arr[1]= 2;
#arr[2]= 3;
#arr <- c(1,2,3)

x<-c(1,2,3,4,5,6,7,8,9,10)
sum(x)
sum((x-mean(x))^2/(length(x)-1))

?seq
x <- seq(length=10,from=1,by=1)
x
sum(x <- seq(length=100,from=1,by=1))

?sample
#s:0  r:1  p:2
com <- sample(1:3,1,replace=TRUE)
user <- 2
if(user-com==-1 ||user-com==2) print("win")else
if(user-com==1 ||user-com==-2)print("lose")else
  print("draw")
    
#switch 
com <- sample(1:3,1,replace = TRUE)
user <- 2
cat("컴퓨터 : ",com)
res <-toString(com-user)
cat("결과 :",res)
x <- switch(
  res,
  '2' = "win",
  '-1'= "win",
  '1'="lose",
  '-2'="lose",
  '0'="draw"
)
print(x)


#switch
user <- 2
print(switch(
  toString(sample(1:3,1,replace = TRUE)-user),
  '2' = "win",
  '-1'= "win",
  '1'="lose",
  '-2'="lose",
  '0'="draw"
))


#BMI
height <-180
weight <-100
bmi=weight/(height^2/10000)
if(bmi< 18.5) print('저체중') else 
if(bmi>=18.5 && bmi<23)print('정상')else 
if(bmi>=23 && bmi<25) print('비만 전단계')else 
  if(bmi>=25)print("1단계 비만")else 
    if(bmi>=30)print("2단계 비만")else
      print("3단계 비만")

#vector 만들기

print(
  c(1:10)
)
print(
 seq(from=1,to=10,by=2) 
)
print(
 seq(from=1,length=10,by=2) 
)
print(
 seq(1,10,2) 
)
print(
 rep(1:5) 
)
print(
  rep(1:5,each=2) 
)
print(
  rep(1:5,times=2) 
)
print(
  rep(1:5,each=2,times=3) 
)
print(
  rep(1:5,times=3,each=2,len=5) 
)
print(
  rep(1:5,times=2,each=3,len=5) 
)

# 기본타입 : character,wide charactier,integer
#floating point,double floating point,Boolean etc.
#R-objects : Vector, List, MAtric, Array, Data Prame
#vector의 6개 타입
#LOgical(T,F), Numeric(실수), Integer(정수)
#Complex(허수), Character(문자열), Raw(주소값)

#계산기 만들기
x<-5
y<-2
op<-"%"
cat(x,op,y,'=',switch (op,
  "/" = x%/%y,
  "+" = x+y,  
  "-" = x-y,
  "*" = x*y,
  "%" = x%%y,
  "^" =x^y
)
)


#1+2+3+4+5=15
for(i in 1:5){
if(i==5)cat(i,"=",sum(x))
else  cat(i,'+')}
   

#1-2+3-4+ ...-100=-50

s = 0
for(i in 1:100){
if(i==100){
  cat(i,'=',s = s - i)} else
  if(i%%2==0){
    s = s - i
    cat(i,'+')}
  else
    {s = s +i
    cat(i,'-')}
}

for(i in 1:100){
  if(i==100){
    cat(i,'=',sum(seq(1,100,2))+sum(seq(0,-100,-2)))} else
      if(i%%2==0){
        cat(i,'+')}else
        {cat(i,'-')}
}










