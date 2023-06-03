<%-- 
    Document   : PreviewProduct
    Created on : May 15, 2023, 4:05:36 AM
    Author     : ACER NITRO
--%>
<%@taglib prefix="my" uri="/WEB-INF/tlds/customtaglid" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./includes/header.jsp" %>
<body>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
    <link rel="stylesheet" href="./css/stylePreview.css"/>
    <c:set var="p" value="${requestScope.p}"/>
    <div class="container">
        <div class="card">
            <div class="container-fliud">
                <div class="wrapper row">
                    <div class="preview col-md-6">

                        <div class="preview-pic tab-content">
                            <div class="tab-pane active w-full h-25  img-responsive" id="pic-1"><img src="${p.image}" /></div>
                        </div>
                        <!--						<ul class="preview-thumbnail nav nav-tabs">
                                                                          <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
                                                                        </ul>-->

                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">${p.name}</h3>
                        <div class="rating">
                            <div><my:Rating min="0" max="5" num="${avgRating}"/></div>
                            <span class="review-no">41 reviews </span>
                        </div>
                        <p class="product-description">${p.description} </p>
                        <h4 class="price"> price: <span>${p.price}</span></h4>
                        <div class="action">
                            <button class="add-to-cart btn btn-default" type="button"> <a href="addcart?id=${p.idProduct}">add to cart</a></button>
                            <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/stylePreview2.css"/>
    <section class="content-item" id="comments">
        <div class="container">   
            <div class="row">
                <div class="col-sm-8">   
                     <c:if test="${sessionScope.acc.idAccount != null}">
                    <form action="feedback" method="GET">
                        <h3 class="pull-left">New Comment</h3>
                        
                        <button type="submit" class="btn btn-normal pull-right">Submit</button>
                        <fieldset>
                            <div class="row">
                                <div class="col-sm-3 col-lg-2 hidden-xs">
                                    <img class="img-responsive" src="${sessionScope.acc.avatar}" alt="">
                                </div>
                                <div class="form-group col-xs-12 col-sm-9 col-lg-10">
                                    <input value="${p.idProduct}" name="idProduct"class="text-white">
                                    <div class="star-rating">
                                            <span class="fa fa-star-o" data-rating="1"></span>
                                            <span class="fa fa-star-o" data-rating="2"></span>
                                            <span class="fa fa-star-o" data-rating="3"></span>
                                            <span class="fa fa-star-o" data-rating="4"></span>
                                            <span class="fa fa-star-o" data-rating="5"></span>
                                            <input type="hidden" name="whatever1" class="rating-value" value="5">
                                    </div>
                                    <textarea name="comment" class="form-control" id="message" placeholder="Your message" required=""></textarea>
                      
                                </div>
                            </div>  	
                        </fieldset>
                          
                    </form>
                    </c:if>

                    <h3>Comments:</h3>

                    <!-- COMMENT 1 - START -->
                    
                    <!-- COMMENT 1 - END -->

                    <!-- COMMENT 2 - START -->
                    
                    <!-- COMMENT 2 - END -->

                    <!-- COMMENT 3 - START -->
                    
                    <!-- COMMENT 3 - END -->

                    <!-- COMMENT 4 - START -->
                     <c:forEach items="${listFb}" var="fb">
                        
                            <div class="media">
                                
                                <a class="pull-left" href="#"><img class="media-object" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt=""></a>
                                <div class="media-body">
                                    <div><my:Rating min="0" max="5" num="${fb.rating}"/></div>
                                    <p>${fb.script}</p>
                                    <ul class="list-unstyled list-inline media-detail pull-left">
                                        <li><i class="fa fa-calendar"></i>${fb.date}</li>
                                        <li><i class="fa fa-thumbs-up"></i>${fb.productID}</li>
                                    </ul>
                                    
                                </div>

                            </div>
                         </div>       
                     </c:forEach>
                    <!-- COMMENT 4 - END -->

                </div>
            </div>
        </div>
    </section>
<script>
var $star_rating = $('.star-rating .fa');

var SetRatingStar = function() {
  return $star_rating.each(function() {
    if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
      return $(this).removeClass('fa-star-o').addClass('fa-star');
    } else {
      return $(this).removeClass('fa-star').addClass('fa-star-o');
    }
  });
};

$star_rating.on('click', function() {
  $star_rating.siblings('input.rating-value').val($(this).data('rating'));
  return SetRatingStar();
});

SetRatingStar();
$(document).ready(function() {

});
</script>

</body>
<%@include file="./includes/footer.jsp" %>
