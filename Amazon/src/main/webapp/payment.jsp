<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Secure Payment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background: linear-gradient(135deg, #ffe6e6, #e6f7ff);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
    font-family: Arial, sans-serif;
}
.payment-card {
    max-width: 450px;
    margin: 80px auto;
    padding: 25px;
    background: #00acc1;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
    color: #fff;
}
.amount-box {
    background-color: #d4edda;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    font-weight: bold;
    font-size: 18px;
    color: #155724;
    margin-bottom: 15px;
}
.btn-pay {
    background-color: #1a73e8;
    color: white;
    font-weight: bold;
    border-radius: 6px;
    border: none;
    padding: 10px;
    width: 100%;
    cursor: pointer;
    transition: 0.3s;
}
.btn-pay:hover { background-color: #155fc1; }
.secure-text {
    color:#1b5e20;   
    font-weight: bold;
    margin-top: 15px;
    font-size: 14px;
}
.hidden { display: none; }
</style>
</head>
<body>

<div class="payment-card">
    <h4 class="text-center mb-3">💳 Secure Payment</h4>

    <div class="amount-box">
        Amount to Pay: ₹<%= request.getParameter("amount") %>
    </div>

    <form action="payment" method="post" id="paymentForm">
        <input type="hidden" name="productId" value="<%= request.getParameter("product_id") %>">
        <input type="hidden" name="amount" value="<%= request.getParameter("amount") %>">

        <!-- Payment Method Selection -->
        <div class="mb-3">
            <label class="form-label">Select Payment Method</label><br>
            <input type="radio" name="paymentMethod" value="cod" onclick="toggleFields()" required> Cash on Delivery<br>
            <input type="radio" name="paymentMethod" value="card" onclick="toggleFields()"> Card<br>
            <input type="radio" name="paymentMethod" value="upi" onclick="toggleFields()"> UPI
        </div>

        <!-- Common Address Fields -->
        <div id="addressFields" class="hidden">
            <div class="mb-2">
                <label class="form-label">Full Address</label>
                <input type="text" name="address" class="form-control" placeholder="Enter full address">
            </div>
            <div class="mb-2">
                <label class="form-label">Pincode</label>
                <input type="text" name="pincode" class="form-control" placeholder="Enter pincode">
            </div>
            <div class="mb-2">
                <label class="form-label">City</label>
                <input type="text" name="city" class="form-control" placeholder="Enter city">
            </div>
            <div class="mb-3">
                <label class="form-label">District</label>
                <input type="text" name="district" class="form-control" placeholder="Enter district">
            </div>
        </div>

        <!-- Card Fields -->
        <div id="cardFields" class="hidden">
            <div class="mb-3">
                <label class="form-label">Card Number</label>
                <input type="text" name="cardNumber" class="form-control" placeholder="1234 5678 9012 3456">
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label class="form-label">Expiry (MM/YY)</label>
                    <input type="text" name="expiry" class="form-control" placeholder="MM/YY">
                </div>
                <div class="col">
                    <label class="form-label">CVV</label>
                    <input type="password" name="cvv" class="form-control" placeholder="123">
                </div>
            </div>
        </div>

        <!-- UPI Field -->
        <div id="upiFields" class="hidden">
            <div class="mb-3">
                <label class="form-label">UPI ID</label>
                <input type="text" name="upiId" class="form-control" placeholder="example@upi">
            </div>
        </div>

        <button type="submit" class="btn btn-pay w-100">Proceed</button>
    </form>

    <div class="text-center mt-3" style="font-size: 0.9rem; color: gray;">
        <p class="secure-text">🔒 100% Secure & Encrypted Payment</p>
    </div>
</div>

<script>
function toggleFields() {
    const method = document.querySelector('input[name="paymentMethod"]:checked').value;
    const addressFields = document.getElementById("addressFields");
    const cardFields = document.getElementById("cardFields");
    const upiFields = document.getElementById("upiFields");

    // Hide all initially
    addressFields.classList.add("hidden");
    cardFields.classList.add("hidden");
    upiFields.classList.add("hidden");

    // Remove 'required' from all dynamic inputs
    document.querySelectorAll('#addressFields input, #cardFields input, #upiFields input').forEach(inp => inp.required = false);

    // Show address always after selection
    addressFields.classList.remove("hidden");
    document.querySelectorAll('#addressFields input').forEach(inp => inp.required = true);

    if (method === "card") {
        cardFields.classList.remove("hidden");
        document.querySelectorAll('#cardFields input').forEach(inp => inp.required = true);
    } else if (method === "upi") {
        upiFields.classList.remove("hidden");
        document.querySelector('#upiFields input').required = true;
    }
}
</script>

</body>
</html>
