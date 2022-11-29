<%-- 
    Document   : add-promotion
    Created on : Aug 21, 2022, 10:36:55 AM
    Author     : LENOVO
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Promotion Page</title>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <mvc:form action="${pageContext.request.contextPath}/management/done-add-service" 
                  method="post" modelAttribute="service" enctype="multipart/form-data">
            <c:if test="${action == 'update'}">
                <input hidden value="${service.id}" name="id" />
            </c:if>
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
                                        <div class="page-title">Add Service</div>
                                    </div>
                                    <ol class="breadcrumb page-breadcrumb pull-right">
                                        <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li><a class="parent-item" href="">Services</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">Add Service</li>
                                    </ol>                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box">
                                        <div class="card-head">
                                            <header>Add Service Details</header>
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
                                            <div class="col-lg-4 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="name" value="${service.name}">
                                                    <label class = "mdl-textfield__label">Service name</label>
                                                    <h5 style="color: red"><mvc:errors path="name"/></h5>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 p-t-20">
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" name="price" value="${service.price}"
                                                           pattern = "-?[0-9]*(\.[0-9]+)?" id = "textprice">
                                                    <label class = "mdl-textfield__label" for = "textprice">Price</label>
                                                    <span class = "mdl-textfield__error">Number required!</span>
                                                    <h5 style="color: red"><mvc:errors path="price"/></h5>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "textPhone" name="phoneNumber" value="${service.phoneNumber}">
                                                    <label class = "mdl-textfield__label">Phone Number</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "textOpen" name="openTime" value="${service.openTime}">
                                                    <label class = "mdl-textfield__label">Open Time</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "textClose" name="closeTime" value="${service.closeTime}">
                                                    <label class = "mdl-textfield__label">Close Time</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "textLocal" name="location" value="${service.location}">
                                                    <label class = "mdl-textfield__label">Location</label>

                                                </div>
                                            </div>

                                            <c:forEach items="${status}" var="s">

                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth select-width">
                                                        <c:if test="${action == 'update'}">
                                                            <label class = "mdl-radio mdl-js-radio" for = "${s}">
                                                                <input type = "radio" id = "${s}" name = "status" value="${s}"
                                                                       class = "mdl-radio__button" checked="">
                                                                <span class = "mdl-radio__label">${s}</span>
                                                            </label>
                                                        </c:if>
                                                    </div>
                                                    <div class="col-lg-3 p-t-20"> 
                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth select-width">
                                                            <c:if test="${action == 'add'}">
                                                                <label class = "mdl-radio mdl-js-radio" for = "${s}">
                                                                    <input type = "radio" id = "${s}" name = "status" value="${s}"
                                                                           class = "mdl-radio__button">
                                                                    <span class = "mdl-radio__label">${s}</span>
                                                                </label>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>



                                            </c:forEach>

                                            <div class="col-lg-12 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield txt-full-width">

                                                    <textarea class = "mdl-textfield__input" rows =  "4" name="description" placeholder="${service.description}"
                                                              id = "education" ></textarea>
                                                    <label class = "mdl-textfield__label" for = "text7">Service Details</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 p-t-20">
                                                <c:forEach items="${service.imageEntitys}" var="i">
                                                    <div class="list-unstyled row clearfix">
                                                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 m-b-20"> 
                                                            <img class="img-fluid img-thumbnail" src="<c:url value="/resources/upload/service/${i.name}"/>" alt=""> 
                                                        </div>
                                                        <div class="col-md-6 col-sm-6">

                                                            <button class="btn btn-danger">
                                                                <a style="color: white" href="<c:url value="/management/delete-image-service/${i.id}"/>"><i class="icon-trash"></i> Delete </a>
                                                            </button>    
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="col-lg-12 p-t-20">
                                                <label class="control-label col-md-3">Upload Promotion Photos</label>
                                                <div class="dropIcon">
                                                    <i class="material-icons">cloud_upload</i>
                                                </div>
                                                <label for="myfiles">Select files:</label>
                                                <input type="file" name="files" multiple="multiple"/> 
                                                <c:if test="${result == 'error'}">
                                                    <br><h5 style="color: red">File is duplicated or not supported file</h5>
                                                </c:if>
                                            </div>                                                              
                                            <div class="col-lg-12 p-t-20 text-center"> 
                                                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                                <button class="btn-lg btn-danger">
                                                    <a style="color: white" href="<c:url value="/management/delete-service/${service.id}"/>"> Delete </a>
                                                </button> 
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
