<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Orders - MyShop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background-color: #f4a48c;
}
.table-container {
    width: 80%;
    margin: 30px auto;
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
</style>
</head>
<body>
    <div class="table-container">
        <h2 class="text-center">Your Orders</h2>
        <table class="table table-bordered table-hover text-center">
            <thead class="table-dark">
                <tr>
                    <th>Product</th>
                    <th>Price (₹)</th>
                    <th>Quantity</th>
                    <th>Discount (%)</th>
                    <th>Final Price (₹)</th>
                    <th>Free Delivery</th>
                    <th>Rating</th>
                    <th>Order Date</th>
                    <th>Delivery Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "7780");

                        String sql = "SELECT o.order_id, p.pname, p.pprice, o.quantity, p.discount, p.free_delivery, p.rating, o.order_date, o.delivery_date " +
                                     "FROM orders o JOIN product p ON o.product_id = p.pid";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();

                        while(rs.next()) {
                            String pname = rs.getString("pname");
                            double price = rs.getDouble("pprice");
                            int qty = rs.getInt("quantity");
                            double discount = rs.getDouble("discount");
                            int freeDelivery = rs.getInt("free_delivery");
                            double rating = rs.getDouble("rating");
                            Timestamp orderDate = rs.getTimestamp("order_date");
                            Date deliveryDate = rs.getDate("delivery_date");

                            // Final price calculation
                            double discountedPrice = price - (price * discount / 100.0);
                            double finalPrice = discountedPrice * qty;
                %>
                <tr>
                    <td><%= pname %></td>
                    <td>₹<%= price %></td>
                    <td><%= qty %></td>
                    <td><%= discount %>%</td>
                    <td>₹<%= finalPrice %></td>
                    <td><%= (freeDelivery == 1 ? "Yes" : "No") %></td>
                    <td><%= rating %> ★</td>
                    <td><%= orderDate %></td>
                    <td><%= deliveryDate %></td>
                </tr>
                <%
                        }
                        rs.close();
                        ps.close();
                        con.close();
                    } catch(Exception e) {
                        out.println("<tr><td colspan='9' class='text-danger'>Error: "+e.getMessage()+"</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>