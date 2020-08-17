<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/header.jsp"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">
    <div id="highlightCarousel" class="carousel slide mb-5" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#highlightCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#highlightCarousel" data-slide-to="1"></li>
            <li data-target="#highlightCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active" data-interval="1000">
                <img src="img/bg-img/carousel1.jpg" class="d-block w-100 carousel-img" alt="...">
            </div>
            <div class="carousel-item" data-interval="1000">
                <img src="img/bg-img/carousel2.jpg" class="d-block w-100 carousel-img" alt="...">
            </div>
            <div class="carousel-item" data-interval="1000">
                <img src="img/bg-img/carousel3.jpg" class="d-block w-100 carousel-img" alt="...">
            </div>
        </div>
    </div>
    <div class="container my-5 pt-5">
        <h2 class="section-title mt-5">Món ăn mới <span class="badge badge-pill badge-warning">New</span></h2>
        <section>
            <div class="row">
                <c:set var="newItems" value="${requestScope.newItems}"/>
                <c:forEach items="${newItems}" var="item">
                    <div class="col">
                        <div class="card mx-auto my-5">
                            <img src="${item.getImage()}" class="card-img-top item-img" alt=""/>
                            <div class="card-body text-center">
                                <p class="item-name my-0">${item.getFoodName()}</p>
                                <fmt:formatNumber type="number" pattern="###,### VND" value="${item.getPrice()}"/>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <h2 class="section-title mt-5">Món ăn bán chạy <span class="badge badge-pill badge-danger">Hot</span></h2>
        <section>
            <div class="row">
                <c:set var="hotItems" value="${requestScope.hotItems}"/>
                <c:forEach items="${hotItems}" var="item">
                    <div class="col">
                        <div class="card mx-auto my-5">
                            <img src="${item.getImage()}" class="card-img-top item-img" alt=""/>
                            <div class="card-body text-center">
                                <p class="item-name my-0">${item.getFoodName()}</p>
                                <fmt:formatNumber type="number" pattern="###,### VND" value="${item.getPrice()}"/>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
</div>

<%@include file="/WEB-INF/footer.jsp"%>