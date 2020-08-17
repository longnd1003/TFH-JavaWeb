<%@page import="entity.OrderDetail"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/header.jsp"%>


<div class="content">
    <div class="container my-5">
        <c:set var="user" value="${sessionScope.user}"/>
        <c:choose>
            <c:when test="${user != null}">
                <div><h3 class='text-center'>Xác nhận thanh toán</h3></div>
                <form action="checkout" method="post">
                    <div class="form-group">
                        <label for="customerName">Tên khách hàng</label>
                        <input type="text" class="form-control" id="customerName" value="${user.getFirstName() + " " + user.getLastName()}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Số điện thoại</label>
                        <input type="text" class="form-control" id="phoneNumber" value="${user.getPhone()}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="deliveryAddress">Địa chỉ nhận hàng</label>
                        <input type="text" class="form-control" id="deliveryAddress" name="deliveryAddress" value="" required>
                    </div>
                    <button type="submit" class="btn btn-danger">Submit</button>
                </form>
            </c:when>
            <c:otherwise>
                <c:redirect url="index"/>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@include file="/WEB-INF/footer.jsp"%>