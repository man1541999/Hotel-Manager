<%-- 
    Document   : user-viewRoomDetail
    Created on : Sep 30, 2022, 6:44:28 PM
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
    <style>
        .mySlides3 {
            display:none;
            width:100%
        }
        .display-container{
            position:relative
        }

        /*---Css Nút qua lại---*/
        .button-left{
            left:1%;
            font-size:20px
        }
        .button-right{
            right:1%;
            font-size:20px
        }
        .image-button{
            border:none;
            display:inline-block;
            padding:10px;
            height:50px;
            vertical-align:middle;
            overflow:hidden;
            color:#fff;
            background:#000;
            position:absolute;
            top:calc(50% - 25px);
            opacity:0.5;
        }
        .image-button:hover{
            color:#000;
            background:#ccc;
        }

        /*---Css Chấm tròn---*/
        .badge {
            text-align:center;
            margin-bottom:16px;
            font-size:20px;
            position:absolute;
            bottom:0;
        }
        .badge-white{
            color:#000!important;
            background-color:#fff!important
        }
        .image-badge {
            display:inline-block;
            border-radius:50%;
            height:14px;
            width:14px;
            border:1px solid #ccc;
        }
        .image-badge:hover{
            background:#fff;
        }

    </style>
    <body>

        <jsp:include page="../include/user/user-header.jsp"/>
        <%--<jsp:include page="../include/user/user-banner.jsp"/>--%>








        <section class="accomodation_area section_gap">
            <div class="container">
                <div class="col-12">
                    <div class="row">
                        <div class="col-5">
                            <div class=" display-container w-100 h-100" >
                                <c:forEach items="${roomcate.imageEntitys}" var="i" begin="0" end="0">
                                    <img class="mySlides3" src="<c:url value="/resources/image/image-roomcategory/${i.name}" />" alt="Image" >

                                </c:forEach> 
                                <c:forEach items="${roomcate.imageEntitys}" var="i" begin="1" end="1">
                                    <img class="mySlides3" src="<c:url value="/resources/image/image-roomcategory/${i.name}" />" alt="Image" >

                                </c:forEach> 
                                <c:forEach items="${roomcate.imageEntitys}" var="i" begin="2" end="2">
                                    <img class="mySlides3" src="<c:url value="/resources/image/image-roomcategory/${i.name}" />" alt="Image" >

                                </c:forEach> 

                                <button class="image-button button-left" onclick="plusDivs(-1)">&#10094;</button>
                                <button class="image-button button-right" onclick="plusDivs(1)">&#10095;</button>

                                <div class="badge" style="width:100%">

                                    <span class="image-badge" onclick="currentDiv(1)"></span>
                                    <span class="image-badge" onclick="currentDiv(2)"></span>
                                    <span class="image-badge" onclick="currentDiv(3)"></span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-5" >
                            <th><b>Name Rooms :</b> ${roomcate.name}</th><br>                                  
                            <th><b>Capacity :</b> ${roomcate.capacity}</th><br>
                            <th><b>Number of Bed :</b> ${roomcate.numberOfBed}</th><br>
                            <th><b>Area :</b> ${roomcate.area}</th><br>
                            <th><b>Description:</b> ${roomcate.description}</th><br>
                            <th><b>Price:</b> ${roomcate.price}</th><br>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--scrip chuyen anh-->     
        <script>
            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
                showDivs(slideIndex += n);
            }

            function currentDiv(n) {
                showDivs(slideIndex = n);
            }

            function showDivs(n) {
                var i;
                var x = document.getElementsByClassName("mySlides3");
                var dots = document.getElementsByClassName("image-badge");
                if (n > x.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = x.length
                }
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" badge-white", "");
                }
                x[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " badge-white";
            }
        </script>

        <jsp:include page="../include/user/user-footer.jsp"/>
        <jsp:include page="../include/user/user-js-page.jsp"/>
    </body>
</html>
