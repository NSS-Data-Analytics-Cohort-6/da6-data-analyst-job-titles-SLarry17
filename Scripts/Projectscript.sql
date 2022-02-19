--1.How many rows are in the data_analyst_jobs table? 1793 */
 SELECT COUNT (*)
 FROM data_analyst_jobs;
 
--2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?*/
SELECT*
FROM data_analyst_jobs
LIMIT 10

--3a.How many postings are in Tennessee?
SELECT COUNT (location) AS tn_jobs
FROM data_analyst_jobs
WHERE LOCATION = 'TN';
Answer: 21

--3b.How many are there in either Tennessee or Kentucky?
SELECT COUNT (location) AS tn_jobs
FROM data_analyst_jobs
WHERE location IN ('KY','TN');
Answer: 27

--4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;
ANSWER: 3

--5. How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT  (*) review_count
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
ANSWER 151

--6. Show the average star rating for companies in each state. The output should show the state as state and the average for the state as avg_rating. Which state shows the highest average rating?
SELECT location, round(avg(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT null
GROUP BY LOCATION
ORDER BY avg_rating DESC; 
ANSWER: Nebraska has the highest average rating, averaging around 4.20.

--Question 7. Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT DISTINCT title
FROM data_analyst_jobs;
WHERE company IS NOT null

--Question 8. How many unique job titles are there for California companies?
SELECT COUNT(Distinct title)
FROM data_analyst_jobs
WHERE location = 'CA'
ANSWER: 230

--Question 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more than 5000 reviews across all locations?
SELECT company, COUNT(company), AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating;
ANSWER: 40 companies

--Question 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company,
ROUND(avg(star_rating),2) as ave_rating
FROM data_analyst_jobs
WHERE review_count > 5000
AND company is not null
GROUP BY company
ORDER BY ave_rating DESC;
ANSWER: 4.20


--Question 11. Find all the job titles that contain the word 'Analyst'. How many different job titles are there?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE  TITLE iLike '%analyst%';
ANSWER: 774
		   

--Question 12. How many different job titles do not contain either the word 'Analyst' or the word 'Analytics'? What word do these positions have in common?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE LOWER(title) NOT LIKE '%analyst%' AND lower(title) NOT LIKE '%analyst%';
--Answer: 4, all contain word "Tableau"


--BONUS: You want to understand which jobs requiring SQL are hard to fill. FInd the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
SELECT COUNT(domain), 
domain
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY DOMAIN
ORDER BY count DESC;

Answer:
62 "Internet and Software"
61 "Banks and Financial Services"
57 "Consulting and Business Services"
52 "Health Care"






