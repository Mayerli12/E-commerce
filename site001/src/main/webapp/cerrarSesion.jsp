<%@ page session="true" %>
<%
    HttpSession sesionOk = request.getSession();
    sesionOk.invalidate(); // Invalidamos la sesión
%>
<jsp:forward page="login.jsp"/>
