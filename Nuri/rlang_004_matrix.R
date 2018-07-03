#삼각형, 지그재그 ,  다이아몬드

x<-c(1,2)
cat(x)
x<-append(x,3)
cat(x)


##
n<-1
for(i in 1:8)
{
  n<-n*2
}
cat(n)
    

##
x=c()
x[1]=1
cat(x)
for(i in 2:5)
{
  x[i]=i
}
cat(x)

##
x<-c(1,2,3,4,5)
y<-c(10,9,8,7,6)
z<-append(x,y)


##
mtxselect<-function(num){
  return(switch(toString(num),
                '1'= rbind(c(1,0,0,0,0),
                           c(2,3,0,0,0),
                           c(4,5,6,0,0),
                           c(7,8,9,10,0),
                           c(11,12,13,14,15)
                           ),
                '2'= rbind(c(1:5),
                           c(10:6),
                           c(11:15),
                           c(20:16),
                           c(21:25)
                           ),
                '3'= rbind(c(0,0,1,0,0),
                           c(0,2,3,4,0),
                           c(5:9),
                           c(0,10,11,12,0),
                           c(0,0,13,0,0)
                           )
  ))
}
mtxselect(3)



