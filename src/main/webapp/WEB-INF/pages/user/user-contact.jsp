<%-- 
    Document   : user-contact
    Created on : Oct 2, 2022, 12:11:12 PM
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

        <section class="contact_area section_gap">
            <div class="container">

                <div class="row">
                    <div class="col-md-3">
                        <div class="contact_info">
                            <div class="info_item">
                                <i class="lnr lnr-home"></i>
                                <h6>Da Nang City</h6>
                                <p></p>
                            </div>
                            <div class="info_item">
                                <i class="lnr lnr-phone-handset"></i>
                                <h6><a href="#">0329093762</a></h6>
                                <p>Mon to Fri 9am to 6 pm</p>
                            </div>
                            <div class="info_item">
                                <i class="lnr lnr-envelope"></i>
                                <h6><a href="#">minhmannguyen93@gamil.com</a></h6>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="subject" name="subject" placeholder="Enter Subject">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" name="message" id="message" rows="1" placeholder="Enter Message"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12 text-right">
                                <button type="submit" value="submit" class="btn theme_btn button_hover">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        
        <jsp:include page="../include/user/user-footer.jsp"/>
        <jsp:include page="../include/user/user-js-page.jsp"/>
    </body>
</html>
