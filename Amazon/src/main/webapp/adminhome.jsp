<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
    
   
%>
    
<!DOCTYPE html>
<html>
<head>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
  rel="stylesheet">
<meta charset="UTF-8">
<title>Admin Dashboard</title>

          <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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
            padding: 30px;
            max-width: 900px;
            margin: auto;
        }

        ul {
            list-style: none;
            margin-top: 20px;
        }

        ul li {
            background: #fff;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            transition: transform 0.2s ease;
        }

        ul li:hover {
            transform: translateY(-3px);
        }

        ul li a {
            text-decoration: none;
            color: #222;
            font-weight: bold;
        }

        footer {
            background-color: #222;
            color: #ccc;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
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
        <h2>🛒 MyShop - Admin Panel</h2>
     
        <div class="nav">
            <a href="adminproducts.jsp">Admin-DashBoard</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <div class="container">
        <h3>Welcome  <%= adminName %> (Admin)</h3>
        <ul>
            <li><a href="addproduct.jsp">➕ Add New Product</a></li>
            <li><a href="vieworders.jsp">📦 View All Orders</a></li>
            <li><a href="viewcustomers.jsp">© View All Customers</a>
        </ul>
    </div>

    <footer>
        &copy; 2025 MyShop Admin Dashboard. All rights reserved.
    </footer>
              
</body>
</html>