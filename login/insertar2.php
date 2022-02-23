<html>
<head>
  <title>Problema</title>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
  <?php
  $conexion = mysqli_connect("localhost", "root", "", "senam") or die("Problemas con la conexión");
  
  mysqli_query($conexion, "insert into cliente (nombre,correo,usuario,contrasena) values 
     ('$_REQUEST[nombre]','$_REQUEST[email]','$_REQUEST[usuario]','$_REQUEST[clave]')")
    or die("Problemas en la insercion" . mysqli_error($conexion));
  mysqli_close($conexion);
  {
    echo "<script>
    alert('GUARDADO EXITOSAMENTE');
    window.location= 'index.html'
</script>";
}
  ?>
</body>
</html>