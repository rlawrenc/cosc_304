# COSC 304 - Introduction to Database Systems<br>Lab 4: Building ER diagrams using an UML modeling tool

This lab designs ER diagrams in UML notation using [astah](http://astah.net/editions). <strong>Note: Astah no longer has a free community version. Request a student license or use the 30-day trial.</strong> <a href="https://diagrams.net/">diagrams.net</a> is an online drawing tool that can also be used but it does not have as good support for database modeling in UML.</p>

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

<li>Each hotel consists of a set of rooms arranged on various floors. Each room has an identifier which is unique within that hotel. Most of the time, rooms are numbered (e.g. 690), but they may be giv
