ratings = LOAD '/root/input/u.data' USING PigStorage('\t') AS (movie_id:int, rating:int);
group_ratings = GROUP ratings BY movie_id;
cnt_ratings = FOREACH group_ratings GENERATE group as movie_id, COUNT(ratings.rating) as nr_ratings;
filter_ratings = FILTER movie_id BY nr_ratings >= 10;

movies = LOAD '/root/input/u.item' USING PigStorage('|') AS (movie_id:int, movie_name:chararray);
length_movies = FOREACH movies GENERATE group as movie_id, LENGTH(movies.movie_name) as title_length;

joined = JOIN filter_ratings BY movie_id, length_movies BY movie_id;
dataset = FOREACH joined GENERATE length_movies::movie_name as movie_name, filter_ratings::nr_ratings as nr_ratings, length_movies::title_length as title_length;
ordered = ORDER dataset BY title_length desc;
top10 = LIMIT ordered 10;
DUMP top10;
