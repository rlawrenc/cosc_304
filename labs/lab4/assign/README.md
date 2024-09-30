# COSC 304 - Introduction to Database Systems<br>Lab 4: Building ER diagrams using an UML modeling tool

This lab designs ER diagrams in UML notation. The AutoER auto-grading software on PrairieLearn is used to design and mark your UML diagrams. It is also valuable to learn how to use commercial UML design software such as [Astah](http://astah.net/editions). <strong>Note: Astah no longer has a free community version. Request a student license or use the 30-day trial.</strong> <a href="https://drawio.com/">drawio</a> is an online drawing tool that can also be used but it does not have as good support for database modeling in UML.</p>

<h3>AutoER PrairieLearn link: https://plcanary.ok.ubc.ca/pl/course_instance/6/assessment/145</h3>

**When using PrairieLearn, for each question please submit a screenshot showing your answer and the marking. Make sure the screenshot shows your name.**</p>

## Question #1 - Stock Market Database (10 marks)

Construct a database design in UML for a stock market tracking database. **Data types are not needed.**

- The database tracks companies, where a `company` has a `name` and is identified by its `ticker symbol`.

- Each company participates in a particular `industry`. An `industry` has an identifying `name` and also a `description`.

- Stock market `analysts` cover stocks and produce `recommendations`. `Analysts` are distinguished from each other by the name of their `firm` and their `name`. Analysts also have an `accuracy rating` that measures the accuracy of their `recommendations`.

- Each `recommendation` is from a particular `analyst` on a certain `company`. A `recommendation` includes a predicted `price` in the next 12 months and a `rating` for the stock (buy, hold, sell).

- The database includes a `daily summary` for each company with a `closing price`, `volume`, `low price`, and `high price`. Daily summaries are identified by the company it is associated with and the `summary date`.

- `News events`are tracked for companies. A `news event` has an identifying `eventId` and has additional details on the event `text` and the `release date`. A `news event` may be associated with multiple companies, and a company may have many news events.


## Question #2 - Question Database (10 marks)

Construct a database design in UML for a question databank. **Data types are not needed.**

- A `course` is identified by its `course number` and has a `course name` and `year`.

- Different `course offerings` are distinguished from each other by the `starting date` of the course. A `course offering` stores the `number of students` in the course and also has an `ending date`.

- Every `course` has one or more `learning outcomes` that are `material` and `skills` that `students` should learn after `completing` the course. A `learning outcome` (identified by `outcomeId`) may be achieved in many courses or in no current courses.

- A `question` is used in a `course offering` to test student `knowledge`. A `question` is identified by its `questionId` and also contains a `questionName`, `questionText`, and `questionAnswer`.

- `Questions` must have at least one `learning outcome` and may have many. Each `question` has one `topic`. A `topic` has a unique `topicName` and may have multiple `subtopics`.

- A `question` can be used in multiple `course offerings`, and in each offering the `mark` associated with the `question` may be different.
