//FLIGHT MANAGEMENT SYSTEM DBATABASE TABLE CREATION
//.................................................


//FLIGHT TABLE
//............

 create table flight(
 id int not null primary key auto_increment,
 flightno int not null unique,
 flightName varchar(100) not null unique,
 flightDescription varchar(200) not null,
 flightCapacity int not null check(flightCapacity >= 0)

 );


//..........................................................
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



//PASSENGER TABLE
//...............

create table passenger(
id int not null primary key auto_increment,
pName varchar(100) not null ,
userName varchar(100) not null unique,
email varchar(100) not null unique,
pswd varchar(50) not null,
mobile double not null unique,
address varchar(200) not null,
dob date not null


);


//...................................................
//'''''''''''''''''''''''''''''''''''''''''''''''''''



//FLIGHT-SCHEDULE TABLE 
//.....................

create table flightSchedule(
id int not null primary key auto_increment,
flightFrom varchar(150) not null,
flightTo varchar(150) not null,
flightDate date not null,
flightTime time not null,
cost int not null check(cost >= 0),
flightno int not null,

constraint FK_flightSchedule_flightno foreign key
(flightno) references flight(flightno) on delete cascade
);


//...........................................................
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


//BOOK TICKET TABLE
//..................

create table bookTicket(
ticketNo int not null unique primary key,
bookingDate date not null,
dateOfTravel date not null,
flightno int not null,
flightFrom varchar(150) not null,
flightTo varchar(150) not null,
boardingTime time not null,
flightSeat int not null unique,
passengerId int not null,

constraint FK_bookTicket_flightno foreign key
(flightno) references flight(flightno),

constraint FK_bookTicket_passengerId foreign key
(passengerId) references passenger(id)

);


//......................................................
//''''''''''''''''''''''''''''''''''''''''''''''''''''''
