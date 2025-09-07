package com.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		 String name = req.getParameter("name");
	        String email = req.getParameter("email");
	        String password = req.getParameter("password");

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "7780");
	            PreparedStatement ps = con.prepareStatement("insert into users (name, email, password) VALUES (?, ?, ?)");
	            ps.setString(1, name);
	            ps.setString(2, email);
	            ps.setString(3, password);

	            int rows = ps.executeUpdate();

	            if (rows > 0) {
	                req.setAttribute("message", "Registration successful!");
	                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
	                rd.forward(req, res);
	            } else {
	                req.setAttribute("message", "Failed to register.");
	                RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
	                rd.forward(req, res);
	            }

	        } catch (Exception e) {
	            req.setAttribute("message", "Error: " + e.getMessage());
	            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
	            rd.forward(req, res);
	        }
	}
}
