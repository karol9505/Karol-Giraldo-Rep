<?php 
	include 'includes/connection.php'; //INCLUYO ARCHIVO DE CONEXIÓN
	$query = "SELECT * FROM cursos ORDER BY id_cursos ASC";
	$resultQuery = mysqli_query($con,$query);
?>

<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
	<form action="consulta_materias.php" method ="post">
	<select name="cursos">
	<?php
	while ($row= mysqli_fetch_array($resultQuery)){
		
		echo"<option value=' ".$row['id_cursos']."'>".$row['nombre_cursos']."</option>";

		}
	
		?>

	</select>
	<input type="submit" value="Enviar">
	</form>
	</body>
	</html>