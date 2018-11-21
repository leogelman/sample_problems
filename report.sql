/* requirement: 
find the number of movies a genre is in, find the number of all genres in the movies containing the selected genre. 
The ratio of the two numbers is an indicator of the selectivity of the genre: 
 - how well a genre stands on its own, rather than being included with other genres 
*/
-- the first subquery: find all the movies where a genre is present
-- the second subquery: use cartesian join to find the total number of genres for movies selected by a specific genre 
--           (the count for each genre-movie combination is the number of genres tags for the movie)
-- the second subquery can also be thought of as a weighted count of movies.  
--           The weight of each movie is equal to the number of genres the movie is tagged with.
use movielense;
select gmg.id genre, sum(gmg.movie_count) movies_tagged_with_genre, sum(mg.movie_genre_count) count_of_all_genres_in_movies, 
       sum(mg.movie_genre_count)/sum(gmg.movie_count) selectivity_of_genre from   
 (select g.genre id, mg.movieid mgm_id, mg.genre mgg_id, 1 movie_count from genre g join movie_genre mg on mg.genre=g.genre) gmg join 
 (select g.genre id1, mg0.movieid mgm_id, count(*) movie_genre_count from genre g join movie_genre mg0 group by g.genre, mg0.movieid) mg on gmg.id=mg.id1 and gmg.mgm_id=mg.mgm_id
group by gmg.id;
