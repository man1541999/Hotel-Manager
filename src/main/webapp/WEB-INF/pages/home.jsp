<%-- 
    Document   : index1
    Created on : Jul 30, 2022, 10:24:29 AM
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
        <jsp:include page="include/user/user-css-page.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css" />" 
              rel="stylesheet" type="text/css" />
    </head>
    <body>

        <jsp:include page="include/user/user-header.jsp"/>
        <jsp:include page="include/user/user-banner.jsp"/>



        <jsp:include page="include/user/user-Accomodation.jsp"/>




        <jsp:include page="include/user/user-Facilities-home.jsp"/>
        <jsp:include page="include/user/user-About-home.jsp"/>
        <jsp:include page="include/user/user-blog-home.jsp"/>


        <jsp:include page="include/user/user-footer.jsp"/>
        <jsp:include page="include/user/user-js-page.jsp"/>
    </body>
</html>
