# COSC 304 - Introduction to Database Systems<br>Assignment 5 - Converting ER/UML Diagrams into the Relational Model


## Question 1 - Pet Daycare Database (15 marks)

Build a pet daycare database that tracks information on owners and their pets when they stay at a pet daycare. There are three components:

1) Build an ER/UML diagram. **(7 marks)** This can be done using PrairieLearn (link: https://plcanary.ok.ubc.ca/pl/course_instance/6/assessment/147) or using Astah.
2) The design has one opportunity for using subclasses (i.e. IS-A constraints). Identify the entities involved and provide the appropriate constraint (i.e. OPTIONAL/MANDATORY and AND/OR). **(1 mark)**
3) Convert the diagram into the relational model. **(7 marks)** SQL DDL is NOT required. Write out the relation names with attributes. Identify by underlining primary keys and indicate all foreign keys. Remember to clearly indicate the FK direction.

On Canvas submit a single document that contains a screenshot of the UML design (part 1), the subclass info (part 2), and the conversion to the relational model (part 3). **If you used PrairieLearn, make sure the screenshot shows the user name of one student in your group and the mark received.**

### Question Description

A pet daycare stores information about `pets` that belong to `owners`. An `owner` is identified by an `id`, and their `first name`, `last name`, and `address` are also stored. `Pets` are identified by their `name` and their `owner`. For each pet, record their `age` and a `description`.  Our pet daycare specializes in `cats` and `dogs` so specific information is stored for each of these types of pets. For `cats` note if they `have claws` and `are social`. For `dogs` we need to know their `size` and if they are `barkers`. Our company supports animals besides cats and dogs. For other types of animals, information about them and their type are stored in the `description` of the `pet`. Our facility has several `buildings` that have an identifying `id` and also a `building name` and `year built`. Each `building` contains multiple `rooms` with a `room number` that is unique within a building. Rooms also have a specific `size`.  When a pet `stays` at the day care, the `start date` distinguishes between particular stays for that pet. Additional information is the `end date` and `cost`. The pet `stays` in one particular `room` for a given stay.

## Question 2 (35 marks) - Project Deliverable

The project will build an online store like Amazon.com selling whatever products you want. The first step is to develop a database design and convert that design into SQL DDL. Description:

- A <strong>Customer</strong> is identified by an auto-increment id. Other attributes include first name, last name, email, phone number, street address, city, province/state, postal code, and country. A <strong>Customer</strong> also has a user id (unique) and password.

- A customer may have some payment methods. A <strong>Payment Method</strong> has an auto-increment id for a key, a payment method type (PayPal, Visa, etc.), payment number, and payment expiry date.

- An <strong>Order</strong> is placed by one customer. A customer may have multiple orders. An <strong>Order</strong> has an auto-increment id, order date, and total order amount (e.g. $55.75). Also store the shipment address, city, state, country, and postal code. Use <strong>OrderSummary</strong> as entity/table name as <strong>Order</strong> is a keyword in SQL.

- The store sells products. A <strong>Product</strong> has an auto-increment id, name, price, image URL (string), image (BLOB), and description.
- A product has a category. A category has one or more Products. A <strong>Category</strong> has an auto-increment id and name.

- Products are part of an order. An order may have multiple products. For each product in an order track the quantity and price.

- An order is shipped with a shipment. A <strong>Shipment</strong> has an auto-increment id, a shipment date, and a description. A shipment contains only one order.

- A <strong>Warehouse</strong> contains products. A product may be stored at multiple warehouses with different inventory values. A shipment will be sent from only one warehouse. A <strong>Warehouse</strong> has an auto-increment id and a name.

- For each customer, track their shopping cart which may contain products each with a quantity and price.

- A product may have reviews by customers. A <strong>Review</strong> by a customer on a product has an auto-increment id, rating (1 to 5), comment, and review date. A customer does not have to buy a product in order to provide a review. A customer may review a product more than once.

### Deliverables

**1. Draw the ER/UML diagram for this database. Note: Data types are REQUIRED as part of the design. (21 marks)** **You can use PrairieLearn to check your work (link: https://plcanary.ok.ubc.ca/pl/course_instance/6/assessment/147), but your design needs to include data types so it must be in Astah or another tool.**

**2. Convert the UML diagram into SQL DDL. Make sure to define primary keys and foreign keys. Your SQL DDL must run on either MySQL or Microsoft SQL Server. Make sure your primary keys that are auto-increment are specified as `AUTO_INCREMENT` in your DDL. (11 marks)**

**3. Imagine creating your own store and selling products. Determine what products to sell. Write a mission statement (1 mark) and executive summary paragraph (2 marks) describing your idea.**

**Items to submit: your UML diagram (image preferred rather than astah file), a text file containing your SQL DDL, a document with your mission statement and executive summary.**


