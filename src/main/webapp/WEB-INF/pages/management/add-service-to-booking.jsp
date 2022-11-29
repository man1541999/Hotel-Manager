<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Service Page</title>
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
                                    <div class="page-title">Add Services</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Add service to room ${bookingDetail.roomEntity.roomNumber}</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">  
                                        <mvc:form action="${pageContext.request.contextPath}/management/done-add-service-to-booking/${bookingDetail.id}" 
                                                  method="post" modelAttribute="serviceBookingRoom">
                                            <div class="col-12 col-lg-4">
                                                <div class="form-group">
                                                    <label for="serviceName">List Services Available</label>
                                                    <select class="form-control" name="serviceId">
                                                        <c:forEach items="${services}" var="s">
                                                            <option value="${s.id}">${s.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="form-control-wrapper mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth select-width">
                                                    <label class = "mdl-textfield__label">Use Date</label>
                                                    <input type="date" id="date" class="floating-label mdl-textfield__input" placeholder="Choose use date" name="useDate" min="${min}" max="${max}">
                                                </div>
                                            </div>

                                            <div class="col-lg-4 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "txtRoomNo" name="quantity" required>
                                                    <label class = "mdl-textfield__label">Quantity</label>
                                                </div>
                                            </div>
                                            <div class="row p-b-20">
                                                <div class="col-md-6 col-sm-6 col-6">
                                                    <div class="btn-group">
                                                        <button  id="addRow" class="btn btn-info" type="submit">
                                                            Submit <i class="fa fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </mvc:form>
                                        <div class="row">               
                                            <c:if test="${messageType == 'success'}">
                                                <div class="alert alert-success " role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>                                                                                            
                                                    ${message}
                                                </div>
                                            </c:if>
                                            <c:if test="${messageType == 'fail'}">
                                                <div class="alert alert-danger" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    ${message}
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="table-scrollable">
                                        <table class="table table-hover table-checkable order-column full-width" id="example4">
                                            <thead>
                                                <tr>
                                                    <th class="center"> Service </th>
                                                    <th class="center"> Price per unit </th>
                                                    <th class="center"> Quantity </th> 
                                                    <th class="center"> Use date </th>
                                                    <th class="center"> Price</th>
                                                    <th class="center"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${bookingDetail.serviceBookingRooms}" var="s">
                                                    <tr class="odd gradeX">
                                                        <td class="center">${s.serviceEntity.name}</td>
                                                        <td class="center">
                                                            <fmt:formatNumber maxFractionDigits  = "0" value = "${s.serviceEntity.price}" currencySymbol="$" type = "currency"/>
                                                        </td>
                                                        <td class="center">${s.quantity}</td>
                                                        <td class="center">${s.useDate}</td>
                                                        <td class="center"><fmt:formatNumber maxFractionDigits  = "0" value = "${s.quantity*s.serviceEntity.price}" currencySymbol="$" type = "currency"/></td>
                                                        <td class="center">
                                                            <button type="button"
                                                                    onclick="location.href = '<c:url value="/management/delete-service-booking-room/${s.id}"/>'"    
                                                                    class="btn btn-tbl-delete btn-xs">
                                                                <i class="fa fa-trash-o "></i>
                                                            </button>
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
            <jsp:include page="../include/footer.jsp" />
        </div>
        <jsp:include page="../include/js-page.jsp" />
    </body>
</html>