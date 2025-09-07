<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    <%@ page import="java.text.DecimalFormat" %>
    <%@ page
	import="java.util.*, java.util.Base64, com.shop.servlet.Product"%>

  <h1 class="welcome-heading">Welcome to Ritik Tamre Amazon Page </h1>

    <%  
        List<Product> products =(List<Product>)request.getAttribute("products");
    if(products == null) {
    	response.sendRedirect("products");
    	return;
    }
    
     String user = (String) session.getAttribute("userName");
    List<String> images = Arrays.asList(
        /*     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR7iQWpGQhJ36qLRKiwNxpdPlo3BABkU3vAA&s",
            "https://img-cdn.publive.online/fit-in/1200x675/socialsamosa/media/post_banners/4Ysna3nyUtp7GfS6IOJB.jpg",
            "https://connect-assets.prosple.com/cdn/ff/arSl_KC_NBTo4bLxMXb_0cydpBri8UhLcdU5CbOEsZc/1628947035/public/2021-08/hp-banner-.jpg",
            "https://prod-cms-992382728807-ap-south-1.s3.ap-south-1.amazonaws.com/small_Fastrack_brand_Tab_banner_f45ba03b91.webp" */
        ); 
    %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Home - MyShop</title>
<style>


* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #cce0ff 0%, #e6f7ff 50%, #f9f0ff 100%);
            min-height: 100vh;
        }

        /* Welcome Heading */
        .welcome-heading {
            text-align: center;
            font-size: 40px;
            font-weight: bold;
            color: #ff5733;
            margin: 20px 0;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.3);
        }

        /* Header */
        header {
            background: #222;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h2 {
            margin: 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
            transition: color 0.2s ease;
        }

        nav a:hover {
            color: #ddd;
        }

        /* Product Grid */
        main {
            max-width: 1200px;
            margin: auto;
            padding: 30px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }

        .product {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 0 0 50px 50px; /* Bottom radius */
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .product:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .product img {
            width: 100%;
            height: 180px;
            object-fit: contain;
            border-radius: 8px;
            margin-bottom: 10px;
            background: #fafafa;
        }

        .product h3 {
            font-size: 1.4em;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 8px;
            text-transform: capitalize;
            letter-spacing: 0.6px;
            position: relative;
            display: inline-block;
        }

        .product h3::after {
            content: "";
            display: block;
            width: 0;
            height: 2px;
            background: #ff9800;
            transition: width 0.3s;
            margin-top: 3px;
        }

        .product h3:hover::after {
            width: 100%;
        }

        .product .desc {
            font-size: 0.95em;
            color: #444;
            margin-bottom: 12px;
            font-style: italic;
            line-height: 1.4;
            min-height: 45px;
        }

        .stock {
            color: #28a745;
            font-weight: 600;
            font-size: 0.9em;
            margin-bottom: 8px;
        }

        .price {
            font-weight: bold;
            color: #d32f2f;
            font-size: 1.2em;
            margin-bottom: 12px;
            background: #fff3f3;
            padding: 4px 10px;
            border-radius: 6px;
            display: inline-block;
        }

        button {
            background: #ff9800;
             border: 1px solid #ff5733; 
            padding: 8px 14px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9em;
            margin: 4px;
            transition: background 0.2s ease;
        }

        button:hover {
            background: #e68900;
        }

        .button2 {
            background-color: #008000;
        }

        .button2:hover {
            background: #086623;
        }

        footer {
            background-color: #222;
            color: #ccc;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
            border-top: 1px solid #444;
        }
        
        .product {
    background-color: #ffe0b3; /* apna pasand ka color */
    border-radius: 0 0 30px 30px; 
     border: 2px solid #ff5733; 
     
    padding: 15px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.success-card {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}


.rating {
    color: #ff9800;
    font-weight: bold;
}
.discount-badge {
    background: #d32f2f;
    color: white;
    padding: 2px 6px;
    border-radius: 4px;
    font-size: 0.85em;
    margin-left: 5px;
}


.badge {
  display: inline-block;
  padding: 6px 12px;
  border-radius: 20px;
  font-size: 13px;
  font-weight: 600;
  text-transform: uppercase;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  transition: all 0.3s ease;
}

.badge-yes {
  background: linear-gradient(135deg, #4caf50, #2e7d32);
  color: #fff;
}

.badge-no {
  background: linear-gradient(135deg, #ef5350, #c62828);
  color: #fff;
}

/* Hover effect */
.badge:hover {
  transform: scale(1.05);
  box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

/* Rating container */
.rating-row {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-top: 5px;
}

/* Rating numeric pill */
.rating-pill {
  background: #ffeb3b;
  color: #000;
  border-radius: 15px;
  padding: 5px 12px;
  font-weight: bold;
  font-size: 13px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

/* Star rating */
.stars {
  position: relative;
  display: inline-block;
  font-size: 18px; /* star size */
  letter-spacing: 2px;
}

.stars::before {
  content: "★★★★★"; /* 5 gray stars */
  color: #ccc;
}

.stars::after {
  content: "★★★★★"; /* 5 yellow stars */
  position: absolute;
  left: 0;
  top: 0;
  width: var(--percent, 0%);
  overflow: hidden;
  color: #ffc107; /* yellow color */
}
.rating-row {
  display: flex;
  align-items: center;
  justify-content: center; /* Center horizontally */
  gap: 8px;
  margin-top: 5px;
}
.rating-pill {
  background: #ffeb3b;
  color: #000;
  border-radius: 15px;
  padding: 5px 12px;
  font-weight: bold;
  font-size: 13px;
}

.product-card { border:1px solid #e5e7eb; border-radius:14px; padding:16px; max-width:420px; font-family:system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; }
.category { color:#6b7280; margin-top:-6px; }
.price-row { display:flex; gap:10px; align-items:baseline; margin:8px 0 4px; }
.price-old { text-decoration:line-through; color:#9ca3af; }
.price-new { font-weight:700; font-size:1.25rem; }
.discount { color:#059669; font-weight:600; }

/* Badges */
.badge {
  display:inline-flex; align-items:center; gap:6px;
  padding:4px 10px; border-radius:999px; font-weight:600; font-size:12px;
  border:1px solid transparent; user-select:none;
}

/* DARK look for Free Delivery & Rating */
.badge-dark { 
  background:#111827;      /* very dark gray */
  color:#f3f4f6;           /* near-white text for contrast */
  border-color:#1f2937;
}

/* Optional: slight variation per type */
.badge-free { box-shadow:0 0 0 1px #064e3b inset; }   /* subtle green hint */
.badge-rating { box-shadow:0 0 0 1px #3730a3 inset; } /* subtle indigo hint */

/* Buttons */
.btn { padding:10px 14px; border-radius:10px; border:1px solid #d1d5db; background:#fff; cursor:pointer; }
.btn.primary { background:#111827; color:#fff; border-color:#111827; }
.btn:hover { filter:brightness(0.95); }

/* Layout helpers */
.meta { display:flex; flex-wrap:wrap; gap:8px; margin:8px 0 12px; }
.stock { color:#374151; }


.product-grid {
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* pehle 250px tha */
    gap: 35px; /* thoda aur gap de rahe hai */
}

.product {
    padding: 25px;      /* box ke andar zyada jagah */
    min-height: 420px;  /* box ki height fix zyada ho */
}

.product img {
    height: 220px; /* image ko bhi thoda bada */
}
    </style>

<script>
function addToCart(pid) {
    fetch('<%= request.getContextPath() %>/AddToCartServlet?productId=' + pid, { method: 'GET' })
    .then(response => response.text())
    .then(message => { alert(message); })
    .catch(error => { console.error('Error adding to cart:', error); });
}

function buynow(pid, price) {
    window.location.href = '<%= request.getContextPath() %>/payment.jsp?product_id=' 
        + encodeURIComponent(pid) + '&amount=' + encodeURIComponent(price);
}
</script>
</head>
  
<body>
   
   
   <header>
		<h2>🛒 MyShop</h2>
		<nav>
			<% if (user != null) { %>
			<span style="margin-right: 15px;">Welcome, <%= user %></span> 
			<a href="logout.jsp">Logout</a>
			 <a href="cart.jsp">MyCart</a>
			<% } else { %>
			<a href="login.jsp">Login</a>
			 <a href="register.jsp">Register</a>
			<% } %>
		</nav>
	</header>
          
       
          
	<main>
	    <div class="container my-3">
    <input type="text" id="searchInput" class="form-control" placeholder="Search products..." onkeyup="searchProduct()">
</div>
	   
		<div id="carouselExample" class="carousel slide mb-4" data-bs-ride="carousel" data-bs-interval="3000">
  <div class="carousel-inner">
    <% for (int i = 0; i < images.size(); i++) { %>
      <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
        <img src="<%= images.get(i) %>" class="d-block w-100" style="height:420px; object-fit:cover;">
      </div>
    <% } %>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<div class="product-grid">
<% 
    if (products != null && !products.isEmpty()) { 
        for (Product p : products) { 
            String imgPath = "";
            Object imageObj = p.getImage();
            if (imageObj instanceof String) {
                imgPath = (String) imageObj;
            } else if (imageObj instanceof byte[]) {
                byte[] imageBytes = (byte[]) imageObj;
                imgPath = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageBytes);
            }

            double discountedPrice = p.getPprice() - (p.getPprice() * p.getDiscount() / 100);
%>

    <div class="product">
        <% if (imgPath.startsWith("http")) { %>
            <img src="<%= imgPath %>" />
        <% } else { %>
            <img src="<%= request.getContextPath() %>/image?pid=<%= p.getPid() %>" />
        <% } %>

        <h3><%= p.getPname() %></h3>
        <p class="desc"><%= p.getPinfo() %></p>
        <p>InStock: <%= p.getPquantity() %></p>

       <p><strong>Price (MRP):</strong> ₹<%= p.getPprice() %></p>
        <% if (p.getDiscount() > 0) { %>
    <p><strong>Discount:</strong> <%= p.getDiscount() %>%</p>
    <p><strong>Final Price:</strong> 
        ₹<%= new DecimalFormat("#.##").format(discountedPrice) %>
    </p>
<% } else { %>
    <p><strong>Discount:</strong> 0%</p>
    <p><strong>Final Price:</strong> ₹<%= p.getPprice() %></p>
<% } %>

        <p>Free Delivery: <%= p.isFreeDelivery() ? "Yes" : "No" %></p>
        <%
    double rating = p.getRating(); 
    double percent = (rating / 5.0) * 100; // har star 20%
%>
<div class="rating-row">
    <div class="stars" style="--percent:<%= percent %>%"></div>
    <span class="rating-pill"><%= rating %> ★</span>
</div>

        <div class="actions">
            <button onclick="addToCart(<%= p.getPid() %>)">Add to Cart</button>
            <button class="button button2" 
                onclick="buynow(<%= p.getPid() %>, <%= (p.getDiscount() > 0 ? discountedPrice : p.getPprice()) %>)">
                Buy Now
            </button>
        </div>
    </div>

<%      } // for loop close 
    } else { %>
        <p>No products available.</p>
<%  } %>
</div>




</main>

<script>
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll('.product').forEach(product => {
        // Set color dynamically
        const color = product.dataset.color;
        product.querySelector('.color-box').style.backgroundColor = color || '#ccc';

        // Generate rating stars dynamically
        const ratingValue = parseFloat(product.dataset.rating) || 0;
        const ratingDiv = product.querySelector('.rating');
        ratingDiv.innerHTML = '';
        for (let i = 1; i <= 5; i++) {
            const star = document.createElement('i');
            star.classList.add('fa-star', 'fa');
            if (i <= ratingValue) {
                star.classList.add('filled');
            }
            ratingDiv.appendChild(star);
        }
    });
});
</script>


<footer> &copy; 2025 MyShop. All rights reserved. </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<script>
function searchProduct() {
    let input = document.getElementById('searchInput').value.toLowerCase();
    let products = document.getElementsByClassName('product');
    
    for (let i = 0; i < products.length; i++) {
        let text = products[i].innerText.toLowerCase();
        if (text.includes(input)) {
            products[i].style.display = "block";
        } else {
            products[i].style.display = "none";
        }
    }
}


</script>
</body>
</html>