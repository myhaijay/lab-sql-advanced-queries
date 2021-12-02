-- 1. List each pair of actors that have worked together.
select fa.actor_id as Actor, fa1.actor_id as Actors, fa.film_id from film_actor as fa
join film_actor as fa1 on fa.actor_id < fa1.actor_id
where fa.film_id = fa1.film_id ;--  and fa.actor_id <> fa1.actor_id


-- 2. For each film, list actor that has acted in more films.
select film_id, Actor, No_of_Films 
from (
	select *, row_number() over (partition by film_id order by No_of_Films desc) ranking
	from (
		select film_id, concat(first_name, ' ',last_name) as Actor, count(film_id) as No_of_Films from film_actor as fa
		join actor as a using(actor_id)
		group by actor_id 
		order by No_of_Films desc) as sub1
	) sub2
where ranking = 1;



