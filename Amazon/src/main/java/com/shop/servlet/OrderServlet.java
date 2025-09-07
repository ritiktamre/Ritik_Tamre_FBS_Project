package com.shop.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        String productId = req.getParameter("productId");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/shopping", "root", "7780")) {

                // check if already exists
                try (PreparedStatement check = con.prepareStatement(
                        "SELECT 1 FROM orders WHERE user_id = ? AND product_id = ?")) {
                    check.setInt(1, userId);
                    check.setString(2, productId);

                    try (ResultSet rs = check.executeQuery()) {
                        if (rs.next()) {
                            try (PreparedStatement update = con.prepareStatement(
                                    "UPDATE orders SET quantity = quantity + 1 WHERE user_id = ? AND product_id = ?")) {
                                update.setInt(1, userId);
                                update.setString(2, productId);
                                update.executeUpdate();
                            }
                        } else {
                            try (PreparedStatement insert = con.prepareStatement(
                                    "INSERT INTO orders (user_id, product_id, quantity, price, free_delivery, discount, rating, order_date, delivery_date) " +
                                    "SELECT ?, p.pid, 1, p.price, p.free_delivery, p.discount, p.rating, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY) " +
                                    "FROM product p WHERE p.pid = ?")) {
                                insert.setInt(1, userId);
                                insert.setString(2, productId);
                                insert.executeUpdate();
                            }
                        }
                    }
                }
            }
            res.getWriter().write("Product added to orders!");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("Something went wrong!");
        }
    }
}