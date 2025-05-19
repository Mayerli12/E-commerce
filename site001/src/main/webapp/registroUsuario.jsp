<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="true" import="com.productos.negocio.*"%>
<%
    // Verifica si el usuario está logueado
    HttpSession sesion = request.getSession();
    String usuario = null;
    int perfil = 0;

    if (sesion.getAttribute("usuario") == null) { 
        // Si no está logueado, redirige al login
        response.sendRedirect("login.jsp");
    } else {
        usuario = (String) sesion.getAttribute("usuario");
        perfil = (Integer) sesion.getAttribute("perfil");
        
        // Solo el administrador (perfil 2) puede registrar usuarios
        if (perfil != 2) {
            out.println("Acceso no permitido.");
            return;  // Si no es administrador, bloquea el acceso
        }
    }

    // Verificar el registro si se envía el formulario
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String contraseña = request.getParameter("contraseña");
    String perfilNuevo = request.getParameter("perfil");
    String estadoCivil = request.getParameter("estadoCivil");

    if (nombre != null && correo != null && contraseña != null && perfilNuevo != null && estadoCivil != null) {
        // Lógica para registrar el nuevo usuario
        Usuario nuevoUsuario = new Usuario();
        boolean registroExitoso = nuevoUsuario.registrarUsuario(nombre, correo, contraseña, Integer.parseInt(perfilNuevo), estadoCivil);

        if (registroExitoso) {
            response.sendRedirect("Menu.jsp");  // Redirigir al menú si el registro fue exitoso
            return;
        } else {
            request.setAttribute("error", "Hubo un problema al registrar al usuario.");
        }
    }
%>

<h2>Registrar Nuevo Usuario</h2>

<form action="registrarUsuario.jsp" method="post">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" required/><br/><br/>
    
    <label for="correo">Correo:</label>
    <input type="email" name="correo" id="correo" required/><br/><br/>
    
    <label for="contraseña">Contraseña:</label>
    <input type="password" name="contraseña" id="contraseña" required/><br/><br/>
    
    <label for="perfil">Perfil:</label>
    <select name="perfil" id="perfil" required>
        <option value="1">Empleado</option>
        <option value="2">Administrador</option>
    </select><br/><br/>

    <label for="estadoCivil">Estado Civil:</label>
    <select name="estadoCivil" id="estadoCivil" required>
        <option value="soltero">Soltero</option>
        <option value="casado">Casado</option>
        <option value="viudo">Viudo</option>
        <option value="divorciado">Divorciado</option>
    </select><br/><br/>
    
    <input type="submit" value="Registrar Usuario"/>
</form>

<%-- Aquí, si ya hay un error (por ejemplo, si hubo un problema al registrar), lo mostramos --%>
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
        out.println("<p style='color:red;'>" + error + "</p>");
    }
%>
 