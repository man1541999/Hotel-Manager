<%-- 
    Document   : view-completed-booking
    Created on : Aug 25, 2022, 11:20:32 PM
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
        <title>Completed Booking Page</title>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">


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
                                    <div class="page-title">View Completed Booking</div>
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
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="discount" value="${booking.discount}" disabled>
                                                <label class = "mdl-textfield__label">Discount</label>
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-6 p-t-20"> 
                                            <label class="control-label col-lg-2">Status</label>
                                            <div class="col-lg-10">
                                                <select class="form-control" name="status" disabled="">
                                                    <option value="">${booking.status}</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="bookingDate" value="${booking.bookingDate}" disabled>
                                                <label class = "mdl-textfield__label">Booking Date</label>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class = "mdl-textfield__input" type = "date" id = "date-format" name="checkIn" value="${booking.checkIn}" disabled>
                                                <label class = "mdl-textfield__label">Check-in date</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="booking.accountEntity.fullName" value="${booking.accountEntity.fullName}" disabled>
                                                <label class = "mdl-textfield__label">Booked by</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class = "mdl-textfield__input" type = "date" id = "date-format" name="checkOut" value="${booking.checkOut}" disabled>
                                                <label class = "mdl-textfield__label">Check-out date</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="booking.accountEntity.email" value="${booking.accountEntity.email}" disabled>
                                                <label class = "mdl-textfield__label">Email</label>
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
                                                                <th class="center"> Room number</th>
                                                                <th class="center">Room Type</th>
                                                                <th class="center">Unit Price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${booking.bookingDetailEntitys}" var="bd">

                                                                <tr>
                                                                    <td class="center">
                                                                        ${bd.roomEntity.roomNumber}
                                                                    </td>

                                                                    <td class="center">
                                                                        ${bd.roomEntity.roomCategoryEntity.name}
                                                                    </td>

                                                                    <td class="center">
                                                                        <fmt:formatNumber maxFractionDigits  = "0" value = "${bd.roomEntity.roomCategoryEntity.price}" currencySymbol="$" type = "currency"/>
                                                                    </td >
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
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card card-topline-aqua">
                                            <div class="card-head">
                                                <header>List services</header>
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
                                                                <th class="center"> Service </th>
                                                                <th class="center"> Price per unit </th>
                                                                <th class="center"> Quantity </th> 
                                                                <th class="center"> Use date </th>
                                                                <th class="center"> Price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${booking.bookingDetailEntitys}" var="bd">

                                                                <c:forEach items="${bd.serviceBookingRooms}" var="s">
                                                                    <tr class="odd gradeX">
                                                                        <td class="center">${s.serviceEntity.name}</td>
                                                                        <td class="center">
                                                                            <fmt:formatNumber maxFractionDigits  = "0" value = "${s.serviceEntity.price}" currencySymbol="$" type = "currency"/>
                                                                        </td>
                                                                        <td class="center">${s.quantity}</td>
                                                                        <td class="center">${s.useDate}</td>
                                                                        <td class="center"><fmt:formatNumber maxFractionDigits  = "0" value = "${s.quantity*s.serviceEntity.price}" currencySymbol="$" type = "currency"/></td>
                                                                    </tr> 
                                                                </c:forEach>
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
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card card-topline-red">
                                            <div class="card-head">
                                                <header>List guests</header>
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
                                                                <th class="center"> Full Name </th>
                                                                <th class="center"> Card Id </th>
                                                                <th class="center"> Phone Number </th>
                                                                <th class="center"> Address </th>
                                                                <th class="center"> Day of birth </th>
                                                                <th class="center"> Gender </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${booking.bookingDetailEntitys}" var="bd">
                                                                <c:forEach items="${bd.guestEntitys}" var="g">
                                                                    <tr>
                                                                        <td class="center">${g.fullName}</td>
                                                                        <td class="center">${g.idCard}</td>
                                                                        <td class="center">${g.phoneNumber}</td>
                                                                        <td class="center">${g.address}</td>
                                                                        <td class="center">${g.birthDate}</td>
                                                                        <td class="center">${g.gender}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 p-t-20 text-center"> 
                                    <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-info"
                                            onclick="location.href = '<c:url value="/management/view-bookings"/>'">Return</button>
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
        </div>
        <jsp:include page="../include/js-page.jsp" />
    </body>
</html>
