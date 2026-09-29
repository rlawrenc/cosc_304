# COSC 304 - Introduction to Database Systems<br>Lab 4: Database Design Using ER Diagrams and UML Notation

This lab designs ER diagrams in UML notation. The AutoER auto-grading software on PrairieLearn is used to design and mark your UML diagrams. It is also valuable to learn how to use commercial UML design software such as [Astah](http://astah.net/editions). Astah UML provides a free student license for students with an academic email address. <a href="https://drawio.com/">drawiodraw.io/diagrams.net</a> can also be used, although its support for UML database modeling is less specialized.</p>

<h3>PrairieLearn link: https://plcanary.ok.ubc.ca/pl/course_instance/12/assessment/303</h3>

**When using PrairieLearn, for each question please submit a screenshot showing your answer and the marking. Make sure the screenshot shows your name.**</p>

## Question #1 - Stock Market Database (10 marks)

Construct a database design in UML for a stock market tracking database. **Data types are not needed.**

- The database tracks companies, where a `company` has a `name` and is identified by its `ticker symbol`.

- Each company is classified in a particular `industry`. An `industry` has an identifying `name` and also a `description`.

- Stock market `analysts` cover stocks and produce `recommendations`. `Analysts` are distinguished from each other by the name of their `firm` and their `name`. Analysts also have an `accuracy rating` that measures the accuracy of their `recommendations`.

- Each `recommendation` is from a particular `analyst` on a certain `company`. A `recommendation` includes a predicted `price` in the next 12 months and a `rating` for the stock (buy, hold, sell). For each company an analyst covers, the database stores the analyst’s current recommendation. There is at most one current recommendation from a particular analyst for a particular company.

- The database includes a `daily summary` for each company with a `closing price`, `volume`, `low price`, and `high price`. Daily summaries are identified by the company it is associated with and the `summary date`.

- `News events` are tracked for companies. A `news event` has an identifying `eventId` and has additional details on the event `text` and the `release date`. A `news event` may be associated with multiple companies, and a company may have many news events.


## Question #2 - Question Database (10 marks)

Construct a database design in UML for a question databank. **Data types are not needed.**

- A `course` is identified by its `course number` and has a `course name` and `year`.

- For a particular `course`, different `course offerings` are distinguished by their starting date. A `course offering` stores the `number of students` in the course offering and also has an `ending date`.

- Every `course` has one or more `learning outcomes` that describe the `material` and `skills` that `students` should learn after `completing` the course. A `learning outcome` (identified by `outcomeId`) may be achieved in many courses or in no current courses.

- A `question` may be used in a `course offering` to test student `knowledge`. A `question` is identified by its `questionId` and also contains a `questionName`, `questionText`, and `questionAnswer`.

- `Questions` must have at least one `learning outcome` and may have many. Each `question` has one `topic`.

- A `topic` has a unique `topicName`. A `topic` may have multiple `subtopics`, and a `topic` may have at most one parent `topic`.

- A `question` can be used in multiple `course offerings`, and in each offering the `mark` associated with the `question` may be different.
