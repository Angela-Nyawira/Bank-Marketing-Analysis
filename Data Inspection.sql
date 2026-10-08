ALTER TABLE DATALAB_EXPORT_2026_09_19_08_38_24
RENAME TO BANK_MARKETING;

Desc BANK_MARKETING;

Select * from BANK_MARKETING fetch first 10 rows only;

Select count(*) as total_rows from BANK_MARKETING;

--Data Cleaning
select "index", count(*) as occurrences from BANK_MARKETING
group by "index" having count(*)>1;

--Missing Values

Select column_name, num_nulls from USER_TAB_COLUMNS where table_name='Bank_Marketing'
order by column_id;

--Checking for unusual values
SELECT
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age
FROM BANK_MARKETING;


