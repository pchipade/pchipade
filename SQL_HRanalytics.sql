use excelr_proj;
desc hrdata;
select * from hrdata;

-- 1st KPI Average Attrition rate for all Departments

SELECT Department, CONCAT(FORMAT(AVG(AttritionCount) * 100, 2), '%') AS AttritionCount
from hrdata
GROUP BY Department;

-- 2nd KPI Average Hourly rate of Male Research Scientist

SELECT ROUND(AVG(hourlyrate) ,2) AS Average_Hourly_Rate
FROM hrdata
WHERE gender = 'Male' AND jobrole = 'Research Scientist';

-- 3rd KPI Attrition rate Vs Monthly income stats

Select sum(AttritionCount),SalarySlab from hrdata
Group by SalarySlab;
 
 
-- 4th KPI Average working years for each Department
 SELECT 
    Department, ROUND(AVG(TotalWorkingYears), 2) Avg_WorkingYears
FROM
    hrdata
GROUP BY department;

-- 5th KPI Job Role Vs Work life balance

SELECT DISTINCT
    JobRole, round(AVG(WorkLifeBalance), 2) as WorkLifeBalance
FROM
    hrdata
GROUP BY JobRole;

-- 6th KPI Attrition rate Vs Year since last promotion relation
select YearsSinceLastPromotion , count(AttritionCount) AttritionCount
from hrdata 
group by Yearssincelastpromotion order by AttritionCount desc;
 


