package com.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/auth")
public class LoginServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role = req.getParameter("role");
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","7780");
		    String query = "select * from users where email=? and password=?";
			
			PreparedStatement pstmt = con.prepareStatement(query); 
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
		//	pstmt.setString(3, role);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//Successful Login
				HttpSession session = req.getSession();
				session.setAttribute("userId", rs.getInt("id"));
				session.setAttribute("userName", rs.getString("name"));
				session.setAttribute("userEmail", email);
			//	session.setAttribute("role", rs.getString("role"));
				
				res.sendRedirect("index.jsp");  
			}
			else
			{
				req.setAttribute("message","Invalid email or password");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, res);
			}
			
			
			con.close();
		}
		
		catch(Exception e)
		{
			 req.setAttribute("message", "Error: " + e.getMessage());
	            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
	            rd.forward(req, res);
		}
	}

}
