# COSC 304 - Introduction to Database Systems<br>Lab 9

<!--
## [Development](develop/) Stream - XML, JSON, Views, and Triggers

Add JSON output for your web service.

## [Analysis](analyze/) Stream - Handling Data Formats (CSV, XML, JSON)

Process data in other formats and connect it with relational data.
-->

## [Assignment](assign/) - XML, JSON, Views, and Triggers

Both paths complete an assignment on these topics.

## Reference Material

### XML

**Extensible Markup Language (XML)** is a markup language that allows for the description of data semantics. Advantages of XML include simplicity, open standard, extensibility, interoperability, and separation of data and presentation.

An XML document is a text document that contains markup in the form of tags. XML data is ordered by nature. 

An XML document is **well-formed** if it obeys the syntax of the XML standard.  This includes having a single root element, and all elements must be properly closed and nested. An XML document is **valid** if it is well-formed and it conforms to a Document Type Definition (DTD) or an XML Schema Definition (XSD). 

**XPath** allows specifying path expressions to navigate the tree-structured XML document. Path descriptors are sequences of tags separated by slashes `/`. The `*` wild card operator can be used to denote any single tag. Attributes are referenced by putting a `@` in front of their name. A predicate expression is specified inside square brackets `[..]` following a tag. 

Use the [XML Practice Query Page](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/xml/xmlquery.html) to practice writing some XPath queries.

### JSON

**JavaScript Object Notation (JSON)** is a method for serializing data objects into text form. It is human-readable, supports semi-structured data, and has supporting libraries in many programming languages. It is often used for data interchange between a client and the server. 

#### JSON constructs
- **Values:** number, strings (double quoted), true, false, null
- **Objects:** enclosed in { } and consist of set of key-value pairs
- **Arrays:** enclosed in [ ] and are lists of values
- Objects and arrays can be nested.

An online JSON validator is [JSONLint](https://jsonlint.com).

### Views

A **view** is a named query.  Views may be either virtual or materialized in the database. Advantages of views include data independence, easier querying, improved performance for materialized views, and the ability to enforce security constraints using GRANT/REVOKE on views instead of base tables.

### Triggers

Triggers are also called event-condition-action (ECA) rules. When an event occurs (such as inserting a tuple) that satisfies a given condition (any SQL boolean-valued expression) an action is performed (which is any sequence of SQL statements). Triggers provide a general way for detecting events and responding to them.

There are statement level triggers (execute once per statement) and row level triggers (execute once per row). Row level triggers use `FOR EACH ROW` clause. A trigger may fire `BEFORE`, `AFTER`, or `INSTEAD OF` and `INSERT`, `DELETE`, or `UPDATE` event.

Triggers can be created in [MySQL](https://dev.mysql.com/doc/refman/8.0/en/create-trigger.html) and [SQL Server](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql?view=sql-server-ver16). The trigger syntax varies between database systems.
