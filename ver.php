<?php
require_once 'cabecera.php';
echo '<div class="box">';
if(isset($_GET['alumno']) && $_GET['alumno'] != '') {
  $matricula = mysqli_real_escape_string($link, $_GET['alumno']);
  $sql = mysqli_query($link, "SELECT a.*, e.nombre as nombre_estado FROM alumnos a INNER JOIN estados e ON e.clave_estado = a.estado WHERE num_control = '$matricula' LIMIT 1");
  $exite = mysqli_num_rows($sql);
  if($exite > 0) {
    $datos = mysqli_fetch_array($sql);
?>
  <div class="boxHeader"><?php echo $datos['nombres'].' '.$datos['apellido_paterno'].' '.$datos['apellido_materno']; ?></div>
  <?php 
    echo '<b>Número de control:</b> '.$datos['num_control'].'<br>';
    echo '<b>Especialidad:</b> '.$datos['especialidad'].'<br>';
    echo '<b>Fecha de nacimiento:</b> '.$datos['fecha_nacimiento'].'<br>';
    echo '<b>Correo:</b> '.$datos['correo'].'<br>';
    echo '<b>Teléfono:</b> '.$datos['telefono'].'<br>';
    echo '<b>Dirección:</b> '.$datos['direccion'].'<br>';
    echo '<b>Colonia:</b> '.$datos['colonia'].'<br>';
    echo '<b>Municipio:</b> '.$datos['municipio'].'<br>';
    echo '<b>Estado:</b> '.$datos['nombre_estado'].'<br>'; ?>
  </div>
  <div class="box">
    <div class="boxHeader">Beca(s) dada(s) a <?php echo $datos['nombres']; ?></div>
    <table style="width:100%">
        <tr>
          <th>Tipo beca</th>
          <th>Alumno dado</th>
          <th>Fecha inicio</th>
          <th>Fecha finaliza</th>
          <th>Estado</th>
        </tr>
        <?php
        $sql = mysqli_query($link, "SELECT * FROM becas WHERE num_control = '".$datos['num_control']."'");
        while($row = mysqli_fetch_array($sql)) {
        ?>
        <tr>
          <td><?php echo $row['clave_tipo_beca']; ?></td>
          <td><?php echo $row['num_control']; ?></td> 
          <td><?php echo $row['fecha_inicio']; ?></td>
          <td><?php echo $row['fecha_vencimiento']; ?></td>
          <td><?php echo $row['estatus']; ?></td>
        </tr>
        <?php } ?>
      </table>
  </div>

<?php 
  } else { 
    echo '<h1 style="color:red">El alumno no existe.</h1>'; 
  }
} else if(isset($_GET['beca']) && $_GET['beca'] != '') {
  $beca = mysqli_real_escape_string($link, $_GET['beca']);
  $sql = mysqli_query($link, "SELECT t.*, i.nombre_institucion FROM tipos_becas t INNER JOIN institucion i ON i.clave_institucion = t.clave_institucion WHERE clave_tipo_beca = '$beca' LIMIT 1");
  $exite = mysqli_num_rows($sql);
  if($exite > 0) {
    $datos = mysqli_fetch_array($sql);
?>
  <div class="boxHeader"><?php echo $datos['nombre_beca']; ?></div>
  <?php 
    echo '<b>Clave del tipo de beca:</b> '.$datos['clave_tipo_beca'].'<br>';
    echo '<b>Descripción:</b> '.$datos['descripcion'].'<br>';
    echo '<b>Institución:</b> '.$datos['nombre_institucion'].'<br>';
    echo '<b>Clave institucion:</b> '.$datos['clave_institucion'].'<br>';
    echo '<b>Fecha de creación:</b> '.$datos['fecha_creacion'].'<br>'; 

  } else { 
    echo '<h1 style="color:red">La beca no exite no existe.</h1>'; 
  }
} ?>
  </div>
</body>
</html>