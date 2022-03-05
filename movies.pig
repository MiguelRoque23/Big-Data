ratings = LOAD '/root/input/u.data' USING PigStorage('\t') AS (user_id:int, movie_id:int, rating:int, time:int);

group_ratings = GROUP ratings BY movie_id;
ratings = FOREACH group_ratings GENERATE group as movie_id, COUNT(ratings.rating) as count_ratings;
ratings = FILTER ratings BY count_ratings >= 10;

movies = LOAD '/root/input/u.item' USING PigStorage('|') AS (movie_id:int, movie_name:chararray);

joined = JOIN ratings BY movie_id, movies BY movie_id;

dataset = FOREACH joined GENERATE movies::movie_id as movie_id, SIZE(movies::movie_name) as movie_name_len, movies::movie_name as movie_name;
ordered = ORDER dataset BY movie_name_len desc;
top10 = LIMIT ordered 10;

DUMP top10;
