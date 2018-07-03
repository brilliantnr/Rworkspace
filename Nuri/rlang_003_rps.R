##가위바위보, bmi, 계산기

#[rps] s:0  r:1  p:2

rps<-function (user){
  return(switch(
    toString(sample(1:3,1,replace=TRUE)-user),
    '2' = "win",
    '-1'= "win",
    '1'="lose",
    '-2'="lose",
    '0'="draw"
  ))
}
res<-rps(2)
cat(" 결과 :", res)

