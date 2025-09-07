<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Your Cart - MyShop</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: Arial, sans-serif; background:#34495e; min-height: 100vh; margin: 0; }
.header { background-color: #222; color: #fff; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
.header h2 { margin: 0; }
.nav a { color: #fff; margin-left: 20px; text-decoration: none; font-weight: bold; transition: color 0.2s ease; }
.nav a:hover { color: #ddd; }
.container { padding: 30px; max-width: 1000px; margin: auto; }
.cart-item { background:#fcb69f; display: flex; align-items: center; border: 1px solid #ddd; padding: 15px; margin-bottom: 15px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.05); }
.cart-item img { width: 80px; height: 80px; object-fit: cover; margin-right: 20px; border-radius: 4px; }
.item-details { flex: 1; }
.item-name { font-weight: bold; font-size: 1.1em; }
.item-price { color: #28a745; font-weight: bold; }
.empty-message { background: #000; color: #fff; padding: 15px; text-align: center; border-radius: 5px; border: 1px solid #ffeeba; }
footer { background-color: #222; color: #ccc; text-align: center; padding: 15px; margin-top: 40px; }
</style>
</head>
<body>

<div class="header">
    <h2>🛒 MyShop</h2>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="cart.jsp">Cart</a>
        <a href="orders.jsp">Orders</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="container">
    <h3>Your Cart</h3>
    <hr style="margin: 15px 0;">
<%
    String userId = (session.getAttribute("userId") != null) ? session.getAttribute("userId").toString() : null; 
    if (userId != null) {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "7780");

        PreparedStatement ps = con.prepareStatement(
            "SELECT p.pname, p.pprice, p.discount, p.image, p.free_delivery, p.rating, c.quantity " +
            "FROM cart c JOIN product p ON c.product_id = p.pid WHERE c.user_id = ?"
        );
        ps.setString(1, userId);
        ResultSet rs = ps.executeQuery();

        boolean hasItems = false;
        while (rs.next()) {
            hasItems = true;
            double price = rs.getDouble("pprice");
            double discount = rs.getDouble("discount");
            int qty = rs.getInt("quantity");

            double discountedPrice = price - (price * discount / 100.0);
            double totalPrice = discountedPrice * qty;
%>
    <div class="cart-item">
        <img src="<%=rs.getString("image")%>" alt="<%=rs.getString("pname")%>">
        <div class="item-details">
            <div class="item-name"><%=rs.getString("pname")%></div>
            <div>
                <% if(discount > 0){ %>
                    <span style="text-decoration: line-through; color: gray;">₹<%= price %></span>
                    <span class="item-price">₹<%= discountedPrice %></span> (<%= discount %>% off)
                <% } else { %>
                    <span class="item-price">₹<%= price %></span>
                <% } %>
                | Quantity: <%= qty %>
            </div>
            <div>Total: ₹<%= totalPrice %></div>
            <div>Free Delivery: <%= rs.getString("free_delivery").equalsIgnoreCase("Yes") ? "Yes" : "No" %></div>
            <div>Rating: <%= rs.getInt("rating") %> ★</div>
        </div>
    </div>
<%
        }
        if (!hasItems) {
%>
    <div class="empty-message">Your cart is empty.</div>
<%
        }
        con.close();
    } else {
%>
    <div class="empty-message">Please <a href="login.jsp">login</a> to view your cart.</div>
<%
    }
%>
</div>

<footer>
    &copy; 2025 MyShop. All rights reserved.
</footer>
</body>
</html>