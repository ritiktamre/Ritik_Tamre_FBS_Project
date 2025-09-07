<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>

<style>
    * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #0d47a1;
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
            margin: 50px auto;
            background: #2c2c3e;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        form input[type="text"],
        form input[type="email"],
        form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #222;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        form input[type="submit"]:hover {
            background-color: #444;
        }

        .message {
            text-align: center;
            color: green;
            margin-top: 10px;
        }
        
        .success-card {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

        footer {
            background-color: #222;
            color: #ccc;
            text-align: center;
            padding: 15px;
            margin-top: 60px;
        }
    </style>
    
</head>
<body>

  <div class="header">
        <h2>🛒 MyShop</h2>
        <div class="nav">
            <a href="index.jsp">Home</a>
            <a href="login.jsp">Login</a>
        </div>
    </div>

<div class="container">
<h2>User Registration</h2>

<form action="register" method="post">
  Name:
  <input type="text" name="name" placeholder="Enter the name" required>

Email :
<input type="email" name="email" placeholder="Enter the email" required>

Password :
<input type="password" name="password" placeholder="Enter the password" required>

<input type="submit" value="Register">
</form>

  <p class="message">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </p>
</div>

<footer>
       &copy; 2025 Myshop. All rights reserved. 
</footer>


</body>
</html>