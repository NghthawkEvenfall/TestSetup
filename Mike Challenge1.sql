/*
	Rules:
		The solution should be a single query that starts with a "SELECT", ";WITH" or "DELETE"
*/

/************************************************
			delete the duplicates
************************************************/

CREATE TABLE #DUPES(ID INT IDENTITY(1,1),NAME VARCHAR(100));

INSERT INTO #DUPES (NAME) SELECT 'GEORGE' 
INSERT INTO #DUPES (NAME) SELECT 'PAUL'   
INSERT INTO #DUPES (NAME) SELECT 'PAUL'  
INSERT INTO #DUPES (NAME) SELECT 'JOHN'  
INSERT INTO #DUPES (NAME) SELECT 'JOHN' 
INSERT INTO #DUPES (NAME) SELECT 'JOHN'  
INSERT INTO #DUPES (NAME) SELECT 'RINGO' 
INSERT INTO #DUPES (NAME) SELECT 'RINGO' 
INSERT INTO #DUPES (NAME) SELECT 'RINGO' 
INSERT INTO #DUPES (NAME) SELECT 'RINGO' 

--Enter your code here--

;WITH CTE AS(
   SELECT [ROW] = ROW_NUMBER()OVER(PARTITION BY [NAME] ORDER BY [NAME],
   [ID], 
   [NAME] )
   FROM #DUPES
)
DELETE FROM CTE WHERE [ROW] > 1;

SELECT * FROM #DUPES

IF OBJECT_ID('tempdb..#DUPES') IS NOT NULL DROP TABLE #DUPES
--Enter your code here--



-- Desired output (when selecting from table after dupes are deleted):
--ID					NAME
-------------------	--------------------
--1					George
--2					Paul
--4					John
--7					Ringo

GO
COMMIT TRANSACTION

