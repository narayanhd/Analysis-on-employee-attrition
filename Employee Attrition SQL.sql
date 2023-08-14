select *
from [Employee Attrition]

select count(*)
from Employees Attrition

select EmployeeNumber
from [Employee Attrition]
where EmployeeNumber is not null

select EmployeeNumber
from [Employee Attrition]
where EmployeeNumber is null

 --checking for duplicates
select count(distinct EmployeeNumber)
from [Employee Attrition]

select Over18
from [Employee Attrition]
where Over18 = 'Y'

select EmployeeCount
from [Employee Attrition]
where EmployeeCount=1

select StandardHours
from [Employee Attrition]
where StandardHours=80

alter table [Employee Attrition]
drop column Over18,EmployeeCount,StandardHours

select *
from [Employee Attrition]

select*
from [Employee Attrition]

-- Distribution of Employees by Gender
select Gender, COUNT(Gender)
from [Employee Attrition]
where Gender='Female' or Gender='Male'
group by Gender

-- Distribution of Employees by Department

select Department,count(Department)
from [Employee Attrition]
group by Department

-- Distribution of Employees by Department and Gender

select Department,Gender, Count(*) as GenderCount
from [Employee Attrition]
where Gender='Female' or Gender='Male'
group by Department, Gender
Order by Gender

-- Money related average, per entire company

select round(avg(DailyRate),2) as DailyRate,
round(avg(HourlyRate),2) as HourlyRate,
round(avg(MonthlyRate),2) as MonthyRate,
round(avg(MonthlyIncome),2) as MonthlyIncome
from [Employee Attrition]

-- Distribution of Employee Education accross different departments

select Department, Education,count(*) as TotalEmployees
from [Employee Attrition]
group by Department, Education
order by Department, Education desc

--Distribution of Employee performance ratings accross different Departments

select Department,
PerformanceRating,count(*) as NumberOfEmployees
from [Employee Attrition]
group by Department,PerformanceRating
order by Department, NumberOfEmployees desc

--average monthly income and rate for each JobRole

select JobRole,
round(avg(MonthlyRate),2) as avg_monthly_rate,
round(avg(MonthlyIncome),2) as avg_monthly_income
from [Employee Attrition]
group by JobRole
order by avg_monthly_income desc

-- Average Monthly Rate and Income for each job in each department

select Department,JobRole,
		round(avg(MonthlyRate),2) as avg_monthly_rate,
		round(avg(MonthlyIncome),2) as avg_monthly_income
from [Employee Attrition]
group by Department,
JobRole
order by Department, avg_monthly_income Desc

-- Distribution of Employees on Departments & JobRole by MonthlyRate

select Department,
JobRole,
count(*) as TotalEmployees,
min(MonthlyRate) as MinMonthlyRate,
max(MonthlyRate) as MaxMonthlyRate,
avg(MonthlyRate) as AvgMonthlyRate
from [Employee Attrition]
group by Department, JobRole

-- distribution of Employees on Departments & JobRole by MonthlyIncome

select Department,
JobRole,
count(*) as TotalEmployees,
min(MonthlyRate) as MinMonthlyIncome,
max(MonthlyRate) as MaxMonthlyIncome,
avg(MonthlyRate) as AvgMonthlyIncome
from [Employee Attrition]
group by Department, JobRole

--Environment Satisfaction distribution to the employees

select EnvironmentSatisfaction,
count(*) as TotalEmployees
from [Employee Attrition]
group by EnvironmentSatisfaction
order by EnvironmentSatisfaction  

--Job Satisfaction among Employees

select JobSatisfaction,count(*) as Number_of_Employees
from [Employee Attrition]
group by JobSatisfaction
order by JobSatisfaction


--What is the maximum and minmum MonthlyIncome per Department who received less then 13% SalaryHike

select Department,
max(MonthlyIncome) as MaxIncomeMonthly,
min(MonthlyIncome) as MinIncomeMonthly
from [Employee Attrition]
where PercentSalaryHike<13
group by Department
order by max(MonthlyIncome) desc

--Number of Female and Male employees, mention Marital status and have not received promotion in the last 2 years

select Gender, count(*) as Employees, MaritalStatus, Department
from [Employee Attrition]
where YearsSinceLastPromotion =2
group by Gender, MaritalStatus,Department
order by Department

-- List of employees that have max performance rating but no promotion more than 4 years

select *
from [Employee Attrition]
where PerformanceRating=(select max(PerformanceRating) from [Employee Attrition])
and YearsSinceLastPromotion>=4

select *
from [Employee Attrition]
where YearsSinceLastPromotion>=10


--Employees working overtime, who received min salary hike and are more than 5 years in company...and left Company

select *
from [Employee Attrition]
where OverTime=1
and PercentSalaryHike= (
	select min(PercentSalaryHike) 
	from [Employee Attrition])
and YearsAtCompany>5
and Attrition = 'Yes'

--List of employees that received max Salary hike and has less then 5 years in company

select *
from [Employee Attrition]
where OverTime=1
and PercentSalaryHike= (
	select max(PercentSalaryHike) 
	from [Employee Attrition])
and YearsAtCompany<5

-- similary, No OverTime
select *
from [Employee Attrition]
where OverTime=0
and PercentSalaryHike= (
	select max(PercentSalaryHike) 
	from [Employee Attrition])
and YearsAtCompany<5


select count(EmployeeNumber) as Employees,Gender,Department,BusinessTravel
from [Employee Attrition]
group by Gender,Department,BusinessTravel

--Employee details

select Age,BusinessTravel,Department,DistanceFromHome,Education,EducationField,EmployeeNumber,Gender,JobRole,MaritalStatus
from [Employee Attrition]

--Money Dim

select JobRole,Department,EmployeeNumber,EducationField,MonthlyIncome,MonthlyRate,StockOptionLevel,PercentSalaryHike,TotalWorkingYears,NumCompaniesWorked
from [Employee Attrition]

--Dim Satisfaction in Company

select EmployeeNumber,WorkLifeBalance,YearsSinceLastPromotion,YearsAtCompany,YearsInCurrentRole,YearsWithCurrManager,RelationshipSatisfaction,JobSatisfaction,EnvironmentSatisfaction,JobInvolvement,PerformanceRating
from [Employee Attrition]

--Employees with Doctorate degree with age less than 40

select*
from [Employee Attrition]
where age<40 and Education='5'