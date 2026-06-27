CREATE DATABASE ola;
USE ola;

-- retrieve all success bookings
CREATE VIEW Successful_Bookings AS
SELECT *
FROM bookings
WHERE booking_status = 'Success';

-- view check
SELECT *
FROM Successful_Bookings;


-- Find avg ride distance for each vehicle type
Create View ride_Distance_for_each_vehicle as
Select Vehicle_Type, AVG(Ride_Distance)
as avg_distance From bookings
GROUP BY Vehicle_Type;

-- view check
select * from ride_Distance_for_each_vehicle;


-- total number of canceled rides by customer
Create View  canceled_ride_by_customer As
Select count(*) From bookings
where Booking_Status = 'Canceled by Customer';

-- List the top 5 customer who booked the highest number of rides
Create View top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5; 


-- Get the number of rides canceled by drivers due to personal and car-related issues
Create View Rides_Canceled_by_Drivers_P_C_Issues as
select count(*) from bookings 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';


-- find  the maximum and minimum driver rating for Prime Sedan Bookings
Create View Max_Min_Driver_Rating as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
From bookings where Vehicle_Type = 'Prime Sedan';


-- Retrive all rides where payment was made using upi
Create View UPI_Payment as
select * from bookings
where Payment_Method = 'UPI';


-- Find Average customer rating per vehicle type
create view AVG_Cust_Rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
From bookings
group by Vehicle_Type;

-- calculate the total bookings value of rides completed successfuly
create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_value
from bookings 
where Booking_Status = 'Success';


-- List all incomplete rides along with the reason
Create View complete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
From bookings
where Incomplete_Rides = 'Yes';


