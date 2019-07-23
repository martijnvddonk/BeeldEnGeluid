<?php
require "vendor/autoload.php";
Predis\Autoloader::register();

$parameters = array(
    "scheme" => "tcp",
    "host" => "localhost",
    "port" => "6379",
    "password” => “secretpassword",
	"persistent" => "1");

$redis = new Predis\Client($parameters);
	
echo "Connected to Redis\n\n";
$redis->set("foo2", "bar");
$redis->incr("foo");
$value = $redis->get("foo");
var_dump($value);
?>