<%-- 
    Document   : add-account
    Created on : Nov 14, 2022, 7:43:52 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css" />" 
              rel="stylesheet" type="text/css" />
    </head>

    <body>

        <section class="h-100 bg-dark">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card card-registration my-4">
                            <div class="row g-0">
                                <div class="col-xl-6 d-none d-xl-block">
                                    <img  src="<c:url value="/resources/image/anh-register.jpg"/>"
                                         alt="Sample photo" class="img-fluid"
                                         style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem; padding-top: 5px ;height: 95%" />
                                </div>
                                <div class="col-xl-6">
                                    <div class="card-body p-md-5 text-black">
                                        <h3 style="text-align: center" class="mb-5 text-uppercase">REGISTER</h3>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Example1m" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example1m">Fullname</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Example1n" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example1n">PhoneNumber</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <input type="date" id="form3Example1m1" class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Example1m1">BirthDay</label>
                                                </div>
                                            </div>
                                           
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example8" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example8">Address</label>
                                        </div>

                                        

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <label class="form-label">Gender:        </label>
                                                <select class="select">
                                                    <option value="{gender}"></option>
                                                    
                                                </select>

                                            </div>

                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example90" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example90">Email</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="form3Example99" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example99">Password</label>
                                        </div>

                                        <div  class="d-flex justify-content-end pt-3">
                                            <button type="button" class="btn btn-warning btn-lg ms-2">Submit form</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
