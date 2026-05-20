

CREATE DATABASE sales_retail

USE sales_retail

SELECT * 
FROM [dbo].[Sales_retail]

SELECT * 
FROM [dbo].[Sales_retail] WHERE 
Region IS NOT NULL

SELECT COUNT(*) AS Grp_strategy,Retention_Strategy
FROM [dbo].[Sales_retail]
GROUP BY Retention_Strategy 

SELECT COUNT(*) AS Reg_Count,Region,
Most_Frequent_Category FROM [dbo].[Sales_retail]
GROUP BY Most_Frequent_Category,Region


SELECT MAX(Churn_Probability),Region,Season,Most_Frequent_Category
FROM [dbo].[Sales_retail]
GROUP BY Region,Season,Most_Frequent_Category


SELECT ROUND(AVG(Churn_Probability *100),2) AS AVG_CHURN,
Most_Frequent_Category,Retention_Strategy
FROM [dbo].[Sales_retail]
GROUP BY Most_Frequent_Category,Retention_Strategy


WITH Churn_risk AS(SELECT *,
ROW_NUMBER()
OVER(PARTITION BY Season
ORDER BY Churn_Probability ASC)
AS rn FROM [dbo].[Sales_retail])

SELECT * FROM 
Churn_risk WHERE rn=10

SELECT AVG(Lifetime_Value) AS MAX_LIFE
,Most_Frequent_Category,Retention_Strategy
FROM [dbo].[Sales_retail]
GROUP BY Most_Frequent_Category,Retention_Strategy

