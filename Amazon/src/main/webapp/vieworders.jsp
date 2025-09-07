<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
    <%
    // Check if admin is logged in
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
    
    
    
<!DOCTYPE html>
<html>
<head>

<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
  rel="stylesheet">
  
<meta charset="ISO-8859-1">
<title>Orders List - Admin</title>

<style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f7f7f7; }

        .header {
            background-color: #222;
            color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h2 { margin: 0; }
        .nav a {
            color: #fff;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.2s ease;
        }
        .nav a:hover { color: #ddd; }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            background: #fff;
            padding: 20px 30px;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        h2 { margin-bottom: 20px; color: #FFFFFF; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th { background-color: #222; color: #fff; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .no-data { text-align: center; padding: 15px; color: #777; }

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
        <h2>All Orders</h2>
        <table>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Order Date</th>
                <th>Delivery Date</th>
            </tr>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/shopping", "root", "7780"
                    );
                    stmt = conn.createStatement();
                    String sql = "SELECT id, user_id, product_id, quantity, order_date, delivery_date FROM orders";
                    rs = stmt.executeQuery(sql);

                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("user_id") %></td>
                            <td><%= rs.getString("product_id") %></td>
                            <td><%= rs.getInt("quantity") %></td>
                            <td><%= rs.getDate("order_date") %></td>
                            <td><%= rs.getDate("delivery_date") %></td>
                        </tr>
            <%
                    }
                    if (!hasData) {
            %>
                        <tr>
                            <td colspan="6" class="no-data">No orders found.</td>
                        </tr>
            <%
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    try { if(rs != null) rs.close(); } catch(Exception e) {}
                    try { if(stmt != null) stmt.close(); } catch(Exception e) {}
                    try { if(conn != null) conn.close(); } catch(Exception e) {}
                }
            %>
        </table>
    </div>

    <footer>
        &copy; 2025 MyShop. All rights reserved.
    </footer>
            
</body>
</html>