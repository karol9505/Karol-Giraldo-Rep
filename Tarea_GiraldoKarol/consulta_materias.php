
		<?php 
		include "includes/connection.php";
		$idCursos=$_POST['cursos'];
        $query= "SELECT ec.id_estudiantes, e.nombre_estudiantes, e.codigo_estudiantes FROM estudiantes_cursos AS ec, estudiantes AS e WHERE ec.id_estudiantes=e.id_estudiantes AND ec.id_cursos=".$idCursos;
        $resultQuery= mysqli_query($con,$query);

		while ($row = mysqli_fetch_array($resultQuery)) {
			echo "  
				<form action='notas_estudiantes.php' method='post'>
					<select name='estudiantes'>
						<option value='".$row['id_estudiantes']."'>".$row['nombre_estudiantes'] ."</option>
					</select>"

					." ".
					$row["codigo_estudiantes"]
					." ".

				
					"<select name='cursos'>
						<option value='".$idCursos."'></option>
					</select>"
					
					." ".
					
					"<input type='submit' value='Consulta Las Notas'>
				</form>
			"
			;
 		}
			
 ?>