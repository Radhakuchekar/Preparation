
-- reference https://datalemur.com/questions/signup-confirmation-rate
select round(confirmed/(total + 0.0),2) as confirm_rate from (
  select 
    sum(case when assignup_action = 'Confirmed' then 1 else 0 end) as Confirmed
    ,count(*) as total
    from
    (SELECT user_id,min(COALESCE(signup_action, 'Not Confirmed'))assignup_action
      FROM emails 
      FULL OUTER JOIN texts
      on emails.email_id = texts.email_id
      group by user_id
    ) grouped_data
  )final;