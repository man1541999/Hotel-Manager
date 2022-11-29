<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li class="nav-item">
    <a href="#" class="nav-link nav-toggle">
        <i class="material-icons">vpn_key</i>
        <span class="title">Rooms</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
        <li class="nav-item">
            <a href="<c:url value="/management/add-room" />" class="nav-link ">
                <span class="title">Add Room</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="<c:url value="/management/add-room-category" />" class="nav-link ">
                <span class="title">Add Room Category</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="<c:url value="/management/view-rooms" />" class="nav-link ">
                <span class="title">View All Rooms</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="<c:url value="/management/view-room-categories" />" class="nav-link ">
                <span class="title">View All Room Categories</span>
            </a>
        </li>
    </ul>
</li>