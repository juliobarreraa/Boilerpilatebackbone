<?php 

$movie = array("id" => 1, "user_id" => 1, "name" => "Transformers 1", "year" => 2007);

$movies = array(
	array("id" => 1, "user_id" => 1, "name" => "Transformers 1", "year" => 2007),
	array("id" => 2, "user_id" => 2, "name" => "Rapidos y furiosos", "year" => 2004),
	array("id" => 3, "user_id" => 3, "name" => "Saw", "year" => 2005),
	array("id" => 4, "user_id" => 4, "name" => "60 segundos", "year" => 2001),
	array("id" => 5, "user_id" => 5, "name" => "Resident Evil", "year" => 2007),
	array("id" => 6, "user_id" => 6, "name" => "Chucky", "year" => 1998)
);

if (isset($_GET["id"]) && ($id = intval($_GET["id"]))) {
	$id -= 1;
	echo json_encode($movies[$id]);
} else {
	echo json_encode($movies);
}