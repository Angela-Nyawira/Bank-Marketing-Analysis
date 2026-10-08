--Subscription Rate
select count(*)as total_customers,
sum(case when y='yes' then 1 else 0 end) as subscribers,
round(sum(case when y='yes' then 1 else 0 end)*100 / count(*),2 ) as subscription_rate
from BANK_MARKETING;



-- Analysing the banks'customer demographics
select job, count(*) as customers from bank_marketing
group by job order by customers DESC;

select education, count(*) as customers from BANK_MARKETING
group by EDUCATION order by customers DESC;

select CASE
    when age<25 then 'Under 25'
    when age between 25 and 34 then '25-34'
    when age between 35 and 44 then '35-44'
    when age between 45 and 54 then '45-54'
    else '55+'
    END
as age_group,
count(*) as customers from BANK_MARKETING
group BY
    CASE
    when age<25 then 'Under 25'
    when age between 25 and 34 then '25-34'
    when age between 35 and 44 then '35-44'
    when age between 45 and 54 then '45-54'
    else '55+' 
    END
order by customers;

select marital, count(*)as customers from BANK_MARKETING
group by marital order by customers DESC;



--Analysing campaign effectiveness
--Do campaign and contact variables play a role in a customer's subscription?
--Also, all the customers in our dataset were contacted in the month of May on a Monday through the telephone.
select month ,DAY_OF_WEEK,CONTACT, count(*) as customers from BANK_MARKETING
group by  month ,DAY_OF_WEEK,CONTACT order by customers;

--Does call duration impact subscription rate?
SELECT y, COUNT(*) AS customers,
ROUND(AVG(duration), 2) AS avg_call_duration
FROM BANK_MARKETING
GROUP BY y;

--Does number of contacts associate with subscription?
select campaign, count(*) as customers,
sum(case when y='yes' then 1 else 0 end)as subscribers
from BANK_MARKETING group by campaign order by campaign desc;



--Analysing customer financial characteristics.
--Does having no default credit associate with subscription?
select "default", count(*)as customers,
sum(case when y='yes' then 1 else 0 end) as subscribers,
ROUND(sum(case when y='yes' then 1 else 0 end)*100.0/count(*),2) as subscription_rate
FROM BANK_MARKETING group by "default" order by subscribers DESC;

--Does having a housing loan or a personal loan deter someone from subscribing?
select housing, count(*) as customers,
sum(case when y='yes' then 1 else 0 end) as subscribers,
ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS subscription_rate
from BANK_MARKETING group by housing order by subscribers desc;

select loan, count(*) as customers,
sum(case when y='yes' then 1 else 0 end) as subscribers,
ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS subscription_rate
from bank_marketing group by loan order by subscribers DESC;



--Subscriber profile
--Which professions are most likely to subscribe to a term deposit?
select job, count(*) as customers,
sum(case when y='yes' then 1 else 0 end) as subscribers,
ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS subscription_rate
from BANK_MARKETING group by job order by subscribers desc;

--Characteristics of the subscribers who subscribed in the recent campaign
SELECT
    age,
    job,
    marital,
    education,
    "default",
    housing,
    loan,
    contact,
    campaign,
    previous,
    poutcome,
    y
FROM BANK_MARKETING
WHERE y = 'yes';



