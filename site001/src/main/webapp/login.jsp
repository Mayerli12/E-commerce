<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Patitas Felices - Iniciar sesión</title>
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
        </nav>

        <div class="login">
            <h2>Iniciar Sesión</h2>
            <form action="validarLogin.jsp" method="post">
                <div class="form-group">
                    <label for="usuario">Usuario:</label>
                    <input type="text" id="usuario" name="usuario" required>
                </div>

                <div class="form-group">
                    <label for="contrasena">Contraseña:</label>
                    <input type="password" id="contrasena" name="clave" required>
                </div>

                <div class="form-group buttons">
                    <button type="submit">Iniciar Sesión</button>
                    <a href="registro.jsp">
                        <button type="button">Registrarse</button>
                    </a>
                </div>
            </form>
        </div>
    </main>

    <footer>
        <ul>
            <li><a href="https://www.facebook.com">
                <img src="iconos/facebook1.png" width="60" height="60" alt="imagen facebook"/>
            </a></li>
            <li><a href="https://www.instagram1.com">
                <img src="iconos/instagram1.png" width="60" height="60" alt="imagen instagram"/>
            </a></li>
            <li><a href="https://www.tiktok1.com">
                <img src="iconos/tiktok.png" width="60" height="60" alt="imagen tiktok"/>
            </a></li>
        </ul>
    </footer>
</body>
</html>
