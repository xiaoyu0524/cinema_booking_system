-- Show the movies that are longer than 2 hours
select * from movies
where length_min > 120;

-- Which movie had the most screenings in October 2017
select s.movie_id, m.name, count(s.id) as count from screenings s
join movies m on m.id=s.movie_id
group by movie_id
order by count desc
limit 1;

-- How many bookings did the movie 'Jigsaw' have in October 2017
select count(*) from bookings
where screening_id in 
(select id from screenings
where movie_id=5);

-- Which 5 customers made the most bookings in October 2017
select c.first_name, c.last_name, count(b.id) as count from bookings b
join customers c on c.id=b.customer_id
group by c.first_name, c.last_name
order by count desc
limit 5;

-- Which movie was shown in the Chaplin room most often in October 2017
select m.name as movie_name, count(r.name) as count from screenings s
join movies m on m.id=s.movie_id
join rooms r on r.id=s.room_id
where r.name = 'Chaplin'
group by m.name
order by count desc
limit 1;

-- How many of the customers made booking in October 2017
select count(id) from
(select customer_id as id, count(customer_id) from bookings
group by customer_id) c;