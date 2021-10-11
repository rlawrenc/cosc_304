# COSC 304 - Introduction to Database Systems<br>Lab 4: Building ER diagrams using an UML modeling tool

This lab designs ER diagrams in UML notation. Students participating in the AutoER study can use the AutoER Designer and Evaluator software that performs real-time marking and feedback. If you have not signed up, fill out the <a href="https://ubc.ca1.qualtrics.com/jfe/form/SV_1YtWwaxpaX7sx1A">consent form</a>. <strong>A video on how to use the AutoER system is in Canvas. Like MySQL, your user id is the first letter of your first name and up to 7 letters of your last name. Your password is your student number.</strong></p>

It is also possible to use a variety of drawing software such as [astah](http://astah.net/editions). <strong>Note: Astah no longer has a free community version. Request a student license or use the 30-day trial.</strong> <a href="https://diagrams.net/">diagrams.net</a> is an online drawing tool that can also be used but it does not have as good support for database modeling in UML.


## Question #1 (10 marks)

<h3>AutoER link: <a href="https://autoed.ok.ubc.ca/questions/4">https://autoed.ok.ubc.ca/questions/4</a></h3>

<h4>Question Text (if done using astah)</h4>

Construct a database design in UML for an online game store described below. **Data types are not needed.**

- A `Developer` where each developer is identified by an <tt>id</tt> and has a `name`. (1 mark)

- A `Category` where each category has an `id`, a `name`, and may have a parent category. (2 marks)

- A `Game` storing each game that is identified by a field called <tt>id</tt> and other attributes include `name` and `description`. A game is created by one Developer. A Developer may publish multiple games. A Game has a Category. (3 marks)

- A `GameVersion` stores each version of the game. A GameVersion is associated with exactly one Game. Use a `version` field to identify between versions of the same Game. Each GameVersion has a `releaseDate`, a `rating`, a `price`, and a `description` (2 marks)

- A `GameVersionReview` stores ratings for each game version. Each instance applies to a single GameVersion, and different reviews are identified by `reviewer` attribute (which is name of reviewer). There is also a `reviewDate`, `rating`, and `review`. (2 marks)


## Question #2 (10 marks)

<h3>AutoER link: <a href="https://autoed.ok.ubc.ca/questions/5">https://autoed.ok.ubc.ca/questions/5</a></h3>

<h4>Question Text (if done using astah)</h4>

Construct a database design in UML for a School management system described below. **Data types are not needed.**

- There are multiple schools in the school management system. A school is identified by its name and has a location. (1 mark)</li>

- A teacher is identified by their teacher number and has a name. Each school has a single teacher as a principal, and a teacher may be the principal at only one school. Teachers are located in schools. A teacher may be located in more than one school. A teacher located at a school has an office number and a salary paid by that school. (3 marks)

- A student is identified by their student id and also has a name and gender. (1 mark)

- A student takes a course with a teacher at a particular school. Each course is identifed by its own id and also has a meeting date. (3 marks)

- For each course, zero or more exams are taken each with a score and an outcome (Pass/Fail). Each exam is identified for a particular course by name. (2 marks)
