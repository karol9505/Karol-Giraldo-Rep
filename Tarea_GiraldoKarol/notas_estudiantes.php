<?php
include "includes/connection.php";
$idCursos=$_POST['cursos'];
$idEstudiante=$_POST['estudiantes'];
$query= "SELECT * FROM estudiantes 
			INNER JOIN notas_estudiantes ON estudiantes.id_estudiantes = notas_estudiantes.id_estudiantes
			INNER JOIN notas             ON notas.id_notas             = notas_estudiantes.id_notas
			INNER JOIN cursos          ON cursos.id_cursos       = notas_estudiantes.id_cursos WHERE cursos.id_cursos=$idCursos AND estudiantes.id_estudiantes=$idEstudiante";
$resultQuery= mysqli_query($con,$query);


       /*e.nombre_estudiantes,e.codigo_estudiantes, e.id_estudiantes, en.id_estudiantes, n.id_notas, en.id_notas,c.id_cursos,en.id_cursos*/
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Notas del Estudiante</title>
	</head>
	<body>
	<table border="1">
	<tr>
       	<td> Nombre de la Nota </td>
       	<td> Nota </td>
       	<td> Porcentaje Nota</td>
       	<td> Calculo </td>
       </tr>
<?php
$incr=0;
$nombreEstudiante;

while($row= mysqli_fetch_array($resultQuery)){
	$nombre=$row['nombre_estudiantes'];
	$nombreCurso=$row['nombre_cursos'];
	echo"
      <tr>
          <td>".$row['nombre_notas']."</td>
          <td>".$row['valor']."</td>
          <td>".$row['porcentaje']."</td>
          <td>".$row['valor'] * $row['porcentaje']."</td>
      </tr>

	";
	$incr++;
	$arregloNotas[$incr]=$row['valor']*$row['porcentaje'];
}
?>
       

       </table>
       <?php
           echo $nombreCurso.":";
          if($idCursos==2){
          	echo $arregloNotas[1]+$arregloNotas[2];
          } else{
          	echo $arregloNotas[1]+$arregloNotas[2]+$arregloNotas[3];
          }
          echo "<br>";
          echo $nombre;
       ?>
	</body>
	</html>

