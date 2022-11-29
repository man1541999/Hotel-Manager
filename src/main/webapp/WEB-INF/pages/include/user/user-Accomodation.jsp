<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--================ Accomodation Area  =================-->
<section class="accomodation_area section_gap">
    <div class="container">

        <div class="section_title text-center">
            <h2 class="title_color">Hotel Matrix</h2>
            <p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast, </p>
        </div>
        <div class="row mb_30">
            <c:forEach items="${roomcate}" var="r" >
                <div class="col-lg-3 col-sm-6">
                    <div class="accomodation_item text-center">
                        <div class="hotel_img">
                            <c:forEach items="${r.imageEntitys}" var="i" begin="0" end="0">
                                <img     src="<c:url value="/resources/image/image-roomcategory/${i.name}" />" alt="Image" class="img-fluid">
                            </c:forEach>
                            <a onclick="location.href = '<c:url value="/user/viewRoomDetail/${r.id}"/>'"  style="border-radius: 20px" href="#" class="btn theme_btn button_hover">Book Now</a>
                        </div>
                        <a href="#"><h4 class="sec_h4">${r.name}</h4></a>
                        <h5>${r.price}<small>VND /night</small></h5>
                    </div>
                </div>                   
            </c:forEach>
        </div>
                      
    </div>            
</section>
<!--================ Accomodation Area  =================-->
