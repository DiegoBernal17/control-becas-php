<?php
require_once 'cabecera.php';
?>
  <div class="box">
    <div class="boxHeader">Todas las becas dadas</div>
    <table style="width:100%">
        <tr>
          <th>Tipo beca</th>
          <th>Alumno dado</th>
          <th>Fecha inicio</th>
          <th>Fecha finaliza</th>
          <th>Estado</th>
        </tr>
        <?php
        $sql = mysqli_query($link, "SELECT * FROM becas");
        while($row = mysqli_fetch_array($sql)) {
        ?>
        <tr>
          <td><a href="ver.php?beca=<?php echo $row['clave_tipo_beca'] ?>"><?php echo $row['clave_tipo_beca']; ?></a></td>
          <td><?php echo $row['num_control']; ?></td> 
          <td><?php echo $row['fecha_inicio']; ?></td>
          <td><?php echo $row['fecha_vencimiento']; ?></td>
          <td><?php echo $row['estatus']; ?></td>
        </tr>
        <?php } ?>
      </table>
  </div>
</body>
</html>