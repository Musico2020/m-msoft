<html>
<head>
  <title>Problema</title>
</head>
<body>
  <?php
  $conexion = mysqli_connect("localhost", "root", "", "senam") or
    die("Problemas con la conexión");

  mysqli_query($conexion, "insert into cliente (nombre, correo, usuario, contraseña) values  
  ('$_REQUEST[nombre]','$_REQUEST[correo]','$_REQUEST[usuario]','$_REQUEST[contraseña]')") or die("Problemas en el select" . mysqli_error($conexion));
  
  echo "CLIENTE REGISTRADO EXITOSAMENTE";

  mysqli_close($conexion);
  ?>
</body>
</html>