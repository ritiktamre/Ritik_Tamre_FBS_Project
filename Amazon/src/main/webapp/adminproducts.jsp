<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <%@ page import="java.util.List" %>
<%@ page import="com.shop.servlet.Product" %>  
    
    <%
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminhome.jsp");
        return;
    }
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
         <div class="header bg-dark text-white p-3 d-flex justify-content-between">
        <h2>🛒 MyShop</h2>
        <div>
            <span>Welcome, <%= session.getAttribute("adminName") %></span>
            <a href="logout.jsp" class="btn btn-danger btn-sm ms-3">Logout</a>
        </div>
    </div>
    <div class="container">
        <h2 class="text-center mt-4">Admin Dashboard</h2>
        <h3 class="text-center mb-3">Product List</h3>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>PID</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Info</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products != null) {
                        for (Product p : products) {
                %>
                <tr>
                    <td><%=p.getPid()%></td>
                    <td><%=p.getPname()%></td>
                    <td><%=p.getPtype()%></td>
                    <td><%=p.getPinfo()%></td>
                    <td><%=p.getPprice()%></td>
                    <td><%=p.getPquantity()%></td>
                    <td><img src="<%=p.getImage()%>" width="50"></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>


</body>
</html>