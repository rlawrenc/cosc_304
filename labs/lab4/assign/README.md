# COSC 304 - Introduction to Database Systems<br>Lab 4: Building ER diagrams using an UML modeling tool

This lab designs ER diagrams in UML notation. The AutoER auto-grading software is used to design and mark your UML diagrams. It is also valuable to learn how to use commercial UML design software such as [astah](http://astah.net/editions). <strong>Note: Astah no longer has a free community version. Request a student license or use the 30-day trial.</strong> <a href="https://diagrams.net/">diagrams.net</a> is an online drawing tool that can also be used but it does not have as good support for database modeling in UML.</p>

## Question #1 (10 marks)

<h3>AutoER link: TODO</h3>

Construct a database design in UML for a stock market tracking database. **Data types are not needed.**

- The database tracks companies, where a `company` has a `name` and is identified by its `ticker symbol`.

- Each company participates in a particular `industry`. An `industry` has an identifying `name` and also a `description`.

- Stock market `analysts` cover stocks and produce `recommendations`. `Analysts` are distinguished from each other by the name of their `firm` and their `name`. Analysts also have an `accuracy rating` that measures the accuracy of their `recommendations`.

- Each `recommendation` is from a particular `analyst` on a certain `company`. A `recommendation` includes a predicted `price` in the next 12 months and a `rating` for the stock (buy, hold, sell).

- The database includes a `daily summary` for each company with a `closing price`, `volume`, `low price`, and `high price`. Daily summaries are identified by the company it is associated with and the `summary date`.

- `News events`are tracked for companies. A `news event` has an identifying `eventId` and has additional details on the event `text` and the `release date`. A `news event` may be associated with multiple companies, and a company may have many news events.


## Question #2 (10 marks)

<h3>AutoER link: TODO</h3>

Construct a database design in UML for a medical system described below. **Data types are not needed.**

- There are multiple hospitals in the medical system. A hospital is identified by its name and has a location. (1 mark)</li>

- A doctor is identified by his medical number and has a name. Each hospital has a single doctor as a manager, and a doctor may manage only one hospital. Doctors are located in hospitals. A doctor may be located in more than one hospital. A doctor located at a hospital has an office number and a salary paid by that hospital. (3 marks)

- A patient is identified by their health id and also has a name and gender. (1 mark)

- A patient visits a doctor at a particular hospital. Each visit is identifed by its own id and also has a visit date. (3 marks)

- At a visit zero or more tests are run each with a cost and an outcome. Each test is identified for a particular visit by name. (2 marks)
