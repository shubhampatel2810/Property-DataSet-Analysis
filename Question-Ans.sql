USE [Property]


--A.  Write a query to find which skilled worker carried out the highest 
--    number of satisfactory repairs last month?

	SELECT  w.* FROM (
		SELECT MAX(satisfactoryrepairs) AS WorkerRating,w.WorkerID 
		FROM workers w inner join PropertyRepairs ps ON w.WorkerID = ps.WorkerID
		WHERE  [Date] >= DATEADD(month, DATEDIFF(month, 0, GETDATE()) - 1, 0) 
		AND [Date] < DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)  
		GROUP BY w.WorkerID HAVING max(satisfactoryrepairs) =10
	) AS x inner join Workers w ON x.WorkerID = w.WorkerID
 


--B   Write a query to find how many properties were purchased by 
--    LSBU during the period Oct 2022 – Dec 2023?

	SELECT COUNT(*)
	FROM [dbo].[Properties]
	WHERE [PurchaseDate] >= '2022-10-01' AND [PurchaseDate] < '2023-12-01';

	--or

	SELECT *
	FROM [dbo].[Properties]
	WHERE [PurchaseDate] >= '2022-10-01' AND [PurchaseDate] < '2023-12-01';




--C  Write a query to find out how many skilled workers are available
--   (not currently working on any LSBU renovation) today?

	SELECT COUNT(*) AS AvailableWorkers
	FROM Workers w
	WHERE NOT EXISTS (
		SELECT 1
		FROM PropertyWorkers pw
		INNER JOIN PropertyRepairs pr ON pw.PropertyRepairID = pr.PropertyRepairID
		WHERE pw.WorkerID = w.WorkerID
		AND CAST(GETDATE() AS DATE) BETWEEN pr.Date AND pr.Date 
	)
	AND w.IsWorking = 0


--D     Write a stored procedure to list appropriate property, buyer and 
--		contract details for all renovated property sales that completed 
--		successfully in the last month?

EXEC [dbo].[GetCompletedSalesLastMonth]

--E     Write a stored procedure to provide a monthly report of all 
--		properties that need RE- INSPECTION for the LSBU surveyors. 
--		The report should show itemised costs of each repair within a 
--      property and the total value of the property

EXEC [dbo].[MonthlyReinspectionReport]
