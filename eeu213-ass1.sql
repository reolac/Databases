# Question One
SELECT `name`, `date_of_birth`
FROM `moviedata`.`actor`
WHERE `name` LIKE '% B%';

# Question Two
SELECT `title`, `gross_earnings`
FROM `moviedata`.`film`
WHERE `gross_earnings` BETWEEN 100000000 AND 300000000
ORDER BY `gross_earnings` DESC;

# Question Three
SELECT `name`, YEAR(`date_of_birth`) as 'year_of_birth'
FROM `moviedata`.`actor`
WHERE YEAR(`date_of_birth`) BETWEEN '1990' AND '2000'
ORDER BY `name`  DESC;

# Question Four
SELECT FORMAT(MIN(`gross_earnings`),0) as 'minimum_gross', 
FORMAT(MAX(`gross_earnings`),0) as 'maximum_gross', 
FORMAT(AVG(`gross_earnings`),0) as 'average_gross'
FROM `moviedata`.`film`;

# Question Five
SELECT `nationality`, COUNT(`nationality`) as 'number of actors'
FROM `moviedata`.`actor`
GROUP BY `nationality`;

# Question Six
SELECT `distributor_id` as 'distributor_identifier', 
MAX(`year`) as 'year_of_release', 
COUNT(`distributor_id`) as `total_distributor_releases`
FROM `moviedata`.`release`
GROUP BY `distributor_id`
HAVING COUNT(`distributor_id`) > '2';

# Question Seven
SELECT `film_id` as 'identifier', `title`
FROM `moviedata`.`film`
WHERE `film_id`
	IN(
		SELECT `film_id`
		FROM `moviedata`.`release`
		WHERE `year` > 2000
	);

# Question Eight
SELECT `film`.`film_id` as 'film_identifier', 
`film`.`title`, `film`.`director`, `release`.`year` as 'year_of_release'
FROM `moviedata`.`film`
JOIN `moviedata`.`release`
ON `film`.`film_id` = `release`.`film_id`
WHERE `release`.`year` < 2000;	

# Question Nine
SELECT `film`.`title` as 'film_title', 
`distributor`.`name` as 'distributor_name', `release`.`year` as 'year_of_release'
FROM `moviedata`.`film`
JOIN `moviedata`.`release`
ON `film`.`film_id` = `release`.`film_id`
JOIN `moviedata`.`distributor`
ON `release`.`distributor_id` = `distributor`.`distributor_id`
WHERE `release`.`year` BETWEEN 1995 AND 2005;

# Question Ten(JOIN)
SELECT `film`.`director`, 
MIN(`film`.`title`) as 'title', MAX(`film`.`title`) as 'title'
FROM `moviedata`.`film`
JOIN `moviedata`.`release`
ON `film`.`film_id` = `release`.`film_id`
GROUP BY `film`.`director`
HAVING COUNT(`film`.`director`) >= 2;

# Question Ten(CARTESIAN)
SELECT `film`.`director`, 
MIN(`film`.`title`) as 'title', 
MAX(`film`.`title`) as 'title'
FROM `moviedata`.`film`, `moviedata`.`release` 
WHERE `film`.`film_id` = `release`.`film_id`
GROUP BY `film`.`director`
HAVING COUNT(`film`.`director`) >= 2;