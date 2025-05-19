<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
  <title>Patitas Felices</title>
  <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
  <h1 class="titulo">Patitas Felices</h1>

  <main>
    <header>
      <h1>E-commerce</h1>
      <img src="imagenes/logo.jpg" alt="imagen de tienda" height="100" class="imagen-tienda"/>
      <h2 class="destacado">Productos para tus mascotas</h2>
      <h4 id="favorito">Amor y cuidado</h4>
    </header>

    <div class="cuadro-navegacion">
      <nav>
        <a href="consulta.jsp">Ver Productos</a>
        <a href="categoria.jsp">Buscar Por Categoria</a>
        <a href="login.jsp">Login</a>
      </nav>
    </div>
   <header>
        <h1>Página de Consulta</h1>
    </header>
    <%
    	Product pr=new Product();
    	out.print(pr.consultarTodo());
    %>
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