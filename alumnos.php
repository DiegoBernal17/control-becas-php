<?php
require_once 'cabecera.php';
?>
  <div class="box">
    <div class="boxHeader">Alumnos</div>
    <table style="width:100%">
      <tr>
        <th>No. Control</th>
        <th>Nombre completo</th> 
        <th>Especialidad</th>
        <th>Total becas</th>
      </tr>
      <?php
      $sql = mysqli_query($link, "SELECT a.*, e.nombre AS especialidad FROM alumnos a INNER JOIN especialidades e ON e.clave_especialidad = a.especialidad LIMIT 100");
      
      while($row = mysqli_fetch_array($sql)) {
        $sql2 = mysqli_query($link, "SELECT * FROM becas WHERE num_control = '".$row['num_control']."'");
        $count = mysqli_num_rows($sql2);
      ?>
      <tr>
        <td><?php echo $row['num_control']; ?></td>
        <td><a href="ver.php?alumno=<?php echo $row['num_control']; ?>"><?php echo $row['nombres'].' '.$row['apellido_paterno'].' '.$row['apellido_materno']; ?></a></td> 
        <td><?php echo $row['especialidad']; ?></td>
        <td><?php echo $count; ?></td>
      </tr>
      <?php } ?>
    </table>
  </div>
</body>
</html>