<?php

//Datos de Conexion//

$host="localhost";
$user="root";
$password="";
$db="mibasedatos";
//Creo una variable conexión//
$con=mysqli_connect($host,$user,$password)or die("problemas al conectar");
//Selecciono la base de datos//
mysqli_select_db($con,$db)or die("probelmas al seleccionar la base de datos");

//Para hacer cualquier consulta, se crea un nuevo archibvo php y se pone la siguiente sentencia
//para consulta : include 'connection.php'
?>