<%-- 
    Document   : add-room
    Created on : Aug 1, 2022, 10:27:50 PM
    Author     : LENOVO
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Room Page</title>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <mvc:form action="${pageContext.request.contextPath}/management/done-add-room" 
                  method="post" modelAttribute="room">
            <c:if test="${action == 'update'}">
                <input hidden value="${room.id}" name="id" />
                <input hidden value="${room.roomCategoryEntity.id}" name="roomCategoryEntity.id" />
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
                                        <div class="page-title">Add Room</div>
                                    </div>
                                    <ol class="breadcrumb page-breadcrumb pull-right">
                                        <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li><a class="parent-item" href="">Rooms</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">Add Room</li>
                                    </ol>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box">
                                        <div class="card-head">
                                            <header>Add Room</header>
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
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="roomNumber" value="${room.roomNumber}" required>
                                                    <label class = "mdl-textfield__label">Room Number</label>
                                                    <h5 style="color: red"><mvc:errors path="roomNumber"/></h5>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input pattern = "-?[0-9]*(\.[0-9]+)?" class = "mdl-textfield__input" type = "text" id = "txtPhoneNo" name="phoneNumber" value="${room.phoneNumber}" required>
                                                    <label class = "mdl-textfield__label">Phone Number</label>
                                                    <span class = "mdl-textfield__error">Number required!</span>
                                                </div>
                                            </div>
                                            <div class="form-group col-lg-6 p-t-20"> 
                                                <label class="control-label col-lg-2">Category</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="roomCategory">
                                                        <option value="">- Choose Category -</option>
                                                        <c:forEach items="${categories}" var="c">
                                                            <option value="${c}">${c}</option>
                                                        </c:forEach>                                                       
                                                    </select>
                                                </div>
                                            </div>
                                            <c:forEach items="${status}" var="s">
                                                <div class="col-lg-3 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth select-width">

                                                        <label class = "mdl-radio mdl-js-radio" for = "${s}">
                                                            <input type = "radio" id = "${s}" name = "status" value="${s}"
                                                                   class = "mdl-radio__button">
                                                            <span class = "mdl-radio__label">${s}</span>
                                                        </label>

                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <div class="col-lg-12 p-t-20 text-center"> 

                                                <mvc:button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</mvc:button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    <jsp:include page="../include/component/chat-sidebar.jsp" />
                </div>
                <jsp:include page="../include/footer.jsp" />
            </div>
            <jsp:include page="../include/js-page.jsp" />
        </mvc:form>
    </body>
</html>
