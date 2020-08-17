<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/header.jsp"%>

<div class="content">
    <div class="container my-5">
        <c:set var="resList" value="${requestScope.resList}"/>
        <c:set var="foodList" value="${requestScope.foodList}"/>
        <c:choose>
            <c:when test="${resList != null}">
                <c:set var="i" value="1"/>
                <h2 class='text-center mt-5'>Kết quả tìm kiếm</h2>
                <div class="row mt-5">
                    <div class="col-1 my-3 row-header row-table">STT</div>
                    <div class="col-2 my-3 row-header row-table">Tên</div>
                    <div class="col my-3 row-header row-table">Địa chỉ</div>
                    <div class="col-2 my-3 row-header row-table">Giờ mở cửa</div>
                    <div class="col-2 my-3 row-header row-table">Điện thoại</div>
                </div>
                <c:forEach items="${resList}" var="res">
                    <div class="row">
                        <div class="col-1 my-3 row-table">${i}</div>
                        <div class="col-2 my-3 row-table">${res.getRestaurantName()}</div>
                        <div class="col my-3 row-table">${res.getAddress()}</div>
                        <div class="col-2 my-3 row-table">${res.getOpenTime()}</div>
                        <div class="col-2 my-3 row-table">${res.getPhone()}</div>
                        <c:set var="i" value="${i + 1}"/>
                    </div>
                </c:forEach>
            </c:when>
            <c:when test="${foodList != null}">
                <h2 class='text-center my-5'>Kết quả tìm kiếm</h2>
                <div class="row">
                    <c:set var="itemList" value="${foodList}"/>
                    <c:forEach items="${itemList}" var="item">
                        <div class="col">
                            <div class="card mx-auto mb-5">
                                <img src="${item.getImage()}" class="card-img-top item-img" alt=""/>
                                <div class="card-body text-center">
                                    <p class="item-name my-0">${item.getFoodName()}</p>
                                    <p class="item-price mb-2">
                                        <fmt:formatNumber type="number" pattern="###,### VND" value="${item.getPrice()}"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center">
                    <h2 class="mb-5">Không tìm thấy nội dung bạn yêu cầu!</h2>
                    <h3><a href="<%=request.getContextPath()%>">Trở về trang chủ</a></h3>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <%@include file="/WEB-INF/footer.jsp"%>