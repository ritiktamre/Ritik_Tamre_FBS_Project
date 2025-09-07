<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" %>
    
    <%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    List<String[]> viewcust = (List<String[]>) request.getAttribute("customersList");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<link
 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
  rel="stylesheet">
  
<meta charset="ISO-8859-1">
<title>Customer List - Admin</title>

    
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        .header {
            background-color: #222;
            color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h2 {
            margin: 0;
        }
        .nav a {
            color: #fff;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.2s ease;
        }
        .nav a:hover {
            color: #ddd;
        }
        .container {
            max-width: 900px;
            margin: 30px auto;
            background: #fff;
            padding: 20px 30px;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 20px;
            color: #FFFFFF;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #222;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .no-data {
            text-align: center;
            padding: 15px;
            color: #777;
        }
        footer {
            background-color: #222;
            color: #ccc;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
            font-size: 14px;
        }
        
        .success-card {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}
    </style>
    
</head>
<body>
             <div class="header">
        <h2>🛒 MyShop - Admin</h2>
        <div class="nav">
            <a href="adminhome.jsp">Dashboard</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>All Customers</h2>
        <table>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
            <%
                if (viewcust != null && !viewcust.isEmpty()) {
                    for (String[] user : viewcust) {
            %>
            <tr>
                <td><%= user[0] %></td>
                <td><%= user[1] %></td>
                <td><%= user[2] %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="3" class="no-data">No customers found.</td>
            </tr>
            <% } %>
        </table>
    </div>

    <footer>
        &copy; 2025 MyShop. All rights reserved.
    </footer>
    
</body>
</html>