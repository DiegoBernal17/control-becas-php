<?php
require_once 'cabecera.php';
?>
  <div class="box">
  <div class="boxHeader">Dar beca</div>

    <?php if(isset($_POST) && $_GET["agregar"] == "si") {

      $alumno = mysqli_real_escape_string($link, $_POST['alumno']);
      $tipo = mysqli_real_escape_string($link, $_POST['tipo']);
      $fecha_inicio = mysqli_real_escape_string($link, $_POST['fecha_inicio']);
      $fecha_finaliza = mysqli_real_escape_string($link, $_POST['fecha_finaliza']);
      $estatus = mysqli_real_escape_string($link, $_POST['estatus']);

      echo $alumno;
      echo $tipo;
      echo $fecha_inicio;
      echo $fecha_finaliza;
      echo $estatus;
      if(mysqli_query($link, "INSERT INTO `becas` (`id_beca`, `num_control`, `clave_tipo_beca`, `fecha_inicio`, `fecha_vencimiento`, `estatus`) VALUES (NULL, '$alumno', '$tipo', '$fecha_inicio', '$fecha_finaliza', '$estatus');"))
        echo '<div class="msg-success">hola</div>'; 
    } ?>

    <form method="POST" action="nueva.php?agregar=si">
      Alumno para la beca:
      <select name="alumno">
        <?php 
        $sql = mysqli_query($link, "SELECT num_control, apellido_paterno, apellido_materno, nombres FROM alumnos");
        while($row = mysqli_fetch_array($sql)) {
          echo '<option value="'.$row['num_control'].'">'.$row['apellido_paterno'].' '.$row['apellido_materno'].' '.$row['nombres'].'</option>';
        }
        ?>
      </select><br>
      Clave tipo de beca:
      <select name="tipo">
        <?php 
        $sql = mysqli_query($link, "SELECT clave_tipo_beca FROM becas");
        while($row = mysqli_fetch_array($sql)) {
          echo '<option value="'.$row['clave_tipo_beca'].'">'.$row['clave_tipo_beca'].'</option>';
        }
        ?>
      </select><br>
      Fecha de inicio
      <input type="date" name="fecha_inicio" value="<?php echo date("o-m-d"); ?>" min="<?php echo date("o-m-d"); ?>" required><br>
      Fecha de finalización
      <input type="date" name="fecha_finaliza" value="<?php echo date("o-m-d"); ?>" min="<?php echo date("o-m-d"); ?>" required><br>
      Estado:
      <select name="estatus">
        <option value="0">Activa</option>
        <option value="1">Inactiva</option>
      </select><br>
      <button class="btn-green">Dar beca ahora</button>
    </form>
  </div>
</body>
</html>