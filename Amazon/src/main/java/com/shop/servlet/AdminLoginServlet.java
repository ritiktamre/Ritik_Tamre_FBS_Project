package com.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet  extends HttpServlet{
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException 
	{
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		   try {
	            // 1. Load Driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // 2. Connection
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "7780");

	            // 3. Query (check user with role=admin)
	            String sql = "SELECT * FROM users WHERE email=? AND password=? AND role='admin'";
	            PreparedStatement pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, email);
	            pstmt.setString(2, password);

	            ResultSet rs = pstmt.executeQuery();

	            if (rs.next()) {
	                // ✅ Admin login successful
	                HttpSession session = req.getSession();
	               // session.setAttribute("adminName", rs.getString("name"));
	               // session.setAttribute("adminEmail", rs.getString("email"));
                       session.setAttribute("adminName", "admin");
	                
	                res.sendRedirect("adminhome.jsp"); // admin panel/home page
	            } else {
	                // ❌ Invalid credentials
	                req.setAttribute("message", "Invalid admin credentials!");
	                RequestDispatcher rd = req.getRequestDispatcher("adminhome.jsp");
	                rd.forward(req, res);
	            }

	            con.close();
	        } catch (Exception e) {
	            req.setAttribute("message", "Error: " + e.getMessage());
	            RequestDispatcher rd = req.getRequestDispatcher("adminlogin.jsp");
	            rd.forward(req, res);
	        }
		
	}

}
