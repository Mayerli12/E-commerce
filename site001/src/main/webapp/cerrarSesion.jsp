<%@ page session="true" %>
<%
    HttpSession sesionOk = request.getSession();
    sesionOk.invalidate(); // Invalidamos la sesi�n
%>
<jsp:forward page="login.jsp"/>
