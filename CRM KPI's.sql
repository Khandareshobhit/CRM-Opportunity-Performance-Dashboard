##
#### KPI FOR OPPORTUNITY DASHBOARD
##

# 1) Expected Amount

SELECT CONCAT("$",CONCAT(ROUND(SUM(`Expected Amount`)/1000000,2)," M")) AS Expected_Amount
FROM `opportunity table`;

# 2) Total Opportunities

SELECT DISTINCT COUNT(`Opportunity ID`) AS Total_Opportunity
FROM `opportunity table`;

# 3) Active Opportunities

SELECT COUNT( Closed) AS Active_Opportunities
FROM `opportunity table`
WHERE Closed = "FALSE";

# 4) Conversion Rate in (%)

SELECT  
		CONCAT(
				ROUND(
						(
							(SELECT COUNT(Won) FROM `opportunity table` WHERE Won = "TRUE")
							/
							(SELECT DISTINCT COUNT(`Opportunity ID`) FROM `opportunity table`) 
						) * 100 
					,2)
			,"%") AS Conversion_Ratio;
            
# 5) Win Rate

SELECT 
		CONCAT (
				ROUND(
							(
								(SELECT COUNT(Won) FROM `opportunity table` WHERE Won = "TRUE")
								/
								((SELECT COUNT(Won) FROM `opportunity table` WHERE Won = "TRUE")
								 +
								(SELECT COUNT(*) FROM `opportunity table` WHERE Closed = "TRUE" AND Won = "FALSE"))
						*100)
				   ,2)
			,"%") AS Win_Rate;
            
# 6) Loss Rate

SELECT 
		CONCAT (
				ROUND(
							(
								(SELECT COUNT(*) FROM `opportunity table` WHERE Closed = "TRUE" AND Won = "FALSE")
								/
								((SELECT COUNT(Won) FROM `opportunity table` WHERE Won = "TRUE")
								 +
								(SELECT COUNT(*) FROM `opportunity table` WHERE Closed = "TRUE" AND Won = "FALSE"))
						*100)
				   ,2)
			,"%") AS Loss_Rate;

# 7) Expected Amount by Opportunity Type

SELECT `Opportunity Type`, CONCAT(CONCAT("$",ROUND(SUM(`Expected Amount`)/1000000,2))," M") AS Expected_Amount
FROM `opportunity table`
GROUP BY `Opportunity Type`;

# 8) Opportunities by Industry

SELECT Industry, COUNT(DISTINCT `Opportunity ID`) AS Opportunities
FROM `opportunity table`
GROUP BY Industry
ORDER BY Opportunities DESC;

# 9) Trend Analysis

# i) Expected Vs Forecast: Running total comparison of expected revenue and forecast over time.


SELECT 
		YEAR(`Close Date`) AS Year,
        MONTH(`Close Date`) AS Month,
        
        SUM(`Expected Amount`) AS Expected_Amount,
        SUM(Amount) AS Forecast_Amount,
        
        SUM(SUM(`Expected Amount`))
        OVER(ORDER BY YEAR(`Close Date`), MONTH(`Close Date`)) AS Monthly_Expected,
        
        SUM(SUM(Amount)) 
        OVER(ORDER BY YEAR(`Close Date`), MONTH(`Close Date`))AS Monthly_Forecast
        
FROM `opportunity table`
GROUP BY YEAR(`Close Date`), MONTH(`Close Date`)
ORDER BY YEAR(`Close Date`), MONTH(`Close Date`);

# ii) Active Vs Total Opportunities: Cumulative active vs. total opportunities trend.

SELECT
		YEAR(`Created Date`) AS Year,
        MONTH(`Created Date`) AS Month,
        
        SUM(CASE
				WHEN Closed = "FALSE" THEN 1 ELSE 0
			END) AS Active_Opportunities,
            
        COUNT(Closed) AS Total_Opportunities,
        
        SUM(SUM(CASE
				WHEN Closed = "FALSE" THEN 1 ELSE 0
			END))
        OVER(ORDER BY YEAR(`Created Date`), MONTH(`Created Date`)) AS Running_Active_Opportunities,
        
        SUM(COUNT(Closed)) 
        OVER(ORDER BY YEAR(`Created Date`), MONTH(`Created Date`)) AS Running_Total_Opportunities
        
FROM `opportunity table`
GROUP BY YEAR(`Created Date`), MONTH(`Created Date`)
ORDER BY YEAR(`Created Date`), MONTH(`Created Date`);

# iii) Closed Won Vs Total Opportunities: Track closed-won deals against total opportunities.

SELECT
		YEAR(`Close Date`) AS Year,
        MONTH(`Close Date`) AS Month,
        
        SUM(CASE
				WHEN Won = "TRUE" THEN 1 ELSE 0
			END) AS Closed_Won,
		COUNT(DISTINCT `Opportunity ID`) AS Total_Oportunities,
        
        SUM(SUM(CASE
				WHEN Won = "TRUE" THEN 1 ELSE 0
			END)) 
		OVER(ORDER BY YEAR(`Close Date`), MONTH(`Close Date`) ) AS Running_Closed_Won,
		
        SUM(COUNT(DISTINCT `Opportunity ID`)) 
        OVER(ORDER BY YEAR(`Close Date`), MONTH(`Close Date`)) AS Running_Total_Oportunities
        
FROM `opportunity table`
GROUP BY YEAR(`Close Date`), MONTH(`Close Date`)
ORDER BY YEAR(`Close Date`), MONTH(`Close Date`);
        
# iv) Closed Won Vs Total Closed: Analyze closed-won deals compared to all closed deals.

SELECT 
		YEAR(`Close Date`) AS Year,
        MONTH(`Close Date`) AS Month,
        
        SUM(CASE
				WHEN Won = "TRUE" THEN 1 ELSE 0
			END) AS Closed_Won,
            
		SUM(CASE
				WHEN Closed = "TRUE" THEN 1 ELSE 0
			END) AS Total_Closed,
            
		SUM(SUM(CASE
				WHEN Won = "TRUE" THEN 1 ELSE 0
			END))
		OVER(ORDER BY YEAR(`Close Date`), MONTH(`Close Date`)) AS Running_Closed_Won,
        
        SUM(SUM(CASE
				WHEN Closed = "TRUE" THEN 1 ELSE 0
			END))
		OVER(ORDER BY YEAR(`Close Date`), MONTH(`Close Date`)) AS Running_Total_Closed
        
FROM `opportunity table`
GROUP BY YEAR(`Close Date`), MONTH(`Close Date`)
ORDER BY YEAR(`Close Date`), MONTH(`Close Date`);

#################################################################################################################################################################################


























    


