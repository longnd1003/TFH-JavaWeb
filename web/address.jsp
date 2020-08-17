<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/header.jsp"%>

<style>
    .bg-category {
        width: 100%;
        height: 400px;
        background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
            url('img/bg-img/bg-address.jpg');
        background-size: cover;
        background-position: 0% 80%;
    }
</style>
<div class="bg-category">
    <h2 class='text-center'>Hệ thống cửa hàng</h2>
</div>

<div class="content">
    <div class="container my-5">
        <div class="row mt-5">
            <div class="col-1 my-3 row-header row-table">STT</div>
            <div class="col-2 my-3 row-header row-table">Tên</div>
            <div class="col my-3 row-header row-table">Địa chỉ</div>
            <div class="col-2 my-3 row-header row-table">Giờ mở cửa</div>
            <div class="col-2 my-3 row-header row-table">Điện thoại</div>
        </div>
        <c:set var="i" value="1"/>
        <c:forEach items="${requestScope.list}" var="res">
            <div class="row">
                <div class="col-1 my-3 row-table"><c:out value="${i}"/></div>
                <div class="col-2 my-3 row-table">${res.getRestaurantName()}</div>
                <div class="col my-3 row-table">${res.getAddress()}</div>
                <div class="col-2 my-3 row-table">${res.getOpenTime()}</div>
                <div class="col-2 my-3 row-table">${res.getPhone()}</div>
                <c:set var="i" value="${i + 1}"/>
            </div>
        </c:forEach>
    </div>
</div>

<%@include file="/WEB-INF/footer.jsp"%>