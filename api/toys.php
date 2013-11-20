<?php 

$toy = array("id" => 1, "user_id" => 1, "name" => "Buzz Light Year", "price" => 1000);

$toys = array(
	array("id" => 1, "user_id" => 1, "name" => "Buzz Light Year", "price" => 1000),
	array("id" => 2, "user_id" => 2, "name" => "Hot Wells", "price" => 150),
	array("id" => 3, "user_id" => 3, "name" => "Barbie", "price" => 198),
	array("id" => 4, "user_id" => 4, "name" => "Adivina Quien", "price" => 450),
	array("id" => 5, "user_id" => 5, "name" => "Monopoly", "price" => 350),
	array("id" => 6, "user_id" => 6, "name" => "Ricochet", "price" => 3491)
);

if (isset($_GET["id"]) && ($id = intval($_GET["id"]))) {
	$id -= 1;
	echo json_encode($toys[$id]);
} else {
	echo json_encode($toys);
}