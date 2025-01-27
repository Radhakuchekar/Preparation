-- reference https://datalemur.com/questions/top-fans-rank
select * from (
SELECT 
  artists.artist_name,
  DENSE_RANK() OVER (
    ORDER BY COUNT(songs.song_id) DESC) AS artist_rank
FROM artists
INNER JOIN songs
  ON artists.artist_id = songs.artist_id
INNER JOIN global_song_rank AS ranking
  ON songs.song_id = ranking.song_id
WHERE ranking.rank <= 10
GROUP BY artists.artist_name) ranked 
where artist_rank<=5;