# Top 5 Artists [Spotify SQL Interview Question]

Assume there are three Spotify tables containing information about the artists, songs, and music charts. Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. From now on, we'll refer to this ranking number as "song appearances".

Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of who has the most appearances). The order of the rank should take precedence.

For example, Ed Sheeran's songs appeared 5 times in Top 10 list of the global song rank table; this is the highest number of appearances, so he is ranked 1st. Bad Bunny's songs appeared in the list 4, so he comes in at a close 2nd.

Assumptions:

- If two artists' songs have the same number of appearances, the artists should have the same rank.
- The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).

Check out [DataLemur](https://datalemur.com/questions/top-fans-rank) for sample input table!

## My Solution

```
with top_ten_songs as (
  
  SELECT
    artist_id,
    songs.song_id,
    global_song_rank.rank
  FROM songs
  LEFT JOIN global_song_rank
    ON songs.song_id = global_song_rank.song_id
  WHERE global_song_rank.rank <= 10
  
), top_artist as (

  SELECT 
    artist_name
    , COUNT(song_id)
    , DENSE_RANK() OVER (ORDER BY COUNT(song_id) DESC) AS artist_rank
  FROM top_ten_songs
  LEFT JOIN artists a
  ON top_ten_songs.artist_id = a.artist_id
  GROUP BY 1
  
)

SELECT 
  artist_name
  , artist_rank
FROM top_artist
WHERE artist_rank <= 5
```

see difference between rank, dense_rank, and row_number