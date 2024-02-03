CREATE database leetcode;

use leetcode;
WITH cte as(
Select visited_on,SUM(amount) as amount
From Customer
Group by visited_on)

WITH cte2 as(
Select visited_on,
SUM(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND current row) as amount,
ROUND(AVG(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND current row),2) as avg_amount
From cte
)
Select *
From cte2
Where visited_on >=(Select visited_on from cte
ORDER BY visited_on LIMIT1)+6
ORDER BY visited_on


