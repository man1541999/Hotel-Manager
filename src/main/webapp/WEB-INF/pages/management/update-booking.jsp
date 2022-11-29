<%-- 
    Document   : update-booking
    Created on : Aug 25, 2022, 1:36:10 PM
    Author     : LENOVO
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Detail Page</title>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <mvc:form action="${pageContext.request.contextPath}/management/done-update-booking" 
                  method="post" modelAttribute="booking">

            <input hidden value="${booking.id}" name="id" />



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
                                        <div class="page-title">View Booking Details</div>
                                    </div>
                                    <ol class="breadcrumb page-breadcrumb pull-right">
                                        <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li><a class="parent-item" href="">Bookings</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">Booking Details</li>
                                    </ol>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card-box">
                                        <div class="card-head">
                                            <header>Booking Detail</header>
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
                                            <div class="form-group col-lg-8 p-t-20"> 
                                                <label class="control-label col-lg-2">Status</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="status">
                                                        <option value="">- Choose Status -</option>
                                                        <c:forEach items="${status}" var="s">
                                                            <c:if test="${s == booking.status}">
                                                                <option value="${s}" selected>${s}</option>
                                                            </c:if>
                                                            <c:if test="${s != booking.status}">
                                                                <option value="${s}">${s}</option>
                                                            </c:if>
                                                        </c:forEach>                                                       
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="discount" value="${booking.discount}">
                                                    <label class = "mdl-textfield__label">Discount</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="form-control-wrapper mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth select-width">
                                                    <label class = "mdl-textfield__label">Booking Date</label>
                                                    <input type="text" id="date" class="floating-label mdl-textfield__input" value="${booking.bookingDate}" disabled>
                                                    <input type="hidden" name ="bookingDate" value="${booking.bookingDate}" />
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="booking.accountEntity.fullName" value="${booking.accountEntity.fullName}" readonly="">
                                                    <label class = "mdl-textfield__label">Booked by</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="form-control-wrapper mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth select-width">
                                                    <label class = "mdl-textfield__label">Check-in Date</label>
                                                    <input type="text" id="date" class="floating-label mdl-textfield__input" value="${booking.checkIn}" disabled>
                                                    <input type="hidden" value="${booking.checkIn}" name="checkIn" />
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="booking.accountEntity.email" value="${booking.accountEntity.email}" readonly="">
                                                    <label class = "mdl-textfield__label">Email</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="form-control-wrapper mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth select-width">
                                                    <label class = "mdl-textfield__label">Check-out Date</label>
                                                    <input type="text" id="date2" class="floating-label mdl-textfield__input"  value="${booking.checkOut}" disabled>
                                                    <input type="hidden" value="${booking.checkOut}" name="checkOut"  />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card card-topline-green">
                                                <div class="card-head">
                                                    <header>List rooms</header>
                                                    <div class="tools">
                                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                                    </div>
                                                </div>
                                                <div class="card-body ">
                                                    <div class="table-responsive">
                                                        <table class="table table-striped custom-table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th> Room number</th>
                                                                    <th>Room Type</th>
                                                                    <th>Unit Price</th>
                                                                    <th>Services cost</th>
                                                                    <th class="center">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${booking.bookingDetailEntitys}" var="bd">
                                                                    <tr>
                                                                        <td>
                                                                            ${bd.roomEntity.roomNumber}
                                                                        </td>
                                                                        <td>
                                                                            ${bd.roomEntity.roomCategoryEntity.name}
                                                                        </td>
                                                                        <td>
                                                                            <fmt:formatNumber maxFractionDigits = "0" value="${bd.roomEntity.roomCategoryEntity.price}" currencySymbol="$" type = "currency"/>
                                                                        </td>
                                                                        <td>
                                                                            <c:set var="total" value="${0}"/>
                                                                            <c:forEach var="sbr" items="${bd.serviceBookingRooms}">
                                                                                <c:set var="total" value="${total + (sbr.quantity * sbr.serviceEntity.price)}" />                                                                                
                                                                            </c:forEach>
                                                                            <fmt:formatNumber maxFractionDigits = "0" value="${total}" currencySymbol="$" type = "currency"/>
                                                                        </td>
                                                                        <td class="center">
                                                                            <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-info"
                                                                                    onclick="location.href = '<c:url value="/management/add-service-to-booking-detail/${bd.id}"/>'">Add Services</button>
                                                                            <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-info"
                                                                                    onclick="location.href = '<c:url value="/management/view-guests/${bd.id}"/>'">View Guests</button>                                                                                
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row"> 
                                <div class="col-lg-12 p-t-20 text-center"> 
                                    <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-success">Submit</button>

                                    <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-danger"
                                            onclick="location.href = '<c:url value="/management/print-invoice/${booking.id}"/>'">Print invoice</button> 
                                </div> 
                            </div>
                        </div> 
                    </div>
                </div>
                <jsp:include page="../include/component/chat-sidebar.jsp" />
            </div>
            <jsp:include page="../include/footer.jsp" />

            <jsp:include page="../include/js-page.jsp" />
        </mvc:form>
    </body>
</html>
