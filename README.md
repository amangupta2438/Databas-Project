# Databas-Project
I have created the E-Shopping mangement system using SQL.

This SQL script creates a relational database system for an Online Shopping Platform, simulating real-world operations like:

Managing users (customers)
Categorizing and selling products
Handling customer orders
Processing order items
Recording payments

The schema includes foreign keys, constraints, joins, aggregations, and realistic sample data to support various common e-commerce operations.

🧱 Database Structure & Relationships
Here’s a quick overview of how the tables are connected:

markdown
Copy
Edit
Users ─────────────┐
                   ▼
              Orders ─────────────┐
                   ▼             ▼
             Order_Items      Payment
                   ▲
             Product ─────► Category
             
✅ 1. Users

Stores basic customer information.

Each user can place many orders.

✅ 2. Category

Each product belongs to a category (e.g., Electronics, Books).

✅ 3. Product

Contains details of products (name, description, price, stock, category).

Related to Category via category_id.

✅ 4. Orders

Each order is made by a user and has a date, total, and status.

✅ 5. Order_Items

Breaks down orders into specific products and quantities.

Many-to-many relationship between Orders and Product.

✅ 6. Payment

Every order can have one payment with method and status (Paid, Pending, Refunded).

🎯 Features Covered by the Queries

✔️ Search & Filter

Find users in a specific city.
View products by category.
View orders by status.

✔️ Aggregation & Reports

Count orders per user.
Sum total delivered order sales.
Track top-selling products.

✔️ Join Operations

Multiple queries use JOIN to relate data across tables for meaningful results.

✔️ Data Updates

Demonstrates updating product stock and order statuses.

✔️ Payments

Includes various payment methods and status tracking.

🧪 Use Cases

This code can be used for:

Academic DBMS projects

E-commerce app backend prototyping

Practice with SQL joins, aggregates, and constraints

Sample dataset for running analytics/BI tools

💡 Room for Enhancements

Here are a few ideas if you want to expand this:

Add Reviews or Wishlist tables.

Include Admin or Seller roles.

Add timestamps (created_at, updated_at) to records.

Add constraints like CHECK, DEFAULT, or triggers.

Add stored procedures for actions like "place order".

