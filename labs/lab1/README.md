# COSC 304 - Introduction to Database Systems<br>Lab 1: Querying using Relational Algebra

## [RelaX - Online Relational Algebra Tool](https://dbis-uibk.github.io/relax/)

[RelaX](https://dbis-uibk.github.io/relax/) is an online relational algebra tool that we will use for the assignments. It allows entering relational algebra expressions and executing them to get results. The data set can be loaded from a GitHub Gist including the [Bookstore data set]() used for sample relational algebra queries in this lab.

## Relational Algebra Practice

**This lab has a practice component that is not graded and an [assignment component](assign/readme.md).**

The lab practices writing queries in relational algebra using a book database schema:

<PRE>
Book (<u>isbn</u>, pubDate, listPrice, publisher, title, copyright)
Author (<u>firstName</u>, <u>lastName</u>, address)
BookAuthor (<u>isbn</u>, <u>firstName</u>, <u>lastName</u>)
Bookstore (<u>name</u>, address)
Stock (<u>storeName</u>, <u>isbn</u>, storePrice, quantity)
</PRE>

The <tt>Author</tt> relation gives the author's first and last names and address. Each first name/last name pair is unique. The <tt>Book</tt> relation gives the isbn, title, copyright date, publication date, and recommended list price.  Since a book can have multiple authors, the relation <tt>BookAuthor</tt> matches up authors (identified by name) with books (identified by ISBN).  The <tt>Bookstore</tt> relation gives the name (key) and address of a book store. The <tt>Stock</tt> relation gives the bookstore name, the price, and the ISBN number of the book. listPrice and storePrice are real numbers. copyright and pubDate are integers (representing the year). All other attributes are strings.

### Questions:  (Write the answer in relational algebra)

<ol>

<li>Return all books (ISBN only) with a list price over $50.</li>

<li>Return all books (ISBN only) with a publish date before Jan. 11, 2001 or whose publisher is 'GenCo'.</li>

<li>Return all addresses (both for authors and bookstores).</li>

<li>Return all authors that have not published a book.</li>

<li>Return the list of books written by Joe Smith.</li>

<li>Return the list of books written by Joe Smith that cost less than $40.</li>

<li>Find all authors (firstName, lastName) who have written books that have been published after Feb. 15, 1990.</li>

<li>Find all authors who have written more than one book.</li>

<li>Find pairs of books with different ISBNs but the same title. A pair should be listed only once; e.g., list (i,j) but not (j,i).</li>

<li>List all the books (ISBN only) that 'All Books' sells that 'Some Books' also sells.</li>

<li>List all the books (ISBN only) that 'All Books' sells that 'Some Books' sells for less.</li>

<li><b>Open question:</b> You suggest an English question, and let's try answer it using relational algebra.  You do not have to have an answer to your own question, but hopefully, you think you can answer it.  Also, note that we cannot answer all questions using the subset of relational algebra that we have studied.</li>
</ol>


#### Answers:

<ol>
<li> &pi;&nbsp;<sub>isbn</sub>(&sigma;<sub>listPrice > 50</sub>(Book))</li>

<li> &pi;&nbsp;<sub>isbn</sub>(&sigma;<sub>pubDate < '2001-01-11' OR publisher = 'GenCo'</sub>(Book))</li>

<li> &pi;&nbsp;<sub>address</sub>(Author) &cup; &nbsp; &pi;<sub>address</sub>(Bookstore)</li>

<li> &pi;&nbsp;<sub>firstName, lastName</sub>(Author) - &pi;<sub>firstName, lastName</sub>(BookAuthor)</li>

<li> &pi;&nbsp;<sub>isbn</sub>(&sigma;<sub>firstName = 'Joe' and lastName = 'Smith'</sub>(BookAuthor))</li>

<li> &pi;&nbsp;<sub>isbn</sub>(&sigma;<sub>firstName = 'Joe' and lastName = 'Smith' and listPrice < 40</sub>(BookAuthor &#x22C8; Book))</li>

<li> &pi;&nbsp;<sub>firstName, lastName</sub>(&sigma;<sub>pubDate > '1990-02-15'</sub>(BookAuthor &#x22C8; Book))</li>

<li> &pi;&nbsp;<sub>B1.firstName, B1.lastName</sub>(&sigma;<sub>B1.firstName = B2.firstName AND B1.lastName = B2.lastName AND B1.isbn != B2.isbn</sub>(BookAuthor B1 X BookAuthor B2))

<BR><b>With a join:</b><BR>

&pi;&nbsp;<sub>B1.firstName, B1.lastName</sub>(BookAuthor B1 &#x22C8; &nbsp;<sub>B1.firstName = B2.firstName AND B1.lastName = B2.lastName AND B1.isbn != B2.isbn</sub> BookAuthor B2)
</li>

<li> &pi;&nbsp;<sub>B1.isbn, B2.isbn</sub>(&sigma;<sub>B1.title = B2.title AND B1.isbn < B2.isbn</sub>(Book B1 X Book B2))

<BR><b>With a join:</b><BR>

&pi;&nbsp;<sub>B1.isbn, B2.isbn</sub>(Book B1 &#x22C8; &nbsp;<sub>B1.title = B2.title AND B1.isbn < B2.isbn</sub> Book B2)

</li>

<li> &pi;&nbsp;<sub>isbn</sub>(&sigma;<sub>storeName = 'All Books'</sub>(Stock)) &cap; &nbsp; &pi;<sub>isbn</sub>(&sigma;<sub>storeName = 'Some Books'</sub>(Stock))
<BR><b>OR</b><BR>

&pi;&nbsp;<sub>S1.isbn</sub>(&sigma;<sub>S1.storeName = 'All Books' AND S2.storeName = 'Some Books' and S1.isbn=S2.isbn</sub>(Stock S1 X Stock S2))

<BR><b>OR</b><BR>

&pi;&nbsp;<sub>S1.isbn</sub>(&sigma;<sub>S1.storeName = 'All Books'</sub> (Stock S1)  &#x22C8; &nbsp; <sub>S1.isbn=S2.isbn</sub> &sigma;<sub>S2.storeName = 'Some Books'</sub>(Stock S2))


</li>

<li> &pi;&nbsp;<sub>S1.isbn</sub>(&sigma;<sub>S1.isbn = S2.isbn AND S2.storePrice < S1.storePrice AND S1.storeName = 'All Books' AND S2.storeName = 'Some Books'</sub>(Stock S1 X Stock S2))

<BR><b>OR</b><BR>

&pi;&nbsp;<sub>S1.isbn</sub>(&sigma;<sub>S1.storeName = 'All Books'</sub>(Stock S1) &#x22C8; &nbsp;<sub>S1.isbn = S2.isbn AND S2.storePrice < S1.storePrice</sub> (&sigma;<sub>S2.storeName = 'Some Books'</sub>(Stock S2))</li>

</ol>

<p><b>Note: Cross-products ('X') should be replaced with joins for efficiency.</b></p>

<p><b>Challenge questions: </b></p>

<ol>
<li>Find all the books published by Harper Collins that are in-stock at Chapters.  <BR><b>Answer:</b><BR>


&pi;&nbsp;<sub>isbn</sub>(&sigma;<sub>storeName='Chapters' AND quantity > 0</sub>(Stock &#x22C8; &sigma;<sub>publisher='Harper Collins'</sub>(Book)))
</li>


<li>List the addresses of stores that have pairs of books with the same title and different ISBNs.<BR></li>

<IMG SRC="img/challengeQuestionAnswer.png">


</ol>

### [Lab 1 - Relational Algebra Assignment](assign/readme.md)
