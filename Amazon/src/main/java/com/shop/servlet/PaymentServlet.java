package com.shop.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        String productId = req.getParameter("productId"); // matches JSP field name
        double amount = Double.parseDouble(req.getParameter("amount"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "7780")) {
                con.setAutoCommit(false);

                // Insert into orders
                String insertOrder = "INSERT INTO orders (user_id, product_id, quantity, total,order_date, delivery_date) "
                                   + "VALUES (?, ?, 1, ?, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY))";
                PreparedStatement orderStmt = con.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
                orderStmt.setInt(1, userId);
                orderStmt.setString(2, productId);
                orderStmt.setInt(3,1);
                orderStmt.setDouble(3, amount);
                orderStmt.executeUpdate();

                ResultSet rs = orderStmt.getGeneratedKeys();
                int orderId = 0;
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }

                // Insert payment details
                String insertPayment = "INSERT INTO payment (order_id, user_id, amount, payment_method, payment_status) "
                                      + "VALUES (?, ?, ?, 'Card', 'PAID')";
                PreparedStatement payStmt = con.prepareStatement(insertPayment);
                payStmt.setInt(1, orderId);
                payStmt.setInt(2, userId);
                payStmt.setDouble(3, amount);
                payStmt.executeUpdate();

                con.commit();

                res.setContentType("text/html");
                res.getWriter().println(
                    "<!DOCTYPE html>" +
                    "<html>" +
                    "<head>" +
                    "<meta charset='UTF-8'>" +
                    "<title>Payment Successful</title>" +
                    "<style>" +
                    "body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; padding: 50px; }" +
                    ".container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 15px rgba(0,0,0,0.1); display: inline-block; }" +
                    "h2 { color: #28a745; }" +
                    "p { font-size: 16px; }" +
                    "a.button { display: inline-block; margin: 10px; padding: 10px 20px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; }" +
                    "a.button:hover { background-color: #0056b3; }" +
                    "</style>" +
                    "</head>" +
                    "<body>" +
                    "<div class='container'>" +
                    "<h2>✅ Payment Successful!</h2>" +
                    "<p>Your order ID is: <strong>" + orderId + "</strong></p>" +
                    "<a href='orders' class='button'>View Orders</a>" +
                    "<a href='index.jsp' class='button'>Continue Shopping</a>" +
                    "</div>" +
                    "</body>" +
                    "</html>"
                );

            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}
