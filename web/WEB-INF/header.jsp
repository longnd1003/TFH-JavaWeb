<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Item"%>
<%@page import="model.Cart"%>
<%@page import="model.CategoryDAO"%>
<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>TheFastfoodHouse</title>
        <link rel="icon" href="img/core-img/favicon.png">
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <!-- Preloader -->
        <div id="preloader">
            <i class="circle-preloader"></i>
            <img src="img/core-img/pizza.png" alt="">
        </div>

        <!-- Search Wrapper -->
        <div class="search-wrapper">
            <!-- Close Btn -->
            <div class="close-btn"><i class="fa fa-times" aria-hidden="true"></i></div>

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <form action="search" method="get">
                            <input type="search" name="keyword" placeholder="Nhập từ khóa...">
                            <select name="searchType">
                                <option value="restaurant">Cửa hàng</option>
                                <option value="foodItem">Món ăn</option>
                            </select>
                            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <header class="header-area">
            <div class="top-header-area">
                <div class="container h-100">
                    <div class="row h-100 align-items-center justify-content-between">
                        <div class="col-12 col-sm-6">
                            <div class="breaking-news">
                                <div id="breakingNewsTicker" class="ticker">
                                    <ul>
                                        <li><a href="#">Giao hàng tận nơi</a></li>
                                        <li><a href="#">Thanh toán tiện lợi, nhanh chóng</a></li>
                                        <li><a href="#">Món ăn hấp dẫn, phong phú</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6">
                            <div class="top-social-info text-right">
                                <c:choose>
                                    <c:when test="${sessionScope.admin != null}">
                                        <a href="#">Welcome ${sessionScope.admin.loginName}</a>
                                        <a href="control">Control panel</a>
                                        <a href="logout">Đăng xuất</a>
                                    </c:when>
                                    <c:when test="${sessionScope.user != null}">
                                        <a href="#">Welcome ${sessionScope.user.firstName}</a>
                                        <a href="logout">Đăng xuất</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="login">Đăng nhập</a>
                                        <a href="register">Đăng kí</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-main-menu">
                <div class="classy-nav-container breakpoint-off">
                    <div class="container">
                        <nav class="classy-navbar justify-content-between" id="deliciousNav">
                            <a class="nav-brand" href="./"><img src="img/core-img/logo.png" alt=""></a>
                            <div class="classy-navbar-toggler">
                                <span class="navbarToggler"><span></span><span></span><span></span></span>
                            </div>
                            <div class="classy-menu">
                                <div class="classycloseIcon">
                                    <div class="cross-wrap">
                                        <span class="top"></span>
                                        <span class="bottom"></span>
                                    </div>
                                </div>
                                <div class="classynav">
                                    <ul>
                                        <li><a href="<%=request.getContextPath()%>"><i class="fas fa-home mr-15"></i>Trang chủ</a></li>
                                        <li><a href="#"><i class="fas fa-grip-vertical mr-15"></i>Thực đơn</a>
                                            <ul class="dropdown">
                                                <c:set var="cats" value="${sessionScope.cats}"/>
                                                <c:forEach items="${cats}" var="cat">
                                                    <li>
                                                        <a href="category?id=${cat.getCategoryId()}">${cat.getCategoryName()}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li><a href="address"><i class="fas fa-map-marked-alt mr-15"></i>Cửa hàng</a></li>
                                        <li><a class="search-btn" href="#"><i class="fas fa-search mr-15"></i>Tìm kiếm</a></li>
                                        <li>
                                            <a href="cart">
                                                <i class="fas fa-shopping-cart mr-15"></i>Giỏ hàng
                                                <c:set var="cart" value="${sessionScope.cart}"/>
                                                <c:if test="${cart != null}">
                                                    <c:set var="sum" value="${cart.getSum()}"/>    
                                                    <span class="badge badge-pill badge-danger">${sum}</span>
                                                </c:if>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>