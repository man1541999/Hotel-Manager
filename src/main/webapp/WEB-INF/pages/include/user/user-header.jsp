<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header_area">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <!-- Brand and toggle get grouped for better mobile display -->
            <a class="navbar-brand logo_h" href="<c:url value="/user/home-user" />"><img width="120" height="40" src="<c:url value="/resources/image/logo-matrix.png"/>" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                <ul class="nav navbar-nav menu_nav ml-auto">
                    <li class="nav-item active"><a class="nav-link" href="<c:url value="/user/home-user" />">Home</a></li> 
                    <li class="nav-item"><a class="nav-link"  href = "<c:url value="/user/about-us"/>">About us</a></li>
                    <li class="nav-item"><a class="nav-link" href = "<c:url value="/user/room-accomodation"/>">Accomodation</a></li>
                    <li class="nav-item"><a class="nav-link" href = "<c:url value="/user/gallery"/>">Gallery</a></li>
                    <li class="nav-item submenu dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
                        <ul class="dropdown-menu">
                            <li class="nav-item"><a class="nav-link" href="<c:url value="/user/blog"/>">Blog</a></li>
                            <li class="nav-item"><a class="nav-link" href="blog-single.html">Blog Details</a></li>
                        </ul>
                    </li>                    
                    <li class="nav-item"><a class="nav-link" href = "<c:url value="/user/contact"/>">Contact</a></li>


                    <li class="nav-item submenu dropdown">
                    <sec:authorize access="isAuthenticated()">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${pageContext.request.userPrincipal.name}</a>
                        <ul class="dropdown-menu">
                            <li class="nav-item"><a class="nav-link" href="<c:url value="/gallery"/>">Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="<c:url value="/logout" />">Logout</a></li>
                        </ul>
                    </sec:authorize>
                    </li> 


                    <li class="nav-item">
                    <sec:authorize access="!isAuthenticated()">          
                        <a class="nav-link" href="<c:url value="/login" />">Sign in</a>
                    </sec:authorize>        
                    </li>
                    <li class="nav-item">
                    <sec:authorize access="!isAuthenticated()">          
                        <a class="nav-link" href="<c:url value="/signUp" />">Sign Up</a>
                    </sec:authorize>        
                    </li>
                </ul>

            </div> 
        </nav> 

    </div>
</header>
