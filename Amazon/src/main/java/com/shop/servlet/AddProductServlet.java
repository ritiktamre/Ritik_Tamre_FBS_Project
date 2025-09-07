package com.shop.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/addproduct")
public class AddProductServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
	{
		String pname=req.getParameter("pname");
		String ptype=req.getParameter("ptype");
		String pinfo=req.getParameter("pinfo");
		String pprice= req.getParameter("pprice");
		String qtyParam=req.getParameter("pquantity");
		Integer pquantity = (qtyParam != null && !qtyParam.isEmpty()) ? Integer.parseInt(qtyParam): 0;
	    
		String image = req.getParameter("image");
		
		String freeDelivery =  req.getParameter("freeDelivery");
		String discount = req.getParameter("discount");
		String rating = req.getParameter("rating");
		
		  
	     try {
	    	 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "7780");
			 
			  Statement st = con.createStatement();
	            ResultSet rs1 = st.executeQuery("SELECT DATABASE()");
	            if (rs1.next()) {
	                System.out.println("✅ Connected to DB: " + rs1.getString(1));
	            }

	            // 🔍 Debug: check product table columns
	            ResultSet rs2 = st.executeQuery("SHOW COLUMNS FROM product");
	            System.out.println("📌 Columns in product table:");
	            while (rs2.next()) {
	                System.out.println(" - " + rs2.getString("Field"));
	            }
			 
			 PreparedStatement ps=con.prepareStatement("Insert into product (pname, ptype, pinfo, pprice, pquantity, image) values (?,?,?,?,?,?)");
			 ps.setString(1, pname);
			 ps.setString(2, ptype);
			 ps.setString(3, pinfo);
			 ps.setString(4, pprice);
			 ps.setInt(5, pquantity);
			 ps.setString(6, image);
			 ps.setString(7, freeDelivery);
			 ps.setString(8, discount);
			 ps.setString(9, rating);
			 
			 
			 //System.out.println("Inserted product: " + pname + ", " + ptype + ", " + pinfo + ", " + pprice + ", " + pquantity + ", " + image);
			 
			  int rows = ps.executeUpdate();
			  System.out.println("Rows inserted = " + rows);
			  
	         
	      req.setAttribute("message", rows > 0 
	    		  ? "Product added successfully!" 
	    				  :  "Failed to add product.");
	    
	          
	            con.close();
	          
	     	} 
	     	catch (Exception e) 
	     	{
	     		e.printStackTrace();
	            req.setAttribute("message", "Error: " + e.getMessage());
	        }

	        RequestDispatcher rd = req.getRequestDispatcher("addproduct.jsp");
	        rd.forward(req, res);

	     
	}

}
