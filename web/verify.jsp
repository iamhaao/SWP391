<%-- 
    Document   : verify
    Created on : May 28, 2023, 10:49:32 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/includes/header.jsp" %>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
        <div class="container d-flex justify-content-center align-items-center" style="height: 60vh; min-width: 600px">
            <div class="text-center p-4 border" style="min-width: 600px">
              <span>We already sent a verification code to your email</span>
              
              <form action="VerifyCode" method="post" class="mt-3">
                 
                <div class="form-group row" style="margin-bottom: 20px">
                       <label for="email" class="col-sm-4 col-form-label">Sent to gmail:</label>
                       <div class="col-sm-8">
                           <input style="border:none" id="email" name="email" class="form-control"sreadonly  value="${toEmail}">
                       </div>
                </div>                 
                
                <div class="form-group row">
                  <label for="confirm" class="col-sm-4 col-form-label">Verity Code:</label>
                  <div class="col-sm-8">
                        <input type="text" class="form-control" name="authcode" placeholder="Enter verification code">

                  </div>
                </div>                  
                <button style="margin-top:10px" type="submit" class="btn btn-primary text-gray-800">Verify</button>
                
              </form>
              
            </div>
          </div>



 <%@include file="/includes/footer.jsp" %>
 
