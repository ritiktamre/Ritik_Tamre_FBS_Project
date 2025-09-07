package com.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewcust")
public class ViewcustomersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<String[]> customers = new ArrayList<>();

        String url = "jdbc:mysql://localhost:3306/shopping";
        String user = "root";
        String password = "7780";

        String sql = "SELECT id, name, email FROM users WHERE role = 'user' ";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection(url, user, password);
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    String[] userData = new String[3];
                    userData[0] = rs.getString("id");
                    userData[1] = rs.getString("name");
                    userData[2] = rs.getString("email");
                    customers.add(userData);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("customersList", customers);
        RequestDispatcher rd = req.getRequestDispatcher("viewcustomers.jsp");
        rd.forward(req, res);

    }
}
