<%-- 
    Document   : add-booking
    Created on : Aug 25, 2022, 10:16:57 AM
    Author     : LENOVO
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Booking Page</title>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <mvc:form action="${pageContext.request.contextPath}/management/done-add-booking" 
                  method="post" modelAttribute="booking" enctype="multipart/form-data">
            <div class="page-wrapper">
                <div class="page-header navbar navbar-fixed-top">
                    <jsp:include page="../include/header.jsp"/>                    
                </div>
                <div class="page-container">
                    <jsp:include page="../include/manager-side.jsp"/>
                    <div class="page-content-wrapper">
                        <div class="page-content">
                            <div class="page-bar">
                                <div class="page-title-breadcrumb">
                                    <div class=" pull-left">
                                        <div class="page-title">Add Booking</div>
                                    </div>
                                    <ol class="breadcrumb page-breadcrumb pull-right">
                                        <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li><a class="parent-item" href="">Bookings</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">Add Booking</li>
                                    </ol>                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box">
                                        <div class="card-head">
                                            <header>Add Booking Details</header>
                                            <button id = "panel-button" 
                                                    class = "mdl-button mdl-js-button mdl-button--icon pull-right" 
                                                    data-upgraded = ",MaterialButton">
                                                <i class = "material-icons">more_vert</i>
                                            </button>
                                            <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                                data-mdl-for = "panel-button">
                                                <li class = "mdl-menu__item"><i class="material-icons">assistant_photo</i>Action</li>
                                                <li class = "mdl-menu__item"><i class="material-icons">print</i>Another action</li>
                                                <li class = "mdl-menu__item"><i class="material-icons">favorite</i>Something else here</li>
                                            </ul>
                                        </div>
                                        <div class="card-body row">
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="name" value="${promotion.name}">
                                                    <label class = "mdl-textfield__label">Promotion name</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" name="discount" value="${promotion.discount}"
                                                           pattern = "-?[0-9]*(\.[0-9]+)?" id = "text1">
                                                    <label class = "mdl-textfield__label" for = "text1">Discount</label>
                                                    <span class = "mdl-textfield__error">Number required!</span>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="row">                                                    
                                                    <div class="col-md-12 p-t-20">
                                                        <div class="form-control-wrapper">                                                            
                                                            <input type="date" id="date-start" name="startDate" class="floating-label mdl-textfield__input" placeholder="Start Date">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20">
                                                <div class="row">
                                                    <div class="col-md-12 p-t-20">
                                                        <div class="form-control-wrapper">
                                                            <input type="date" id="date-start" name="endDate" class="floating-label mdl-textfield__input" placeholder="End Date">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                            
                                            <div class="col-lg-6 p-t-20">
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" name="code" value="${promotion.code}"
                                                           id = "text10">
                                                    <label class = "mdl-textfield__label" for = "text10">Code</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-12 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield txt-full-width">
                                                    <textarea class = "mdl-textfield__input" rows =  "4" name="description" placeholder="${promotion.description}"
                                                              id = "education" ></textarea>
                                                    <label class = "mdl-textfield__label" for = "text7">Promotion Details</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-12 p-t-20">
                                                <label class="control-label col-md-3">Upload Promotion Photos</label>
                                                <div class="dropIcon">
                                                    <i class="material-icons">cloud_upload</i>
                                                </div>
                                                <label for="myfiles">Select files:</label>
                                                <input type="file" name="files" multiple="multiple"/>    
                                            </div>                                                              
                                            <div class="col-lg-12 p-t-20 text-center"> 
                                                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../include/component/chat-sidebar.jsp" />
                <jsp:include page="../include/footer.jsp"/>
            </div>
            <jsp:include page="../include/js-page.jsp" />
        </mvc:form>
    </body>
</html>
