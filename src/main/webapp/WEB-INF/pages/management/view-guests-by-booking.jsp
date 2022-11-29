<%-- 
    Document   : view-guests
    Created on : Aug 28, 2022, 12:57:36 AM
    Author     : LENOVO
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guests Page</title>
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
                                    <div class="page-title">Guests</div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Guests at room ${bookingDetail.roomEntity.roomNumber}</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">  
                                            
                                                <div class="col-md-6 col-sm-6 col-6">
                                                    <div class="btn-group">
                                                        <a href="<c:url value="/management/add-guest-to-booking/${bookingDetail.id}"/>" id="addRow" class="btn btn-info">
                                                            Add guest to this room <i class="fa fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            
                                        </div>
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
                                                    <th class="center"> Full Name </th>
                                                    <th class="center"> Card Id </th>
                                                    <th class="center"> Phone Number </th>
                                                    <th class="center"> Address </th>
                                                    <th class="center"> Day of birth </th>
                                                    <th class="center"> Gender </th>
                                                    <th class="center"> Action </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${bookingDetail.guestEntitys}" var="g">
                                                    <tr class="odd gradeX">
                                                        <td class="center">${g.fullName}</td>
                                                        <td class="center">${g.idCard}</td>
                                                        <td class="center">${g.phoneNumber}</td>
                                                        <td class="center">${g.address}</td>
                                                        <td class="center">${g.birthDate}</td>
                                                        <td class="center">${g.gender}</td>
                                                        <td class="center">
                                                            <button type="button" 
                                                                    onclick="location.href = '<c:url value="/management/update-guest/${g.id}"/>'" 
                                                                    class="mdl-button mdl-js-button mdl-button--primary margin-right-10">
                                                                <i class="fa fa-pencil"></i>
                                                            </button>
                                                            <button type="button"
                                                                    onclick="location.href = '<c:url value="/management/delete-guest/${g.id}"/>'"    
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
