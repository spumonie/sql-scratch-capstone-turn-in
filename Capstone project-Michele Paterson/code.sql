q1

SELECT * 
FROM survey;



q2/q3

SELECT question, COUNT(DISTINCT user_id)
 FROM survey
 GROUP BY question;


q4

select *
from quiz
limit 5;


select *
from home_try_on
limit 5;


select *
from purchase
limit 5;


q5 

SELECT q.user_id, 
CASE  
  WHEN h.user_id IS NOT NULL
  THEN 'True'
  WHEN h.user_id IS NULL
  THEN 'False'
END AS 'is_home_try_on',
CASE
	WHEN h.number_of_pairs IS NULL 
  THEN 'NULL'
  ELSE h.number_of_pairs
END AS 'number_of_pairs',
CASE
	WHEN p.user_id IS NOT NULL 
  THEN'True'
  WHEN p.user_id IS NULL 
  THEN 'False'
END AS 'is_purchase'
FROM quiz 'q'
LEFT JOIN home_try_on 'h'
ON q.user_id = h.user_id
LEFT JOIN purchase 'p'
ON p.user_id = q.user_id
LIMIT 10; 

q6

WITH funnel AS (
SELECT q.user_id, 
CASE  
  WHEN h.user_id IS NOT NULL
  THEN 'True'
  WHEN h.user_id IS NULL
  THEN 'False'
END AS 'is_home_try_on',
CASE
	WHEN h.number_of_pairs IS NULL 
  THEN 'NULL'
  ELSE h.number_of_pairs
END AS 'number_of_pairs',
CASE
	WHEN p.user_id IS NOT NULL 
  THEN'True'
  WHEN p.user_id IS NULL 
  THEN 'False'
END AS 'is_purchase'
FROM quiz 'q'
LEFT JOIN home_try_on 'h'
ON q.user_id = h.user_id
LEFT JOIN purchase 'p'
ON p.user_id = q.user_id)
SELECT COUNT(DISTINCT user_id) AS 'q', 
COUNT(DISTINCT CASE WHEN is_home_try_on = 'True'
             THEN user_id END) AS 'q_to_h',
COUNT(DISTINCT CASE WHEN number_of_pairs = '3 pairs' THEN user_id END) AS '3_q_to_h',
COUNT(DISTINCT CASE WHEN number_of_pairs = '5 pairs' THEN user_id END) AS '5_q_to_h',
COUNT(DISTINCT CASE WHEN is_purchase = 'True'
      THEN user_id END) AS 'h_to_p',
COUNT(DISTINCT CASE WHEN number_of_pairs = '3 pairs'
     AND is_purchase = 'True' 
     THEN user_id END) AS '3_h_to_p',
COUNT(DISTINCT CASE WHEN number_of_pairs = '5 pairs'
      AND is_purchase = 'True' 
      THEN user_id END) AS '5_h_to_p'
FROM funnel;









 



