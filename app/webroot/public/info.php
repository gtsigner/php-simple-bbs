<?php
/**
 * Email:zhaojunlike@gmail.com
 * Date: 7/9/2017
 * Time: 11:06 AM
 */
use Docker\Docker;
use Docker\DockerClient;

require "../vendor/autoload.php";

//权限问题
$client = new DockerClient([
    'remote_socket' => 'unix:///var/run/docker.sock',
    'ssl' => false,
]);
$docker = new Docker($client);
$containers = $docker->getContainerManager()->findAll();
var_dump($containers);
