# COSC 304 - Introduction to Database Systems<br>Lab 5: Converting ER/UML diagrams into the relational model

## Example #1

Convert the fish store ER diagram into the relational model:

![FishStore](img/FishStore.png)

### Answer:

<pre>
Fish (<ins>id</ins>, name, color, weight, <i>tankNumber</i>, <i>speciesId</i>)  // tankNumber is a FK to Tank, speciesId is a FK to Species
Species (<ins>id</ins>, name, preferredFood)
Tank (<ins>number</ins>, name, volume, color)
Event (<i><ins>fishId</ins></i>, <ins>eventDate</ins>, note) // fishId is a FK to Fish
</pre>

## Example #2

Convert the ER diagram for hotel reservation system into the relational model:

![Hotel Reservations](img/HotelReservationSystem.png)

### Answer:

<pre>
Hotel (<ins>name</ins>, streetNumber, streetName, city, state, postalCode, webAddress, phoneNumber)
Floor (<i><ins>hotelName</ins></i>, <ins>number</ins>) // hotelName is a FK to Hotel
Room (<i><ins>hotelName</ins></i>, <i>floorNumber</i>, <ins>identifier</ins>, numBeds, isSmokingRoom) 
   // (hotelName, floorNumber) is a FK to Floor ; hotelName is a FK to Hotel
Customer (<ins>id</ins>, firstName, middleName, lastName, address, city, state, country, postalCode, homePhoneNumber, workPhoneNumber, cellPhoneNumber, emailAddress)
Reservation (<i><ins>hotelName</ins></i>, <i><ins>customerId</ins></i>, <ins>arrivalDate</ins>, departDate, smokingRoom, numBeds, highOrLowFloor, creditCardType, creditCardNum, creditCardExpiry, <i>roomIdentifier</i>)
   // hotelName is a FK to Hotel ; customerId is a FK to Customer ; (hotelName, roomIdentifier) is a FK to Room
Invoice (<ins>id</ins>, <i>hotelName</i>, <i>customerId</i>, <i>arrivalDate</i>, openDate, closeDate, totalBalance) 
   // (hotelName,customerId,arrivalDate) is FK to Reservation
InvoiceCharge (<i><ins>invoiceId</ins></i>, <ins>transactionId</ins>, chargeType, description, amount) // InvoiceId is a FK to Invoice
</pre>

## [Lab 5 Assignment](assign/)
