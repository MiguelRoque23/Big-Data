ratings = LOAD '/root/input/u.data' USING PigStorage('\t') AS (movie_id:int, rating:int);
group_ratings = GROUP ratings BY movie_id;
cnt_ratings = FOREACH group_ratings GENERATE group as movie_id, COUNT(ratings.rating) as nr_ratings;
filter_ratings = FILTER cnt_ratings BY nr_ratings >= 10;

movies = LOAD '/root/input/u.item' USING PigStorage('|') AS (movie_id:int, movie_name:chararray);

joined = JOIN filter_ratings BY movie_id, movies BY movie_id;
dataset = FOREACH joined GENERATE filter_ratings::movie_id, movies::movie_name as movie_title, SIZE(movie_title) as len_title;
ordered = ORDER dataset BY len_title desc;
top_10 = LIMIT ordered 10;

DUMP top_10;
