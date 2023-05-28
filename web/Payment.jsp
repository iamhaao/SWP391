<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/includes/header.jsp" %>

<body class="bg-light">

    <div class="container">
        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">Your cart</span>
                    <span class="" >${sessionScope.size}</span>
                </h4>
                <ul class="list-group mb-3">
                    <c:forEach items="${sessionScope.cartProducts}" var="cart">
                        <li class="list-group-item d-flex justify-content-between lh-condensed">          
                            <div>
                                <h6 class="my-0">${cart.name}</h6>
                                <small class="text-muted">Quantity : ${cart.quantityProduct}</small>
                            </div> 
                            <span class="text-muted">${cart.price}VND</span>
                        </li>
                    </c:forEach>

                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (VND)</span>
                        <strong>${sessionScope.total}</strong>
                    </li>
                </ul>
            </div>

            <div class="col-md-8 order-md-1">
                <h4 class="mb-3">Billing </h4>

                <div class="row">
                    <div class="col-md mb-3">
                        <label for="lastName">Name</label>
                        <input type="text" class="form-control" id="lastName" placeholder="" value="${sessionScope.acc.name}" required>
                        <div class="invalid-feedback">
                            Valid last name is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="username">Username</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" id="username" placeholder="Username" value="${sessionScope.acc.username}" required>
                        <div class="invalid-feedback" style="width: 100%;">
                            Your username is required.
                        </div>
                    </div>
                </div>


                <div class="mb-3">
                    <label for="email">Email <span class="text-muted">(Optional)</span></label>
                    <input type="email" class="form-control" id="email" value="${sessionScope.acc.email}" placeholder="you@example.com">
                    <div class="invalid-feedback">
                        Please enter a valid email address for shipping updates.
                    </div>
                </div>
                <div class="row">
                    <div class="col-md mb-3">
                        <label for="lastName">Phone</label>
                        <input type="text" class="form-control" id="lastName" placeholder="" value="${sessionScope.acc.phone}" required>
                        <div class="invalid-feedback">

                        </div>
                    </div>
                </div>
                <form action="checkout">
                    <div class="row">
                        <div class="col-md-5 mb-3">
                            <label for="zip">Delivery Address</label>
                            <input type="text" class="form-control" name="address" id="address" placeholder="" required>

                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="state">Choose a store near you</label>
                            <select class="custom-select d-block w-100" name="store" id="store" required>
                                <option value="1">FastBites DANANG</option>        
                                <option value="2">FastBites HANOI</option> 
                                <option value="3">FastBites HCM</option> 
                            </select>
                            <div class="invalid-feedback">
                                Please provide a valid state.
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">

                        </div>
                    </div>

                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox">
                        <hr class="mb-4">

                        <h4 class="mb-3">Payment</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                                <label class="custom-control-label" for="debit">Pay after recieve</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                                <label class="custom-control-label" for="credit">Credit card</label>
                            </div>                            
                            <div class="custom-control custom-radio">
                                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                                <label class="custom-control-label" for="paypal">PayPal</label>
                            </div>
                        </div>
                    </div>
                   <button class="btn btn-success" type="submit">Confirm</button>
                </form>

                <%@include file="/includes/footer.jsp" %>
