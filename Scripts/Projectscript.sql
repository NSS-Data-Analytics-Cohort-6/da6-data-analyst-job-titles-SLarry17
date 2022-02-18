 /* 1.How many rows are in the data_analyst_jobs table? 1793 */

 SELECT COUNT (*)
 FROM data_analyst_jobs;
 
/* 2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?*/
SELECT*
FROM data_analyst_jobs
LIMIT 10

/*3a.How many postings are in Tennessee?
SELECT COUNT (location) AS tn_jobs
FROM data_analyst_jobs
WHERE: LOCATION='TN'