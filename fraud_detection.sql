-- How can you isolate (or group) the transactions of each cardholder?
CREATE VIEW transaction_goups AS
SELECT card_holder.name, credit_card.card, transaction.amount
, merchant.name AS merchant_name, merchant_category.name AS merchant_category_name

FROM transaction
JOIN credit_card ON transaction.card=credit_card.card
JOIN card_holder ON card_holder.id=credit_card.cardholder_id
JOIN merchant ON merchant.id=transaction.id_merchant
JOIN merchant_category ON merchant_category.id=merchant.id_merchant_category;

-- Count the transactions that are less than $2.00 per cardholder.
CREATE VIEW low_transactions AS
SELECT COUNT(*)
FROM transaction
WHERE amount < 2.00;

-- Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
CREATE VIEW hacked_behavior AS
SELECT COUNT(id) AS t_count, card, sum(amount), date("date") AS t_date
FROM transaction 
GROUP BY card, t_date
ORDER BY t_count DESC;

-- What are the top 100 highest transactions made between 7:00 am and 9:00 am?
CREATE VIEW highest_transactions AS
SELECT id, date("date") AS date, cast(date as time) AS time, amount, card, id_merchant
FROM transaction
WHERE CAST(date as time) BETWEEN '7:00:00' and '09:00:00'
ORDER BY amount DESC
LIMIT 100;

-- Do you see any anomalous transactions that could be fraudulent?
CREATE VIEW fraudlent_transactions AS
SELECT id, date("date") AS date, cast(date as time) AS time, amount, card, id_merchant
FROM transaction
WHERE CAST(date as time) BETWEEN '7:00:00' and '09:00:00' AND
(
	amount > '500' OR amount < '2'
	)
ORDER BY amount DESC;

-- Yes, some transactions are much above the usual transactions of below $100 after charging a small amout of less than $2. 
-- This could indicate a fraudlent behavior. 

-- Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
SELECT id, date("date") AS date, cast(date as time) AS time, amount, card, id_merchant
FROM transaction
WHERE CAST(date as time) NOT BETWEEN '7:00:00' and '09:00:00' AND
(
	amount > '500' OR amount < '2'
	)
ORDER BY amount DESC;