use ola;
select * from bookings;

#1. retrieve all successful bookings:
create view successful_bookings as
select * from bookings 
where booking_status = 'success';
select * from successful_bookings;

#2. find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance)
as avg_distance from bookings
group by vehicle_type;
select * from ride_distance_for_each_vehicle;

#3.get the total number of canceled rides by customers:
create view  canceled_rides_by_customers as
select count(*) from bookings
where booking_status = 'canceled by customer';
select * from canceled_rides_by_customers;

#4.list the top 5 customers who booked the highest number of rides:
create view top_5customers as
select customer_id, count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5;
select * from top_5customers;

#5.get the number of rides canceled by drivers due to personal and car related issues:
create view rides_canceled_by_drivers_due_to_personal_and_car_related_issues as
select count(*) from bookings
where canceled_rides_by_driver= 'personal & car related issue';
select * from rides_canceled_by_drivers_due_to_personal_and_car_related_issues;

#6. find the maximum and minimum driver ratings for prime sedan bookings:
create view max_min_driver_rating as
select max(driver_ratings) as max_rating,
min(driver_ratings)as min_rating
from bookings where vehicle_type='prime sedan';
select * from max_min_driver_rating;

#7. retrieve all rides where payment was made using upi:
create view upi_payment as
select * from bookings
where payment_method = 'upi';
select * from upi_payment;

#8.find the average customer rating per vehicle type:
create view avg_customer_rating as
select vehicle_type, avg(customer_rating) as customer_rating
from bookings
group by vehicle_type;
select * from avg_customer_rating;

#9. calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(booking_value) as total_successful_value
from bookings
where booking_status='success';
select * from total_successful_ride_value;

#10.list all incomplete rides along with the reason:
create view incomplete_rides_reason as
select booking_id,incomplete_rides_reason
from bookings
where incomplete_rides = 'yes';
select * from incomplete_rides_reason;