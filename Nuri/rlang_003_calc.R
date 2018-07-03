#계산기 만들기

calc<-function(x,op,y){
  return(c(x,op,y,switch (op,
                          "/" = x%/%y,
                          "+" = x+y,  
                          "-" = x-y,
                          "*" = x*y,
                          "%" = x%%y,
                          "^" =x^y
  )))
}

res <- calc(5,'%',2)
cat(res[1],res[2],res[3],"=",res[4])