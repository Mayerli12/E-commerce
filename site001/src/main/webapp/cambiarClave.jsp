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
        
        // Solo empleados (perfil 1) o administradores (perfil 2) pueden cambiar la clave
        if (perfil != 1 && perfil != 2) {
            out.println("Acceso no permitido.");
            return;  // Si no es empleado ni administrador, bloquea el acceso
        }
    }

    // Verificar el cambio de clave si se envía el formulario
    String claveActual = request.getParameter("claveActual");
    String nuevaClave = request.getParameter("nuevaClave");
    String repetirClave = request.getParameter("repetirClave");

    if (claveActual != null && nuevaClave != null && repetirClave != null) {
        // Si las claves coinciden
        if (!nuevaClave.equals(repetirClave)) {
            request.setAttribute("error", "Las claves no coinciden.");
        } else {
            // Lógica para cambiar la clave
            Usuario usuarioObj = new Usuario();
            boolean claveValida = usuarioObj.verificarClave(usuario, claveActual);

            if (!claveValida) {
                request.setAttribute("error", "La clave actual es incorrecta.");
            } else {
                boolean cambioExitoso = usuarioObj.cambiarClave(usuario, nuevaClave, repetirClave);
                if (cambioExitoso) {
                    response.sendRedirect("Menu.jsp");  // Redirigir al menú si la clave fue cambiada
                    return;
                } else {
                    request.setAttribute("error", "Hubo un problema al cambiar la clave.");
                }
            }
        }
    }
%>

<h2>Cambio de Clave</h2>

<form action="cambiarClave.jsp" method="post">
    <label for="claveActual">Clave Actual:</label>
    <input type="password" name="claveActual" id="claveActual" required/><br/><br/>
    
    <label for="nuevaClave">Nueva Clave:</label>
    <input type="password" name="nuevaClave" id="nuevaClave" required/><br/><br/>
    
    <label for="repetirClave">Repetir Nueva Clave:</label>
    <input type="password" name="repetirClave" id="repetirClave" required/><br/><br/>
    
    <input type="submit" value="Cambiar Clave"/>
</form>

<%-- Aquí, si ya hay un error (por ejemplo, las claves no coinciden), lo mostramos --%>
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
        out.println("<p style='color:red;'>" + error + "</p>");
    }
%>
