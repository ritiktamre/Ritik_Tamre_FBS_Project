<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    // Invalidate the current session
    session.invalidate();

    // Redirect to home page
    response.sendRedirect("index.jsp");
%>
    
