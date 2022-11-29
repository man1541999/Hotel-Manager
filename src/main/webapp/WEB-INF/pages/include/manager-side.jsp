<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidemenu-container navbar-collapse collapse fixed-menu">
    <div id="remove-scroll">
        <ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
            <li class="sidebar-toggler-wrapper hide">
                <div class="sidebar-toggler">
                    <span></span>
                </div>
            </li>
            <jsp:include page="sidebar-component/manager-panel.jsp" />
            <li class="menu-heading">
                <span>-- Main</span>
            </li>    
            <jsp:include page="sidebar-component/dashboard.jsp"/>
            
            <jsp:include page="sidebar-component/booking.jsp" />
            
            <%--<jsp:include page="sidebar-component/guest.jsp" />--%>
            
            <jsp:include page="sidebar-component/promotion.jsp" />
            
            <jsp:include page="sidebar-component/room.jsp" />
            
            <jsp:include page="sidebar-component/service.jsp" />            
                                    
            
            <li class="menu-heading m-t-20">
                <span>-- Extra Components</span>
            </li>                        
            
            <jsp:include page="sidebar-component/extra-page.jsp" />
            
            
        </ul>
    </div>
</div>
