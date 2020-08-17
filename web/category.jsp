<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/header.jsp"%>

<c:set var="catId" value="${param.id}"/>
<c:set var="category" value="${requestScope.category}"/>
<style>
    .bg-category {
        width: 100%;
        height: 400px;
        background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
            url('${category.getImage()}');
        background-size: cover;
        background-position: 0% 80%;
    }
</style>

<div class="bg-category">
    <h2>${category.getCategoryName()}</h2>
</div>

<div class="content">
    <div class="container my-5">
        <div class="row">
            <c:set var="itemList" value="${requestScope.pagination}"/>
            <c:set var="fullItems" value="${requestScope.fullItems}"/>
            <c:forEach items="${itemList}" var="item">
                <div class="col">
                    <div class="card mx-auto mb-5">
                        <img src="${item.getImage()}" class="card-img-top item-img" alt=""/>
                        <div class="card-body text-center">
                            <p class="item-name my-0">${item.getFoodName()}</p>
                            <fmt:formatNumber type="number" pattern="###,### VND" value="${item.getPrice()}"/>
                            <a href="addToCart?id=${item.getFoodId()}&catId=${catId}&q=1" class="btn btn-danger">CHỌN</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:set var="numOfPage" value="${requestScope.numOfPage}"/>
            <c:set var="a"/>
            <c:set var="b"/>
        </div>
        <c:if test="${numOfPage > 0}">
            <nav aria-label="Pagination">
                <ul class="pagination justify-content-center">
                    <c:set var="i" value="1"/>
                    <c:forEach begin="1" end="${numOfPage}" step="1">
                        <c:set var="a" value="${(i - 1) * 6}"/>
                        <c:set var="b" value="${i * 6}"/>
                        <c:if test="${b > fullItems.size()}">
                            <c:set var="b" value="${fullItems.size() - 1}"/>
                        </c:if>
                        <li class="page-item mx-2">
                            <a class="page-link" href="category?id=${catId}&s=${a}&e=${b}">${i}</a>
                        </li>
                        <c:set var="i" value="${i + 1}"/>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>
    </div>
</div>

<%@include file="/WEB-INF/footer.jsp"%>