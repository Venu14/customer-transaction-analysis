-- Fraud rate
SELECT 
    COUNT(CASE WHEN is_fraud = 1 THEN 1 END) * 100.0 / COUNT(*) AS fraud_rate
FROM transactions;

-- Top customers
SELECT customer_id, SUM(amount) AS total_spent
FROM transactions
GROUP BY customer_id
ORDER BY total_spent DESC;

-- Location-wise fraud
SELECT location, COUNT(*) AS fraud_cases
FROM transactions
WHERE is_fraud = 1
GROUP BY location;

-- Window function
SELECT customer_id,
       amount,
       RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rank
FROM transactions;
