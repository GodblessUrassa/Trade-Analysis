SELECT *
FROM [sql tutorial]..Africa_Value$

SELECT *
FROM [sql tutorial]..Africa_Quantity$

SELECT *
FROM [sql tutorial]..Global_Quantity$


---data cleaning---
ALTER TABLE [sql tutorial]..Africa_Quantity$
DROP COLUMN s_2000,s_2001,s_2002,s_2003,s_2004,s_2005,s_2006,s_2007,s_2008,s_2009,s_2010,s_2011,s_2012,s_2013,s_2014,s_2015

SELECT *
FROM [sql tutorial]..Africa_Quantity$
WHERE	2000 is null and 2001 is null and 2002 is null and 2003 is null and 2004 is null and 2005 is null 
		and 2006 is null and 2007 is null and 2008 is null and 2009 is null and 2010 is null and 2011 is null 
		and 2012 is null and 2013 is null and 2014 is null and 2015 is null

ALTER TABLE [sql tutorial]..Africa_Value$
DROP COLUMN s_2000,s_2001,s_2002,s_2003,s_2004,s_2005,s_2006,s_2007,s_2008,s_2009,s_2010,s_2011,s_2012,s_2013,s_2014,s_2015

SELECT *
FROM [sql tutorial]..Africa_Value$
WHERE	2000 is null and 2001 is null and 2002 is null and 2003 is null and 2004 is null and 2005 is null 
		and 2006 is null and 2007 is null and 2008 is null and 2009 is null and 2010 is null and 2011 is null 
		and 2012 is null and 2013 is null and 2014 is null and 2015 is null

ALTER TABLE [sql tutorial]..Global_Quantity$
DROP COLUMN s_2000,s_2001,s_2002,s_2003,s_2004,s_2005,s_2006,s_2007,s_2008,s_2009,s_2010,s_2011,s_2012,s_2013,s_2014,s_2015


---largest region importers in the world in 2015---
SELECT	[Land Area], SUM([2005]) AS year_2005, SUM([2015]) AS year_2015
FROM	[sql tutorial]..Global_Quantity$
WHERE	[Trade flow] = 'import'
GROUP BY	[Land Area]
ORDER BY	year_2005 DESC


---largest fish exporters in africa 2015---
SELECT TOP (5) [Land Area],[Trade flow],Commodity, [2015] 
FROM [sql tutorial]..Africa_Quantity$ 
WHERE [Trade flow] = 'export' AND Commodity = 'fish'
ORDER BY [2015] DESC

---largest crustaceans exporters in Africa 2015
SELECT TOP (5) [Land Area],[Trade flow],Commodity, [2015] 
FROM [sql tutorial]..Africa_Quantity$ 
WHERE [Trade flow] = 'export' AND Commodity = 'crustaceans'
ORDER BY [2015] DESC


---largest fish importers in africa 2015---
SELECT TOP (5) [Land Area], [Trade flow], Commodity, [2015]
FROM [sql tutorial]..Africa_Quantity$
WHERE [Trade flow] = 'import' AND Commodity = 'fish'
ORDER BY [2015] DESC

---largest crustaceans importers in africa 2015---
SELECT TOP (5) [Land Area], [Trade flow], Commodity, [2015]
FROM [sql tutorial]..Africa_Quantity$
WHERE [Trade flow] = 'import' AND Commodity = 'crustaceans'
ORDER BY [2015] DESC

---total value of imported commodities in 2015
SELECT [Land Area],[Trade flow],sum([2015] * 1000) as total_USD_imported
FROM [sql tutorial]..Africa_Value$ 
WHERE [Trade flow] = 'import' AND [Land Area] = 'Tanzania, United Rep. of'
GROUP BY [Land Area],[Trade flow]

---total quantity of imported commodities in 2015
SELECT [Land Area],[Trade flow],sum([2015] * 1000) as total_kilograms_imported
FROM [sql tutorial]..Africa_Quantity$ 
WHERE [Trade flow] = 'import' AND [Land Area] = 'Tanzania, United Rep. of'
GROUP BY [Land Area],[Trade flow]

---price per kg of imported commodities in 2015
CREATE TABLE #price_kgm (country nvarchar(255), year nvarchar(255), total_USD_imported float,total_kilograms_imported float)
INSERT INTO #price_kgm VALUES ('Tanzania, United Rep. of','2015',17277000,19611000)

SELECT country,year,(total_USD_imported/total_kilograms_imported) AS USD_per_Kg
FROM #price_kgm

---total value of exported commodities in 2015---
SELECT [Land Area],[Trade flow],SUM([2015] * 1000) AS total_USD_exported
FROM [sql tutorial]..Africa_Value$ 
WHERE [Trade flow] = 'export' AND [Land Area] = 'Tanzania, United Rep. of'
GROUP BY [Land Area],[Trade flow]


---total value of exported commodities in 2015
SELECT [Land Area],[Trade flow],sum([2015] * 1000) AS total_kilograms_exported
FROM [sql tutorial]..Africa_Quantity$ 
WHERE [Trade flow] = 'export' AND [Land Area] = 'Tanzania, United Rep. of'
GROUP BY [Land Area],[Trade flow]

---price per kg of exported commodities
CREATE TABLE #price_kg (country nvarchar(255), year nvarchar(255), total_USD_exported float,total_kilograms_exported float)

INSERT INTO #price_kg VALUES ('Tanzania, United Rep. of','2015',155843000,34485000)

SELECT country,year,(total_USD_exported/total_kilograms_exported) AS USD_per_Kg
FROM #price_kg


---trade trends from 2005 to 2015---

SELECT [Land Area], [Trade flow],SUM([2005]) AS y2005,SUM([2006]) AS y2006, SUM([2007]) AS y2007, 
SUM([2008]) AS y2008,SUM([2009]) AS y2009, SUM([2010]) AS y2010,SUM([2011]) AS y2011,SUM([2012]) AS y2012,
SUM([2013]) AS y2013,SUM([2014]) AS y2014,SUM([2015]) AS y2015
FROM [sql tutorial]..Africa_Quantity$
WHERE [Land Area] = 'Tanzania, United Rep. of' 
GROUP BY [Land Area], [Trade flow]

CREATE TABLE #trend (year nvarchar(255),export float, import float) 
INSERT INTO #trend values 
('2005','46900','494'), 
('2006','38477','2930'),
('2007','48620','6853'),
('2008','55036','6821'),
('2009','39959','6247'),
('2010','40250', '5916'),
('2011','40146','3890'),
('2012','44458','6371'),
('2013','34575','9274'),
('2014','39015','19489'),
('2015','34485','19611')
 
select *
from #trend
								   
										   
										  
										   
										   
										   
										   
                                   ,
		
						  

