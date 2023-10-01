show databases;
create database cinema_booking_system;
use cinema_booking_system;

create table movies(
	id int primary key auto_increment,
    name varchar(45) not null unique,
    length_min int not null
);

create table customers(
	id int primary key auto_increment,
    first_name varchar(45),
    last_name varchar(45) not null,
    email varchar(45) not null unique
);

create table rooms(
	id int primary key auto_increment,
    name varchar(45) not null,
    no_seats int not null
);

create table screenings(
	id int primary key auto_increment,
    movie_id int not null,
    room_id int not null,
    start_time datetime not null,
    foreign key (movie_id) references movies(id),
    foreign key (room_id) references rooms(id)
);

create table seats(
	id int primary key auto_increment,
    seat_row char(1) not null,
    seat_num int not null,
    room_id int not null,
    foreign key (room_id) references rooms(id)
);

create table bookings(
	id int primary key auto_increment,
    screening_id int not null,
    customer_id int not null,
    foreign key (screening_id) references screenings(id),
	foreign key (customer_id) references customers(id)
);

create table reserved_seats(
	id int primary key auto_increment,
    booking_id int not null,
    seat_id int not null,
    foreign key (booking_id) references bookings(id),
    foreign key (seat_id) references seats(id)
);

show tables;
describe movies;
describe customers;
describe rooms;
describe screenings;
describe seats;
describe bookings;
describe reserved_seat;