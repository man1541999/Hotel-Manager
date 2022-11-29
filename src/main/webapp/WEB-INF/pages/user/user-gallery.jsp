<%-- 
    Document   : user-gallery
    Created on : Oct 2, 2022, 12:06:38 PM
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

        <section class="gallery_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_color">Royal Hotel Gallery</h2>
                    <p>Who are in extremely love with eco friendly system.</p>
                </div>
                <div class="row imageGallery1" id="gallery">
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/01.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/01.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/02.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/02.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/03.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/03.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/04.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/04.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/06.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/05.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/05.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/06.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/01-1.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/01-1.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/02-1.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/02-1.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 gallery_item">
                        <div class="gallery_img">
                            <img src="<c:url value="/resources/image/gallery/03-1.jpg"/>" alt="">
                            <div class="hover">
                                <a class="light" href="<c:url value="/resources/image/gallery/03-1.jpg"/>"><i class="fa fa-expand"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="../include/user/user-footer.jsp"/>
        <jsp:include page="../include/user/user-js-page.jsp"/>
    </body>
</html>
