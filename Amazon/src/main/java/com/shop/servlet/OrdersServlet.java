package com.shop.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        List<Map<String, Object>> orders = new ArrayList<>();

        String sql =
            "SELECT o.order_id, p.pname, p.image AS image_path, p.pprice AS price, " +
            "o.quantity, o.free_delivery, o.discount, o.rating, " +
            "o.order_date, o.delivery_date " +
            "FROM orders o " +
            "JOIN product p ON o.product_id = p.pid " +
            "WHERE o.user_id = ? " +
            "ORDER BY o.order_date DESC";

        try {
            // driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("MySQL JDBC driver not found", e);
        }

        // add serverTimezone param if needed for your MySQL config
        String url = "jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC";
        String dbUser = "root";
        String dbPass = "7780";

        try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> order = new HashMap<>();
                    order.put("order_id", rs.getInt("order_id"));
                    order.put("pname", rs.getString("pname"));
                    // image_path is varchar in your schema -> getString
                    order.put("image", rs.getString("image_path"));
                    order.put("price", rs.getDouble("price"));
                    order.put("quantity", rs.getInt("quantity"));

                    // null-safe reads
                    boolean freeDelivery = rs.getObject("free_delivery") != null && rs.getBoolean("free_delivery");
                    int discount = rs.getObject("discount") != null ? rs.getInt("discount") : 0;
                    int rating = rs.getObject("rating") != null ? rs.getInt("rating") : 0;

                    order.put("free_delivery", freeDelivery);
                    order.put("discount", discount);
                    order.put("rating", rating);
                    order.put("order_date", rs.getTimestamp("order_date"));
                    order.put("delivery_date", rs.getDate("delivery_date"));

                    orders.add(order);
                }
            }

        } catch (SQLException e) {
            // print to server logs for debugging and rethrow so container shows stacktrace
            e.printStackTrace();
            throw new ServletException(e);
        }

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("orders.jsp").forward(req, res);
    }
}