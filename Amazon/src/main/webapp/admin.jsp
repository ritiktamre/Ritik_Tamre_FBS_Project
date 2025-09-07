<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
  rel="stylesheet">
  
<meta charset="ISO-8859-1">
<title>Admin Login - MyShop</title>

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
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #FFFFF;
        }

        label {
            font-weight: bold;
        }

        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #222;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s ease;
        }

        input[type="submit"]:hover {
            background: #444;
        }

        .message {
            color: red;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }

        footer {
            background-color: #222;
            color: #ccc;
            text-align: center;
            padding: 15px;
            margin-top: 50px;
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
       
        <div class="header">
        <h2>🛒 MyShop</h2>
        <div class="nav">
            <a href="index.jsp">Home</a>
            <a href="login.jsp">User Login</a>
        </div>
    </div>

    <div class="container">
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <input type="submit" value="Login">
        </form>

        <div class="message">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </div>
    </div>

    <footer>
        &copy; 2025 MyShop. All rights reserved.
    </footer>
       
</body>
</html>