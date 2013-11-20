<?php
$member = array("id" => 1, "name" => "Sebastian", "age" => 24);
$members = array(
	array("id" => 1, "name" => "Sebastian", "age" => 24),
	array("id" => 2, "name" => "Ismael", "age" => 25),
	array("id" => 3, "name" => "Aldo", "age" => 23),
	array("id" => 4, "name" => "Nancy", "age" => 27),
	array("id" => 5, "name" => "Julio", "age" => 23),
	array("id" => 6, "name" => "Kernel", "age" => 5),
	array("id" => 7, "name" => "Centos", "age" => 2)
);

if (isset($_GET["id"]) && intval($_GET["id"])) {
	$id = $_GET["id"] - 1;
	echo json_encode($members[$id]);
} else {
	echo json_encode($members);
}