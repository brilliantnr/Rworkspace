##-- 030 구단승리순으로 순위매기기
## 바차트

df_win_count<-dbGetQuery(conn,
"SELECT 
    A.WINNER,
    COUNT(A.WINNER) 승리
FROM(SELECT
        K.SCHE_DATE 경기날짜,
        CASE
            WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
            WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
            ELSE '무승부'
        END WINNER
     FROM SCHEDULE K
            JOIN TEAM HT
                ON K.HOMETEAM_ID LIKE HT.TEAM_ID
            JOIN TEAM AT
                ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
     WHERE
        K.GUBUN LIKE 'Y'
        AND K.SCHE_DATE LIKE '2012%'
    )A
WHERE A.WINNER NOT LIKE '무승부'
GROUP BY A.WINNER
ORDER BY 승리 DESC"
)

barplot(df_win_count[,2],names.arg=df_win_count[,1])



##-- 029좌석수를 파이그래프로

df_seat_count<-dbGetQuery(conn,
"SELECT
ROWNUM NO,
A.*
  FROM
(SELECT
  S.STADIUM_NAME STADIUM,
  S.SEAT_COUNT NSEAT
  FROM
  STADIUM S
  ORDER BY S.SEAT_COUNT DESC) A
ORDER BY NO "
)

pie(df_seat_count$NSEAT,df_seat_count$STADIUM)


pie(df_seat_count[,3], paste(substr(df_seat_count[,2],1,2),df_seat_count[,3]))


##-- 028
##점수차별로 분류한 경기수. 히스토그램
df_score_count<-dbGetQuery(conn,
"SELECT A.*
  FROM(SELECT
       K.SCHE_DATE GAMEDATE,
       HT.TEAM_NAME || ' VS ' || AT.TEAM_NAME GAME,
       CASE
       WHEN K.HOME_SCORE >= K.AWAY_SCORE THEN (K.HOME_SCORE - K.AWAY_SCORE)
       ELSE K.AWAY_SCORE - K.HOME_SCORE
       END SCOREGAP
       FROM
       SCHEDULE K
       JOIN TEAM HT
       ON K.HOMETEAM_ID LIKE HT.TEAM_ID
       JOIN TEAM AT
       ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
       WHERE
       K.SCHE_DATE LIKE '2012%'
       AND K.GUBUN LIKE 'Y'
       ORDER BY SCOREGAP DESC) A "
)


hist(df_score_count$SCOREGAP,
     xlab = "SCOREGAP",
     ylab = "COUNT",
     col = "yellow",
     border = "blue")




##산포도
##--020 월별 경기수

df_month_count<-dbGetQuery(conn,
"SELECT 
(SELECT COUNT(*)
  FROM SCHEDULE 
  WHERE SCHE_DATE LIKE '201201%') JAN,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201202%') FEB,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201203%') MAR,
(SELECT COUNT(*)
 FROM SCHEDULE
 WHERE SCHE_DATE LIKE '201204%') APR,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201205%') MAY,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201206%') JUN,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201207%') JUL,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201208%') AUG,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201209%') SEP,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201210%') OCT,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201211%') NOV,
(SELECT COUNT(*)
 FROM SCHEDULE 
 WHERE SCHE_DATE LIKE '201212%') DEC
FROM DUAL"
)
df_month_count



inputC<-df_month_count[,]

inputm=c(1:12)



plot(x = inputm,y = inputc,
     xlab = "MONTH",
     ylab = "COUNT",
     xlim = c(1,12),
     ylim = c(0,50),		 
     main = "월별 경기수"
)


##SQL 027 팀별 골키퍼의 평균키로 라인차트 (인덱스값을 팀이름으로 치환가능한지 찾아볼것)

df_gkh_avg<-dbGetQuery(conn, "select
   (select tb.team_name
                       from team tb
                       where tb.team_id like t.team_id) TEAMNAME,
                       round(avg(p.height),2) AVGHEIGHT 
                       from player p
                       join team t
                       on p.team_id like t.team_id
                       group by t.team_id
")
df_gkh_avg

?plot()
plot(df_gkh_avg$AVGHEIGHT ,type = "o",xlab="TEAM_NAME",ylab="AVG_HEIGHT",axes = FALSE)
axis(1, at=1:15, lab=df_gkh_avg[,1]) #x축
axis(2, at=5*0:200 ) #Y축




