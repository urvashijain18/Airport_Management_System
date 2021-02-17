# Airport_Management_System

# Objective
As Air Services are becoming an integral part of people’s travel, the requirement of data management has also increased. Our focus will be to handle airport data which will include airlines, flights, passenger details, employee details, etc. This system will provide a broad overview of underlying operational factors that influence airport management. The database system will have the data of all commercial airports. The system will be designed only for international flights. All International airlines operating through various countries across the world have their offices located in all major cities and airports they cover. Hence, an airport may have many airline offices. An Airline may have several flights. Each flight will have its departure and arrival schedule, source and destination, fare and capacity. Capacity defines the number of passengers a flight can accommodate. The system will have all the details of the passengers like first name, last name, date of birth, date of travel, etc. The system will also contain information about all the airport employees.\
• The system will have information about the city in which the airport is situated.\
• The airport will have multiple airlines associated with it.\
• Each airline may have multiple flights associated with it.\
• Each flight serves passengers and will have source, destination, time, duration, capacity, fare as attributes.\
• Flights can be non-stop or connecting flights.\
• Passengers can book flights and have their first name, last name, date of birth, identity proof, etc. as attributes.\
• A passenger can book one or multiple tickets.\
• Each airport also has some employees which belong to different departments, helping passengers in booking a flight ticket, or answering passenger queries.\ 
* Assumption: A city has at most one international airport

# ERD Diagram
![ERD Diagram](https://github.com/urvashijain18/Airport_Management_System/blob/master/ERD.png?raw=true)

# Tables
City\
Airport\
Airline\
Airport_Airline\
Flight\
Passenger\
Employee\
Employee_Passenger\
Schedule\
Ticket\
Layovers\
Cancellation

# Views
Bookings_View : shows total number of bookings from/to a particular location.\
Delayed_Flights_View : shows all the flights with current status is delayed.\
Flight_Today_View : shows list of all flights available on current date.\
Nonstop_Flights_View : shows all non-stop flights irrespective of location.\
Passport_Number_View : Passport number is encrypted in database. So, this views is crested to facilitate users (Admin role) with decrypting passport numbers.\
SSN_View : Similar to Passport number, this view is to provide decrypted values of SSN to Admins.

# Triggers
AirlineCancelledFlight : this is triggered when the flight is cancelled by Airline itself.\
MainTrigger : triggers when passenger cancels a ticket.

# Stored Procedures
Employee_Count_By_Job : Stored procedue to display number of Employees in each job type.\
StoredProcedure (Economy_Passengers_List_By_Source) : Stored procedue to display passengers travelling in particular class from particular source.\
StoredProcedure2 (Flight_Status_Count) : Stored procedue to display number of flights under particular status for each airline.\
StoredProcedure3 (Number_Of_Flights) : Stored procedue to display flight from a particular source.
