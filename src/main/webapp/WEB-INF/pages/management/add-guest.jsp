<%-- 
    Document   : add-guest
    Created on : Aug 28, 2022, 12:19:22 PM
    Author     : LENOVO
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Guest Page</title>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">


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
                                    <div class="page-title">Add Guest</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="">Guests</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">Add Guest</li>
                                </ol>
                            </div>
                        </div>
                        <mvc:form action="${pageContext.request.contextPath}/management/done-add-guest" 
                                  method="POST" modelAttribute="guest">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box">
                                        <div class="card-head">
                                            <header>Add Guest</header>
                                            <button id = "panel-button" 
                                                    class = "mdl-button mdl-js-button mdl-button--icon pull-right" 
                                                    data-upgraded = ",MaterialButton">
                                                <i class = "material-icons">more_vert</i>
                                            </button>
                                            <c:if test="${action == 'update'}">
                                                <input hidden value="${guest.id}" name="id"/>
                                                <input hidden value="${guest.bookingDetailEntity.id}" name="bookingDetailId"/>
                                            </c:if>

                                            <c:if test="${action == 'add'}">
                                                <input hidden value="${bookingDetail.id}" name="bookingDetailId"/>
                                            </c:if>
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
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="fullName" value="${guest.fullName}" required>
                                                    <label class = "mdl-textfield__label">Full Name </label>
                                                    <h5 style="color: red"><mvc:errors path="fullName"/></h5>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtPhoneNo" name="idCard" value="${guest.idCard}" required>
                                                    <label class = "mdl-textfield__label">Card Id</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtPhoneNo" name="phoneNumber" value="${guest.phoneNumber}">
                                                    <label class = "mdl-textfield__label">Phone Number</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtPhoneNo" name="address" value="${guest.address}">
                                                    <label class = "mdl-textfield__label">Address</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="form-control-wrapper mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth select-width">
                                                    <label class = "mdl-textfield__label">Day of birth</label>
                                                    <c:if test="${action == 'update'}">
                                                        <input type="date" id="date" class="floating-label mdl-textfield__input" placeholder=" " value="${guest.birthDate}" name="birthDate">
                                                    </c:if>
                                                    <c:if test="${action == 'add'}">
                                                        <input type="date" id="date" class="floating-label mdl-textfield__input" placeholder=" "  name="birthDate">
                                                    </c:if>
                                                    <h5 style="color: red"><mvc:errors path="birthDate"/></h5>
                                                </div>
                                            </div>

                                            <div class="form-group col-lg-6 p-t-20"> 
                                                <label class="control-label col-lg-2">Gender</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="gender">
                                                        <option value="">- Choose Gender -</option>
                                                        <c:forEach items="${gender}" var="g">
                                                            <c:if test="${guest.gender == g}">
                                                                <option value="${g}" selected>${g}</option>
                                                            </c:if>
                                                            <c:if test="${guest.gender != g}">
                                                                <option value="${g}">${g}</option>
                                                            </c:if>
                                                        </c:forEach>                                                       
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 p-t-20 text-center"> 

                                                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </mvc:form>
                    </div>
                </div>
                <jsp:include page="../include/component/chat-sidebar.jsp" />
            </div>
            <jsp:include page="../include/footer.jsp" />
        </div>
        <jsp:include page="../include/js-page.jsp" />

    </body>
</html>
