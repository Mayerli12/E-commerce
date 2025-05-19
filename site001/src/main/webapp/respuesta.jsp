<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Patitas felices</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

    <h1 class="titulo">Patitas Felices</h1>

    <main>
        <header>
            <h1>E-commerce</h1>
            <img src="imagenes/tienda.jpeg" alt="imagen de tienda" height="100" class="imagen-tienda"/>
            <h2 class="destacado">Productos para tus mascotas</h2>
            <h4 id="favorito">Amor y cuidado</h4>
        </header>

        <nav>
            <a href="consulta.jsp">Ver Productos</a>
            <a href="categoria.jsp">Buscar Por Categoria</a>
            <a href="login.jsp">Login</a>
        </nav>
<div class="contenedor-respuesta">
    <h2>Resumen de Registro</h2>
    <p><strong>Nombre:</strong> <%= request.getParameter("txtNombre") %></p>
    <p><strong>Cédula:</strong> <%= request.getParameter("txtCedula") %></p>
    <p><strong>Correo Electrónico:</strong> <%= request.getParameter("txtCorreo") %></p>
    <p><strong>Estado Civil:</strong> <%= request.getParameter("cmbECivil") %></p>
    <p><strong>Lugar de Residencia:</strong> <%= request.getParameter("rdResidencia") %></p>
    <p><strong>Foto Seleccionada:</strong> <%= request.getParameter("fileFoto") %></p>
    <p><strong>Mes y Año de Nacimiento:</strong> <%= request.getParameter("fecha") %></p>
    <p><strong>Color Favorito:</strong> <font color="<%= request.getParameter("colorFavorito") %>">Este es tu color favorito</font></p>

    <div class="buttons">
        <a href="registro.jsp"><button type="button">Regresar al Registro</button></a>
    </div>
</div>
<footer>
    <ul>
      <li><a href="https://www.facebook.com">
        <img src="iconos/facebook1.png" width="60" height="60" alt="imagen facebook"/></a>
      </li>
      <li><a href="https://www.instagram1.com">
        <img src="iconos/instagram1.png" width="60" height="60" alt="imagen instagram"/></a>
      </li>
      <li><a href="https://www.tiktok1.com">
        <img src="iconos/tiktok.png" width="60" height="60" alt="imagen tiktok"/></a>
      </li>
    </ul> 
  </footer>
</body>
</html>