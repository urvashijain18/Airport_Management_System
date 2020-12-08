create database Airport_Management_System;
use Airport_Management_System;

create table city
(city_id varchar(25) NOT NULL,
city_name varchar(25) NOT NULL,
state varchar(25),
country varchar(25),
primary key(city_id));

create table airport 
(airport_id int NOT NULL identity(1,1),
airport_name varchar(50) NOT NULL,
city_id varchar(25),
primary key(airport_id),
foreign key(city_id) references city(city_id) on delete cascade);

create table airline
(airline_id varchar(3) NOT NULL,
airline_name varchar(25),
airline_code varchar(3),
primary key(airline_id));

create table flight 
(flight_code varchar(5) NOT NULL,
airline_id varchar(3),
flight_type varchar(15),
flight_source varchar(25),
flight_destination varchar(25),
departure_time time,
arrival_time time,
primary key(flight_code),
foreign key(airline_id) references airline(airline_id) on delete cascade);

create table passenger
(passenger_id int NOT NULL,
passport_number varchar(15) NOT NULL,
first_name varchar(25) NOT NULL,
middle_name varchar(25),
last_name varchar(25),
address_line1 varchar(25),
address_line2 varchar(25),
city varchar(25),
[state] varchar(25),
country varchar(20),
zipcode int,
contact_number varchar(10),
age int,
sex varchar(1),
primary key(passenger_id));

create table schedule 
(schedule_id int identity(1,1),
flight_code varchar(5),
flight_date DATE,
flight_status varchar(15),
primary key(schedule_id),
foreign key(flight_code) references flight(flight_code));

create table ticket
(ticket_number INT NOT NULL, 
booking_date DATE,
seat_number VARCHAR(5),
class varchar(15),
flag varchar(1),
passenger_id INT,
price int,
layovers int,
schedule_id int,
primary key(ticket_number),
foreign key(passenger_id) references passenger(passenger_id) on delete cascade,
foreign key(schedule_id) references schedule(schedule_id) on delete cascade);

create table employee
(employee_id int identity(1,1) NOT NULL,
SSN varchar(9) NOT NULL,
first_name varchar(25),
middle_name varchar(25),
last_name varchar(25),
addressline1 varchar(50),
addressline2 varchar(50),
city varchar(25),
[state] varchar(20),
country varchar(20),
zipcode int,
contact_number varchar(10),
age int,
sex varchar(1),
job_type varchar(25),
salary int,
airport_id int,
primary key(employee_id),
foreign key(airport_id) references airport(airport_id) on delete cascade);

create table layovers
(layover_id int not null,
ticket_number INT,
layover_location varchar(25),
layover_duration varchar(5),
primary key(ticket_number, layover_id),
foreign key(ticket_number) references ticket(ticket_number) on delete cascade);

create table cancellation
(cancellation_id int identity(1,1),
ticket_number int,
cancellation_date DATE NOT NULL,
surcharge INT,
PRIMARY KEY(cancellation_id),
foreign key(ticket_number) references ticket(ticket_number) on delete cascade);

create table airline_airport
(airline_id varchar(3) NOT NULL,
airport_id int NOT NULL,
primary key(airline_id, airport_id),
foreign key(airline_id) references airline(airline_id) on delete cascade,
foreign key(airport_id) references airport(airport_id) on delete cascade);

create table employee_passenger
(employee_id int NOT NULL,
passenger_id int NOT NULL,
primary key(employee_id, passenger_id),
foreign key(employee_id) references employee(employee_id) on delete cascade,
foreign key(passenger_id) references passenger(passenger_id) on delete cascade);

Alter table employee add constraint age_limit check (age<60);
Alter table employee add constraint contact_number check (len(contact_number)=10);
Alter table ticket add constraint ticket_length check (len(ticket_number)=10);