-- Reference https://datalemur.com/questions/sql-third-transaction
select user_id, spend,  transaction_date from (
SELECT *,
rank() over (PARTITION by user_id order by transaction_date)
as transaction_number FROM transactions)ranked_data
where transaction_number=3;