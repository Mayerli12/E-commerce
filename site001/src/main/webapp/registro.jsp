<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Usuario" %>
<%@ page import="com.productos.datos.Conexion" %>
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

<div class="login">
    <h2>Formulario de Registro</h2>
    <form action="respuesta.jsp" method="post">
        <!-- Nombre -->
        <div class="form-group">
            <label for="txtNombre">Nombre:</label>
            <input type="text" id="txtNombre" name="txtNombre" required>
        </div>

        <!-- Cédula -->
        <div class="form-group">
            <label for="txtCedula">Cédula:</label>
            <input type="text" id="txtCedula" name="txtCedula" maxlength="10" required>
        </div>

        <div class="form-group">
            <label for="txtCorreo">Correo Electrónico:</label>
            <input type="email" id="txtCorreo" name="txtCorreo" required>
        </div>


        <div class="form-group">
            <label for="txtContrasena">Contraseña:</label>
            <input type="password" id="txtContrasena" name="txtContrasena" required>
        </div>


        <div class="form-group">
            <label for="cmbECivil">Estado Civil:</label>
            <select name="cmbECivil" id="cmbECivil" required>
                <option value="Soltero">Soltero</option>
                <option value="Casado">Casado</option>
                <option value="Divorciado">Divorciado</option>
                <option value="Viudo">Viudo</option>
            </select>
        </div>


        <div class="form-group">
            <label for="rdResidencia">Lugar de Residencia:</label>
            <div class="radio-group">
                <input type="radio" name="rdResidencia" value="Sur"> Sur
                <input type="radio" name="rdResidencia" value="Norte"> Norte
                <input type="radio" name="rdResidencia" value="Centro"> Centro
            </div>
        </div>


        <div class="form-group">
            <label for="colorFavorito">Color Favorito:</label>
            <input type="color" name="colorFavorito">
        </div>


        <div class="form-group">
            <label for="fileFoto">Foto:</label>
            <input type="file" name="fileFoto" accept=".jpg, .jpeg, .png">
        </div>


        <div class="form-group">
            <label for="fecha">Mes y Año de Nacimiento:</label>
            <input type="month" name="fecha">
        </div>

        <div class="form-group buttons">
            <input type="submit" name="btnEnviar" value="Enviar Registro">
            <input type="reset" value="Limpiar">
        </div>
        
        <%
    if(request.getMethod().equalsIgnoreCase("POST")) {
        String nombre = request.getParameter("txtNombre");
        String cedula = request.getParameter("txtCedula");
        String correo = request.getParameter("txtCorreo");
        String contrasena = request.getParameter("txtContrasena");
        
        // Crear un nuevo objeto Usuario
        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setNombre(nombre);
        nuevoUsuario.setCedula(cedula);
        nuevoUsuario.setCorreo(correo);
        nuevoUsuario.setClave(contrasena);

        // Llamar al método para registrar el usuario
        String mensaje = nuevoUsuario.ingresarCliente();

        // Mostrar mensaje de éxito o error
        out.print("<script>alert('" + mensaje + "');</script>");
        
        if (mensaje.equals("Registro exitoso")) {
            // Redirigir al login después de registro exitoso
            response.sendRedirect("login.jsp");
        }
    }
%>
        
    </form>
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