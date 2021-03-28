# Looking for Suspicious Transactions using SQL

![Credit card fraudster](Images/credit_card_fraudster.jpg)

*[Credit Card Fraudster by Richard Patterson](https://www.flickr.com/photos/136770128@N07/42252105582/) | [Creative Commons Licensed](https://creativecommons.org/licenses/by/2.0/)*

## Background

Used SQL to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

---
### Data Modeling

Created an entity relationship diagram (ERD) by inspecting the CSV files.

### Data Engineering

Used your database model as a blueprint, created a database schema for each of the tables and relationships. Specified data types, primary keys, foreign keys, and any other constraints you defined.

After creating the database schema, imported the data from the corresponding CSV files.

### Data Analysis
#### Part 1:

Using the newly created database, generated queries that will discover:

* Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders. 

  * So isolated (or grouped) the transactions of each cardholder

  * Counted the transactions that are less than $2.00 per cardholder
  
  * Looked for evidence to suggest that a credit card has been hacked

* Considered the time period in which potentially fraudulent transactions are made 

  * Top 100 highest transactions made between 7:00 am and 9:00 am

  * Tried to  notice anomolous transactions that could be fraudulent

  * Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?

* Top 5 merchants prone to being hacked using small transactions

* Created a view for each of your queries.

#### Part 2:

Generated visualizations that supply detailed trends data on specific card holders. 

* Used two random cardholders who could have been hacked. I only used their cardholder ID which is 2 and 18 respectively. I used them to verfy if there was any possible fradulent activity. 

  * Used hvPlot, created a line plot representing the time series of transactions over the course of the year for each cardholder separately
  
  * Created a single line plot that contains both card holders' trend data

  * Analyzed if this showed any fradulent activity: 
> Credit card holder 18 is trying to fly under the radar with small amounts, and regularly taking bit money (>$1000). Therefore card holder 18 is riskier that credit card holder 2.

* The customer company can decide to see if the corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. For privacy reasons, I only use the cardholder ID: 25.

  * Used Plotly Express, created a box plot, representing the expenditure data from January 2018 to June 2018 for cardholder ID 25
  
  * Looked for outliers for cardholder ID 25

  * Analyzed if this showed any anomalies:
> Card holder 25 is quite suspicious. Majority of their transactions are of small amounts, but almost every month there is big spending which is usually above $1000.

## Another Apporach

Another approach to identifying fraudulent transactions is to look for outliers in the data. Standard deviation or quartiles are often used to detect outliers.

* One that uses standard deviation to identify anomalies for any cardholder.

* Another that uses interquartile range to identify anomalies for any cardholder.
