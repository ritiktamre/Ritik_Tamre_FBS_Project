package com.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
      
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		res.setContentType("text/plain");
		
		HttpSession session = req.getSession(false);
		if(session == null || session.getAttribute("userId")== null)
		{
			res.getWriter().write("Please login first.");
			return ;
		}
		
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		
		int productId = Integer.parseInt(req.getParameter("productId"));
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","7780"))
			{
				PreparedStatement pstmt = con.prepareStatement("select * from cart where user_id = ? and product_id = ?");
				pstmt.setInt(1, userId);
				pstmt.setInt(2, productId);
				
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					PreparedStatement update = con.prepareStatement("update cart set quantity = quantity + 1 where user_id = ? And product_id = ?");
					update.setInt(1, userId);
					update.setInt(2, productId);
					update.executeUpdate();
				}
				
				else
				{
					PreparedStatement insert = con.prepareStatement("insert into cart (user_id,product_id,quantity) values (?,?,1)"
							);
					
					insert .setInt(1, userId);
					insert.setInt(2, productId);
					insert.executeUpdate();
				}
				res.getWriter().write("Product Added to cart ! ");
			}
		}
		catch(Exception e )
		{
			res.getWriter().write("Error :"+e.getMessage());
		}
	}
}
