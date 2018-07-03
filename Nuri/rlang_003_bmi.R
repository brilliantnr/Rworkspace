##[BMI]

letbmi<-function(height,weight){
  bmi=weight/(height^2/10000)
  
  return(c(height,weight,if(bmi< 18.5)'저체중' 
         else if(bmi>=18.5 && bmi<23)'정상'
         else if(bmi>=23 && bmi<25) '비만 전단계'
         else if(bmi>=25)"1단계 비만"
         else if(bmi>=30)"2단계 비만"
         else "3단계 비만")
  )
}
res<-letbmi(180,80)
cat(" |키 :",res[1]," |몸무게 :",res[2]," |bmi 결과 :",res[3] )

