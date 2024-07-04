SELECT *
FROM [Hotel Reservation Dataset]

SELECT SUM(no_of_weekend_nights)
FROM [Hotel Reservation Dataset]
GROUP BY (no_of_week_nights)

SELECT no_of_week_nights
FROM [Hotel Reservation Dataset]
WHERE no_of_week_nights = 15


--Total Number Of reservations In the dataset = 2146

SELECT SUM(no_of_weekend_nights)+ SUM(no_of_week_nights)TotalReservations
FROM [Hotel Reservation Dataset]

--Popular Meal Plan Among guests = Meal Plan 1

Select DISTINCT type_of_meal_plan, COUNT(type_of_meal_plan)
FROM [Hotel Reservation Dataset]
GROUP BY type_of_meal_plan


--Avg price per room for reservations involving children (to the nearest whole number) = 145

SELECT CEILING (AVG(avg_price_per_room))[Average Price/room w. Children]
FROM [Hotel Reservation Dataset]
WHERE no_of_children > 0

--Total Reservations made for the year 2017 = 351

SELECT SUM(no_of_weekend_nights)+ SUM(no_of_week_nights)TotalReservations
FROM [Hotel Reservation Dataset]
WHERE arrival_date LIKE '2018%'

--Most commonly booked room type = Room_Type_1 booked 534 times

SELECT DISTINCT room_type_reserved, COUNT(room_type_reserved)
FROM [Hotel Reservation Dataset]
GROUP BY room_type_reserved
ORDER BY 2 DESC

--Reservations on a weekend night = 596

SELECT SUM(no_of_weekend_nights)Weekend_reservations
FROM [Hotel Reservation Dataset]
WHERE no_of_weekend_nights > 0

--Highest and lowest lead time for reservation
--Highest :443
--Lowest : 0

SELECT MAX(lead_time)Highestleadtime
FROM [Hotel Reservation Dataset]

SELECT MIN(lead_time)Lowestleadtime
FROM [Hotel Reservation Dataset]

--Most common market segment type : Online (510 reservations)

Select TOP 1 market_segment_type, COUNT(market_segment_type)
FROM [Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY 1 DESC

--Reservations with confirmed status : Null

SELECT SUM(no_of_weekend_nights)+ SUM(no_of_week_nights)TotalReservations
FROM [Hotel Reservation Dataset]
WHERE booking_status LIKE 'confirmed%'

--Total no of adults n children = 1385

SELECT SUM(no_of_adults)+ SUM(no_of_children)TotalPersons
FROM [Hotel Reservation Dataset]

--Avereage no of weekend nights w children = 1

SELECT (AVG(no_of_weekend_nights))[Weekend Nights w. Children]
FROM [Hotel Reservation Dataset]
WHERE no_of_weekend_nights > 0
AND 
no_of_children > 0

--Reservations made in each month of the year 2018

SELECT DATENAME(month,arrival_date)AS Month,COUNT (DATENAME(month,arrival_date)) Month_Count
FROM [Hotel Reservation Dataset]
WHERE arrival_date LIKE '2018%'
GROUP BY (DATENAME(month,arrival_date))
ORDER BY Month_Count desc

--Reservations made in each month of the year 2017

SELECT DATENAME(month,arrival_date)AS Month,COUNT (DATENAME(month,arrival_date)) Month_Count
FROM [Hotel Reservation Dataset]
WHERE arrival_date LIKE '2017%'
GROUP BY (DATENAME(month,arrival_date))
ORDER BY Month_Count desc

--Average no of nights for each room type

SELECT room_type_reserved, (AVG(no_of_weekend_nights))+AVG(no_of_week_nights) [AVG no of Night]
FROM [Hotel Reservation Dataset]
WHERE no_of_weekend_nights > 0
GROUP BY room_type_reserved

----For reservations involving children, what is the most common room type, and what is the average 
--price for that room type?
 --Most common room type is Room Type 1

SELECT room_type_reserved, (COUNT(no_of_weekend_nights))+COUNT(no_of_week_nights)
FROM [Hotel Reservation Dataset] 
WHERE no_of_children > 0
GROUP BY room_type_reserved


SELECT room_type_reserved, ROUND((AVG(avg_price_per_room))+AVG(avg_price_per_room),2) [AVG PRICE]
FROM [Hotel Reservation Dataset] 
WHERE room_type_reserved =  'Room_Type 1'
AND 
no_of_children > 0
GROUP BY room_type_reserved

--Find the market segment type that generates the highest average price per room = ONLINE Segment

SELECT TOP 1 market_segment_type,ROUND (SUM(avg_price_per_room),2)
FROM [Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY 2 DESC






