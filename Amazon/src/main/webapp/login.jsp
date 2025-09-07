<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="java.util.List" import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
  <link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
  rel="stylesheet">
<meta charset="ISO-8859-1">
<title>User Login</title>

 <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

  /*       body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        } */
        
         body {
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #42e695, #3bb2b8);
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
            background-color: #fff;
            padding: 30px;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        body {
    background: url('shopping-bg.jpg') no-repeat center center fixed;
    background-size: cover;
}

        input[type="submit"] {
            width: 100%;
            background-color: #222;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #444;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
        
         .login-box button:hover {
            background: #2c8f8f;
        }

        footer {
            background-color: #222;
            color: #ccc;
            text-align: center;
            padding: 15px;
            margin-top: 60px;
        }
        
     .login-box input:hover {
    border-color: #3bb2b8;  
    background-color: #f0f9f9;
    box-shadow: 0 0 5px #3bb2b8; 
}
        
        body {
    background: #ff5733; 
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
<a href="register.jsp">Register</a>
    </div>
</div>



<div class="container">
    <h2 class="welcome-text">Welcome to Login Page</h2>


<form action="auth" method="post">
<label for="email">Email :</label>
<input type="email" name="email" id="email" placeholder="Enter the Email" required><br><br>

<label for="password">password</label>
<input type="password" name="password" id="password" placeholder="Enter the Password" required><br>
<br>



<input type="submit" value="login">
</form>

 <%-- Show login message if any --%>
    <%
        String msg = (String) request.getAttribute("message");
        if (msg != null) {
    %>
        <p class="error"><%= msg %></p>
    <%
        }
    %>

</div>


<footer>
    &copy; 2025 MyShop. All rights reserved.
</footer>
</body>
</html>