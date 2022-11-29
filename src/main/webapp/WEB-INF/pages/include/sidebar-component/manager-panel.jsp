<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li class="sidebar-user-panel">
    <div class="user-panel">
        <div class="row">
            <div class="sidebar-userpic">
                <img src="<c:url value="/resources-management/assets/img/dp.jpg"/>" class="img-responsive" alt=""> </div>
        </div>
        <div class="profile-usertitle">
            <div class="sidebar-userpic-name" style="font-size: 12px"> ${username} </div>
            <div class="profile-usertitle-job"> Manager </div>
        </div>
        <div class="sidebar-userpic-btn">
            <a class="tooltips" href="user_profile.html" data-placement="top" data-original-title="Profile">
                <i class="material-icons">person_outline</i>
            </a>
            <a class="tooltips" href="email_inbox.html" data-placement="top" data-original-title="Mail">
                <i class="material-icons">mail_outline</i>
            </a>
            <a class="tooltips" href="chat.html" data-placement="top" data-original-title="Chat">
                <i class="material-icons">chat</i>
            </a>
            <a class="tooltips" href="<c:url value="/logout"/>" data-placement="top" data-original-title="Logout">
                <i class="material-icons">input</i>
            </a>
        </div>
    </div>
</li>
