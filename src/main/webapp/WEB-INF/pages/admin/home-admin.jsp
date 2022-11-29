<%-- 
    Document   : home
    Created on : Jun 20, 2019, 7:47:58 PM
    Author     : AnhLe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <div class="page-header navbar navbar-fixed-top">
                <jsp:include page="../include/header.jsp"/>
            </div>
            <div class="page-container">
                <jsp:include page="../include/admin-side.jsp"/>
            </div>
            <div class="page-content-wrapper">
                
            </div>
        </div>
        <jsp:include page="../include/js-page.jsp" />
    </body>
</html>
