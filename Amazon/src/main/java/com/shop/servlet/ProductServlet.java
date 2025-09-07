package com.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/shopping";
	
	private static final String JDBC_USER = "root";
	
	private static final String JDBC_PASS = "7780";
	
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
	
	ArrayList<Product> products = new ArrayList<Product>();
	
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (Connection con = DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASS)) {
			
			String sql ="select pid, pname, ptype, pinfo, pprice, pquantity, image,free_delivery,discount,rating from product";
			
			try (PreparedStatement pstmt =con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery()) 
			{
				while(rs.next())
				{
					 Product p = new Product();
                     p.setPid(rs.getInt("pid"));
                     p.setPname(rs.getString("pname"));
                     p.setPtype(rs.getString("ptype"));
                     p.setPinfo(rs.getString("pinfo"));
                     p.setPprice(rs.getDouble("pprice"));
                     p.setPquantity(rs.getString("pquantity"));
                     p.setImage(rs.getString("image"));
                     p.setFreeDelivery(rs.getBoolean("free_delivery"));
                     p.setDiscount(rs.getDouble("discount"));
                     p.setRating(rs.getDouble("rating"));
                     products.add(p);
				}
			}

		}
	}
	
	catch (Exception e) {
        e.printStackTrace();
	}
	
	req.setAttribute("products", products);
	
	  HttpSession session = req.getSession(false);
      if (session != null && session.getAttribute("adminName") != null) {
    	  req.setAttribute("products", products);
    	   req.getRequestDispatcher("adminhome.jsp").forward(req, res);
      }
      else
      {
    	  req.setAttribute("products", products);
    req.getRequestDispatcher("index.jsp").forward(req, res);
      }
 }
}