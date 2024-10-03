# COSC 304 - Introduction to Database Systems<br>Lab 4: Building ER diagrams using an UML modeling tool

This lab designs ER diagrams in UML notation. The AutoER auto-grading software on PrairieLearn is used to design and mark your UML diagrams. It is also valuable to learn how to use commercial UML design software such as [Astah](http://astah.net/editions). <strong>Note: Astah no longer has a free community version. Request a student license or use the 30-day trial.</strong> <a href="https://drawio.com/">drawio</a> is an online drawing tool that can also be used but it does not have as good support for database modeling in UML.</p>

<h3>AutoER PrairieLearn link: https://plcanary.ok.ubc.ca/pl/course_instance/6/instructor/assessment/146/questions</h3>

<h2>Example #1</h2>

<p>Construct a database design in UML for a fish store where:</p>

<ol>
<li>A fish store maintains a number of aquaria (tanks), each with a number, name, volume and color.  </li>
<li>Each tank contains a number of fish, each with an id, name, color, and weight. </li>
<li>Each fish is of a particular species, which has a id, name, and preferred food.</li>
<li>Each individual fish has a number of events in its life, involving a date and a note relating to the event.</li>
</ol>

<h3>Answer: <a href="img/FishStore.asta">UML File</a>, <a href="img/FishStore.png">ER diagram image</a></h3>


<h2>Example #2</h2>

<p>Design and draw an ER diagram for a hotel company reservation system with the following requirements:</p>

<ol>
<li>There are many hotels in the chain. Each hotel has a name, a street address (which is made up of a street number, street name, city, state, and postal code), a home page URL (Web address), and a primary phone number. </li>

<li>Each hotel consists of a set of rooms arranged on various floors. Each room has an identifier which is unique within that hotel. Most of the time, rooms are numbered (e.g. 690), but they may be given a name (e.g. Presidential Suite) instead, so long as the name or number is unique within the hotel. Floors are numbered. For simplicity, assume that each room is on only one floor.</li>

<li>For each room, it's also necessary to keep track of how many beds it has, as well as whether smoking is allowed in the room. This information is used to help match guests to rooms with desired characteristics.</li>

<li>When a guest plans to stay at a hotel, he or she makes a room reservation at the desired hotel. Each reservation indicates information about the guest, the desired arrival and departure dates, as well as preferences that aid in selecting the right kind of room for that guest: whether the room should be smoking or non-smoking, the number of beds, and whether the room should be on a high floor or a low floor. These room preferences are optional, and are not included with every reservation; some guests are willing to take any available room, while some only care about some preferences but not others.</li>

<li>Also required with each reservation is information about a credit card that is used to secure the reservation; credit cards are indicated by a credit card number (which is a sequence of up to 16 digits) and an expiration date (a month and a year, such as "January 2024"). </li>

<li>At any given time, a guest may have multiple reservations. A reservation is for a single room.</li>

<li>For each guest, the database must store the guest's first, middle, and last names, street address, email address, and three phone numbers (home, work, cell). Email addresses and the phone numbers are optional, while the other information is required. Note that if multiple people stay in a room, we are only storing information about the one person who reserved the room.</li>

<li>A single invoice is generated for a reservation at the hotel, detailing the individual charges accrued by the guest. These charges include not only the regular room rate, but also applicable taxes, as well as charges at the hotel's restaurants, bars, spas, shops, and so on. An invoice is displayed either in printed or Web-based form as a sequence of line items, with each line item consisting of a description and an amount, such as "Hotel Cafe $29.75". Note that the database does not keep track of, say, the costs of items on the restaurant's menu or the cost of renting each room at various times throughout the year; it is assumed that another software system provides this information to our database, since our system only handles reservations and billing. </li>

<li>When a guest pays his or her bill or a portion of his or her bill a line item is added to the invoice that indicates how much was paid, and in what form the payment was made (e.g. "Visa $-500.00", in the case of a $500 payment made using a Visa credit card).</li>

<li>At the bottom of each invoice is a total balance, which is the sum of the amounts in each of the line items, including both charges and payments. An invoice is considered paid if the amount is $0.00. </li>
</ol>

<h3>Answer: <a href="img/HotelReservationSystem.asta">UML File</a>, <a href="img/HotelReservationSystem.png">ER diagram image</a></h3>


<h2><a href="assign/">Lab 4 Assignment</a></h2>
