# Relational Databases

- [SQL Joins](https://www.w3schools.com/sql/sql_join.asp)

## Relational Data

SQL is a Relational Database. That means its a database structured to recognize relations among stored items of information. We so far have only used one table, but in SQL, we will almost always have multiple tables that have relationships with each other.

### Database Normalization

Normalization is the process of breaking down and organizing database tables that describe the relationships between them. We do this so that when we make changes it doesn't have to be painful! More information can be found [here](https://www.essentialsql.com/get-ready-to-learn-sql-database-normalization-explained-in-simple-english/) and [here](https://blog.udemy.com/normalization-in-database-with-example/).

## Relationships

In order to normalize your database, you have to think about the relationships between different data in your database.

What's the relationship between a person and a SSN? A person can only have one SSN, and a SSN is owned by one person. This is  an example of ONE-TO-ONE. 

Other examples -- Countries and Capital Cities.