SELECT Today.id
FROM Weather AS Today
JOIN Weather AS Yesterday
  ON DATEDIFF(Today.recordDate, Yesterday.recordDate) = 1
  where Today.temperature >Yesterday.temperature 
