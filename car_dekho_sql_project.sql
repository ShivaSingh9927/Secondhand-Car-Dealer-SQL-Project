create schema cars;
use cars;
/* read data*/
SELECT 
    *
FROM
    car_dekho;
/*Total number of cars in the data*/
select count(*) from car_dekho
/* the number of cars being available in 2023*/
select count(*) from car_dekho
where year=2023;
/* the number of cars being available in 2020,2021,2022*/
SELECT 
    COUNT(*)
FROM
    car_dekho
WHERE
    2020 <= car_dekho.year
        AND car_dekho.year <= 2022
GROUP BY year;
/* printing the total of all cars by year. I don't see all the details.*/
SELECT 
    year,COUNT(*)
FROM
    car_dekho
GROUP BY year
ORDER BY year;
    /* the number of cars with diesel engine in 2022*/
SELECT 
    COUNT(*)
FROM
    car_dekho
where year=2022 and fuel='Diesel';
/* number of petrol engine cars will be there in year 2020*/
SELECT 
    COUNT(*)
FROM
    car_dekho
where year=2020 and fuel='petrol';
/* printing the fuel cars(petrol,deisel, and CNG) comes by all year*/
SELECT 
    year,fuel,COUNT(*)
FROM
    car_dekho
where
fuel  in  ('petrol','deisel','CNG')  
group by year,fuel;
/* which year have morre than 100 cars?*/
SELECT 
    year,COUNT(*)
FROM
    car_dekho
    group by year
having
count(*)>100  ;
/* printing all the car count and details between 2015 to 2023*/
SELECT 
    COUNT(*)
FROM
    car_dekho
where year>=2015 and year<=2023
group by year;
SELECT 
    cd.*,
    counts.record_count
FROM
    car_dekho cd
JOIN (
    SELECT
        year,
        COUNT(*) AS record_count
    FROM
        car_dekho
    WHERE
        year >= 2015 AND year <= 2023
    GROUP BY
        year
) counts ON cd.year = counts.year;

