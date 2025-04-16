<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro Nuevo cliente</title>
	
	
</head>
<body>
<h3>Registro nuevo cliente</h3>
	<form action= "respuesta.jsp" method="post">
	<table border ="1">
	<tr><td>Nombre</td><td><input type="text" name="txtNombre"/></td></tr>
	<tr><td>Cedula</td><td><input type="text" name="txtCedula" maxLength="10"/></td></tr>
	
	<tr><td>Estado Civil</td>
	<td><select name="cmbECivil">
	<option value="Soltero">Soltero</option>
	<option value="Casado">Casado</option>
	<option value="Divorciado">Divorciado</option>
	<option value="Viudo">Viudo</option>
	</select></td></tr>
	<tr><td><input type="submit" name ="btnEnviar" id="btnEviar" value="Enviar Registro"/></td>
		<td><input type="submit" name ="btnEnviar" id="btnEviar" value="Restablecer"/></td></tr>
		</table>
	</form>
</body>
</html>