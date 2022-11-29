<%-- 
    Document   : user-accomodation
    Created on : Oct 3, 2022, 7:40:37 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="<c:url value="/resources/image/favicon.png"/>" type="image/png">
        <title >Matrix Hotel</title>
        <jsp:include page="../include/user/user-css-page.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css" />" 
              rel="stylesheet" type="text/css" />
    </head>
    <body>
        <jsp:include page="../include/user/user-header.jsp"/>
        <jsp:include page="../include/user/user-banner.jsp"/>


        <!--================ Accomodation Area 1  =================-->
        <section class="accomodation_area section_gap">
            <div class="container">                
                <div class="section_title text-center">
                    <h2 class="title_color">Special Accomodation</h2>
                    <p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast,</p>
                </div>
                <div class="row mb_30">
                    <c:forEach items="${room}" var="r">
                        <div class="col-lg-3 col-sm-6">
                            <div class="accomodation_item text-center">                              
                                <div class="hotel_img ">                                    
                                    <c:forEach items="${r.roomCategoryEntity.imageEntitys}" var="i" begin="0" end="0">
                                        <img     src="<c:url value="/resources/image/image-roomcategory/${i.name}" />" alt="Image" class="img-fluid">
                                    </c:forEach>                                   
                                    <a onclick="location.href = '<c:url value="/user/check-booking/${r.id}"/>'"  style="border-radius: 20px" href="#" class="btn theme_btn button_hover">Book Now</a>
                                </div>
                                <a href="#"><h4 class="sec_h4">${r.roomCategoryEntity.name}  -  ${r.roomNumber}</h4></a>
                                <h6>${r.roomCategoryEntity.price}<small>VND /night</small></h6>                              
                            </div>
                        </div> 

                    </c:forEach>
                </div>                
            </div>
        </section>
        <!--================ Accomodation Area 1  =================-->



        <!--================ Accomodation Area2  =================-->
        <section class="accomodation_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_color">Normal Accomodation</h2>
                    <p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast,</p>
                </div>
                <div class="row accomodation_two">
                    <div class="col-lg-3 col-sm-6">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img">
                                <img src="<c:url value="/resources/image/room1.jpg"/>" alt="">
                                <a href="#" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">Double Deluxe Room</h4></a>
                            <h5>$250<small>/night</small></h5>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img">
                                <img src="<c:url value="/resources/image/room2.jpg"/>" alt="">
                                <a href="#" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">Single Deluxe Room</h4></a>
                            <h5>$200<small>/night</small></h5>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img">
                                <img src="<c:url value="/resources/image/room3.jpg"/>" alt="">
                                <a href="#" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">Honeymoon Suit</h4></a>
                            <h5>$750<small>/night</small></h5>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img">
                                <img src="<c:url value="/resources/image/room4.jpg"/>" alt="">
                                <a href="#" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">Economy Double</h4></a>
                            <h5>$200<small>/night</small></h5>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img">
                                <img src="<c:url value="/resources/image/room1.jpg"/>" alt="">
                                <a href="#" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">Double Deluxe Room</h4></a>
                            <h5>$250<small>/night</small></h5>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img">
                                <img src="<c:url value="/resources/image/room2.jpg"/>" alt="">
                                <a href="#" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">Single Deluxe Room</h4></a>
                            <h5>$200<small>/night</small></h5>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 ">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img" >
                                <img src="<c:url value="/resources/image/room3.jpg"/>" alt="">
                                <a href="#" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">Honeymoon Suit</h4></a>
                            <h5>$750<small>/night</small></h5>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img">
                                <img src="<c:url value="/resources/image/room4.jpg"/>" alt="">
                                <a href="#" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">Economy Double</h4></a>
                            <h5>$200<small>/night</small></h5>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ Accomodation Area 2 =================-->

        <jsp:include page="../include/user/user-footer.jsp"/>
        <jsp:include page="../include/user/user-js-page.jsp"/>
    </body>
</html>
