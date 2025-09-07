<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
  rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Add Product - MyShop</title>
<style>
      
      * {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
}

.header {
	background-color: #222;
	color: #fff;
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header h2 {
	margin: 0;
}

.nav a {
	color: #fff;
	margin-left: 20px;
	text-decoration: none;
	font-weight: bold;
	transition: color 0.2s ease;
}

.nav a:hover {
	color: #ddd;
}

.container {
	max-width: 500px;
	margin: 40px auto;
	background: #fff;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 6px;
}

input[type="text"], input[type="number"], input[type="file"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	width: 100%;
	background-color: #222;
	color: #fff;
	padding: 10px;
	border: none;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.2s ease;
}

input[type="submit"]:hover {
	background-color: #444;
}

.message {
	color: green;
	text-align: center;
	margin-top: 15px;
}

footer {
	background-color: #222;
	color: #ccc;
	text-align: center;
	padding: 15px;
	margin-top: 40px;
}

.success-card {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

</style>
</head>
<body>

          <!-- Header -->
	<div class="header">
		<h2>🛒 MyShop - Admin Panel</h2>
		<div class="nav">
			<a href="admin.jsp">Dashboard</a> 
			<a href="logout.jsp">Logout</a>
		</div>
	</div>
	
	<!-- Form -->
	<div class="container">
		<h2>Add Product</h2>
		<form action="addproduct" method="post" >

			<label>Product Name:</label> 
			<input type="text" name="pname" required>
			
			<label>Category:</label> 
			<input type="text" name="ptype" required>
			
			<label>Product Info:</label>
			 <input type="text" name="pinfo" required>
			 
			<label>Price (₹):</label>
			 <input type="number" step="0.01" name="pprice" required> 
			 
		 	<label>Quantity:</label> 
		 	<input type="number" name="pquantity" required>
		 	
 			<label>Image URL:</label>
 			<input type="text" name="image" placeholder="https://example.com/image.jpg" required>
 			 
 			<input type="submit" value="Add Product">
		</form>

		<p class="message">
			<%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
		</p>
	</div>

	<!-- Footer -->
	<footer> &copy; 2025 MyShop. All rights reserved. </footer>
	
</body>
</html>