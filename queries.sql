-- How can you isolate (or group) the transactions of each cardholder?
SELECT card_holder.name, credit_card.card, transaction.amount
, merchant.name AS merchant_name, merchant_category.name AS merchant_category_name

FROM transaction
JOIN credit_card ON transaction.card=credit_card.card
JOIN card_holder ON card_holder.id=credit_card.cardholder_id
JOIN merchant ON merchant.id=transaction.id_merchant
JOIN merchant_category ON merchant_category.id=merchant.id_merchant_category;

-- Count the transactions that are less than $2.00 per cardholder.
SELECT COUNT(*)
FROM transaction
WHERE amount < 2.00;

-- Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
SELECT COUNT(id) AS t_count, card, sum(amount), date("date") AS t_date
FROM transaction 
GROUP BY card, t_date
ORDER BY t_count DESC;

-- What are the top 100 highest transactions made between 7:00 am and 9:00 am?


-- Do you see any anomalous transactions that could be fraudulent?


-- Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?


-- If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.