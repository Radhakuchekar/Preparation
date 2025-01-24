from pyspark.sql.window import Window

# Row-Based Rolling Window
# Unbounded preceding (from the beginning to the current row)
window_spec_cumulative = Window.partitionBy("user_id").orderBy("tweet_date").rowsBetween(Window.unboundedPreceding, 0)
# Unbounded preceding and following (entire partition)
window_spec_full = Window.partitionBy("user_id").orderBy("tweet_date").rowsBetween(Window.unboundedPreceding, Window.unboundedFollowing)
# Rolling window of the current row and 2 preceding rows
window_spec_rolling = Window.partitionBy("user_id").orderBy("tweet_date").rowsBetween(-2, 0)

# Time-Based Rolling Window
window_spec_time_rolling = Window.partitionBy("user_id").orderBy("timestamp").rangeBetween(-3 * 86400, 0)  # 3 days in seconds
# Current row and 2 following rows
window_spec_future = Window.partitionBy("user_id").orderBy("tweet_date").rowsBetween(0, 2)

