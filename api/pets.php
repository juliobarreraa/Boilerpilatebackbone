<?php 

$pet = array("id" => 1, "name" => "Kernel", "raza" => "Chihuahua");

$pets = array(
	array("id" => 1, "name" => "Kernel", "raza" => "Chihuahua"),
	array("id" => 2, "name" => "Fooster", "raza" => "Ratonero"),
	array("id" => 3, "name" => "Tux", "raza" => "undefined"),
	array("id" => 4, "name" => "Centos", "raza" => "mugrosito")
);

if (isset($_GET["id"]) && ($id = intval($_GET["id"]))) {
	$id -= 1;
	echo json_encode($pets[$id]);
} else {
	echo json_encode($pets);
}