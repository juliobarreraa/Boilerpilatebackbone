<?php
$member = array("id" => 1, "name" => "México", "capital" => "Distrito Federal");
$members = array(
	array("id" => 1, "name" => "México", "capital" => "Distrito Federal"),
	array("id" => 2, "name" => "Perú", "capital" => "Lima"),
	array("id" => 3, "name" => "Colombia", "capital" => "Bogotá"),
	array("id" => 4, "name" => "Argentina", "capital" => "Argentina"),
	array("id" => 5, "name" => "Guatemala", "capital" => "Guatemala")
);

if (isset($_GET["id"]) && intval($_GET["id"])) {
	$id = $_GET["id"] - 1;
	echo json_encode($members[$id]);
} else {
	echo json_encode($members);
}