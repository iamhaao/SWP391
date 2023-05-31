<%-- 
    Document   : ChangePass
    Created on : May 28, 2023, 10:52:01 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/includes/header.jsp" %>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<div class="container d-flex justify-content-center align-items-center" style="height: 55vh;">
  <div class="text-center p-4 border" style="margin: 10px;">
    <h3 style="margin: 30px;">Change Password</h3>
    <form action="changepassS" method="post" class="mt-3">
        <div class="form-group row" >
            <label for="email" class="col-sm-4 col-form-label">Email:</label>
            <div class="col-sm-8">
                <input style="border:none" id="email" name="email" class="form-control"sreadonly  value="${toEmail}">
            </div>
        </div>       
      <div class="form-group row">
        <label for="newpass" class="col-sm-4 col-form-label">New Password:</label>
        <div class="col-sm-8">
          <input id="newpass" name="newpass" class="form-control" type="password" placeholder="New Password">
        </div>
      </div>
      <div class="form-group row">
        <label for="confirm" class="col-sm-4 col-form-label">Confirm Password:</label>
        <div class="col-sm-8">
          <input id="confirm" name="confirm" class="form-control" type="password" placeholder="Confirm Password">
        </div>
      </div>
        <div class="text-danger mt-4">${requestScope.alert}</div>

      <button type="submit" class="btn btn-primary text-gray-800">Change</button>
    </form>
  </div>
</div>




<%@include file="/includes/footer.jsp" %>