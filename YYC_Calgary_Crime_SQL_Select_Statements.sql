
-- 1) SQL Select statement example 
select *
from dbo.YYC_Calgary_Crime

-- 2) SQL Select Distinct statement example 
select distinct [Community Name]
from dbo.YYC_Calgary_Crime

-- 3) SQL Select Where statement example 
select distinct [Community Name]
from dbo.YYC_Calgary_Crime
where [Sector] = 'CENTRE'

-- 4.1) SQL Select And statement example 
select [Sector], [Community Name], [Crime Count], [Month], [YEAR]
from dbo.YYC_Calgary_Crime
where [Category] = 'Physical Disorder' and [Crime Count] > 50

-- 4.2) SQL Select Or statement example 
select distinct [Sector], [Community Name]
from dbo.YYC_Calgary_Crime
where [Sector] = 'NORTHWEST' or [Sector] = 'NORTHEAST'

-- 4.3) SQL Select Not statement example 
select distinct [Sector], [Community Name]
from dbo.YYC_Calgary_Crime
where not [Sector] = 'CENTRE'

-- 5) SQL Select Order By statement example 
select distinct [Community Name]
from dbo.YYC_Calgary_Crime
where [Sector] = 'CENTRE'
order by [Community Name]

-- 6) SQL Null statement example 
select [BusinessEntityID],[AccountNumber],[Name],[CreditRating],
       [PreferredVendorStatus],[ActiveFlag],[PurchasingWebServiceURL]
from [AdventureWorks2019].[Purchasing].[Vendor]
where [PurchasingWebServiceURL] is not null

-- 7) SQL TOP statement example 
select top (1000) *
from dbo.YYC_Calgary_Crime
 x
-- 8.1) SQL Count statement example 
select count(*)
from dbo.YYC_Calgary_Crime

-- 8.2) SQL Avg statement example 
select avg([Crime Count]) "Average Number of Non-Domestic Assaults in Edgemont"
from dbo.YYC_Calgary_Crime
where [Year] = 2017 and [Community Name] = 'Edgemont' and [Category] = 'Assault (Non-domestic)'

-- 8.3) SQL Sum statement example 
select sum([Crime Count]) "Total Number of Crimes in Calgary in 2017"
from dbo.YYC_Calgary_Crime
where [Year] = 2017

-- 9) SQL Like and Wildcards statement example
select * 
from dbo.YYC_Calgary_Crime
where [Year] = 2017 and [Community Name] = 'Edgemont' and [Category] like '% Disorder' 

-- 10) SQL In statement example
select count(*) 
from dbo.YYC_Calgary_Crime
where [Year] in ( 2012, 2013, 2014 ) and 
      [Community Name] = 'Edgemont' and 
	  [Category] like '% Disorder' 

-- 11) SQL Between statement example
select count(*) 
from dbo.YYC_Calgary_Crime
where [Year] Between 2012 and 2014 and 
      [Community Name] = 'Edgemont' and 
	  [Category] like '% Disorder' 

-- 12) SQL Group By Order By statement example 
select [Community Name], [Group Category], [Category]
from dbo.YYC_Calgary_Crime
where [Community Name] = 'Edgemont' and [Year] = 2016
group by [Community Name], [Group Category], [Category]
order by [Community Name], [Group Category], [Category]

-- 13) SQL Min and Max statement example 
select [Community Name], [Group Category], [Category], 
       MAX([Crime Count]) "Maximum Monthly Crime Count", 
	   MIN([Crime Count]) "Minimum Monthly Crime Count"
from dbo.YYC_Calgary_Crime
where [Community Name] = 'Edgemont' and [Year] = 2016
group by [Community Name], [Group Category], [Category]
order by [Community Name], [Group Category], [Category]

/****** Script for SelectTopNRows command from SSMS  ******/
/* Top 10 communities by crime count with month and year*/

select  top 10 [Community Name],[Crime Count],[MONTH],[YEAR] from dbo.YYC_Calgary_Crime order by [Crime Count] desc

select * from dbo.YYC_Calgary_Crime
/*  Communities with Crime Count*/
SELECT distinct [Community Name], count([Crime Count]) "Total Crime"
 FROM [YYC_Calgary_Crime]
 group by [Community Name]
 order by "Total Crime" desc --Crime in Beltline SELECT [Community Name], sum([Crime Count]) "Total Crime"
 FROM [YYC_Calgary_Crime] where [Community Name]= 'Beltline'
 group by [Community Name]
 order by "Total Crime" desc --Community Crime by resident select distinct [community name], ([Resident Count]/[Crime Count]) "Ratio" from dbo.YYC_Calgary_Crime --What is the crime rate per capita for communities in Calgary with a resident count greater than 5000?" select distinct [community name], sum([crime count]) "Crime Coun", sum([resident count]) "Resident Coun",("Crime Count1"/"Resident Count1")*100 "Percentage" from [YYC_Calgary_Crime]
 where [resident count] > 5000
 group by [community name],"Crime Coun","Resident Coun"
 order by [community name] --What are the top 10 communities in YYC (Calgary) with the highest percentage of crime, where the resident count is greater than 5000? Select distinct top 10 [Community name], SUM([crime count])/sum([resident count])*100 "Percentage of Crime"
from dbo.YYC_Calgary_Crime
where [Resident Count] > 5000
group by [Community Name]
order by "Percentage of Crime" desc

--What is the total number of crimes that occurred each year in the NORTHEAST sector of YYC Calgary, and how do the crime rates compare across different years?"

select [Year],SUM([Crime Count]) "Total Crime" from YYC_Calgary_Crime where [Sector]='NORTHEAST' group by [YEAR] order by "Total Crime" desc
