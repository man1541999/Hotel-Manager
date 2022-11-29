<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="banner_area">
    <div class="booking_table d_flex align-items-center">
        <div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background=""></div>
        <div class="container">
            <div class="banner_content text-center">
                <h6>Away from monotonous life</h6>
                <h2>Relax Your Mind</h2>
                <p>If you are looking at blank cassettes on the web, you may be very confused at the<br> difference in price. You may see some for as low as $.17 each.</p>
                <a href="#" class="btn theme_btn button_hover">Get Started</a>
            </div>
        </div>
    </div>
    <form class="form-inline float-right" method="post" 
          action="${pageContext.request.contextPath}/user/search-room">
        <div class="hotel_booking_area position">
            <div class="container">
                <div class="hotel_booking_table">
                    <div class="col-md-3">
                        <h2>Book<br> Your Room</h2>
                    </div>
                    <div class="col-md-9">                    
                        <div class="boking_table">                        
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="book_tabel_item">
                                        <div class="form-group" >
                                            <div class='input-group date ' >
                                                <input type="date" name="searchCheckIn" class="form-control" placeholder="Arrival Date"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class='input-group date'>
                                                <input type="date" name="searchCheckOut" class="form-control" placeholder="Departure Date"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>                            
                                <div class="col-md-4">
                                    <div class="book_tabel_item">
                                        <div class="input-group">
                                            
                                            <select class="wide" name="nameroom">  
                                                <option>Room Type</option>
                                                <c:forEach items="${roomcate}" var="r">
                                                    <option value="${r.name}">${r.name}</option>
                                                </c:forEach>                                           
                                            </select>   
                                        </div>                                       
                                        <button type="submit" style="border-radius: 5px" class="book_now_btn button_hover" >Search</button>
                                    </div>
                                </div>                              
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>




</section>