
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li class="nav-item">
    <a href="#" class="nav-link nav-toggle">
        <i class="material-icons">business_center</i>
        <span class="title">Booking</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
        
        <li class="nav-item">
            <a href="<c:url value="/management/view-bookings" />" class="nav-link ">
                <span class="title">View Bookings</span>
            </a>
        </li>
    </ul>
</li>