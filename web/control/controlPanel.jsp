<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.CategoryDAO"%>
<%@page import="entity.Category"%>
<%@page import="entity.FoodItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Control Panel</title>
        <link rel="icon" href="img/core-img/favicon.png">
        <link rel="stylesheet" href="style.css">
        <script src="https://kit.fontawesome.com/9b81e7de6f.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="content">
            <c:choose>
                <c:when test="${sessionScope.admin != null}">
                    <div class="container my-5">
                        <div class="my-3">
                            <button type="button" class="btn btn btn-dark px-5" onclick="javascript:window.history.back();">
                                <i class="fas fa-arrow-left"></i>
                            </button>
                        </div>
                        <h1 class="mb-4">Item Management</h1>
                        <a href="addItem" class="btn btn-danger">ADD AN ITEM</a>
                        <div class="row mt-5">
                            <div class="col-1 my-3 row-header row-table">ID</div>
                            <div class="col my-3 row-header row-table">Name</div>
                            <div class="col-1 my-3 row-header row-table">Price</div>
                            <div class="col-2 my-3 row-header row-table">Category</div>
                            <div class="col my-3 row-header row-table">Added Date</div>
                            <div class="col my-3 row-header row-table">Image</div>
                            <div class="col-1 my-3 row-header row-table">Manage</div>
                        </div>
                        <c:set var="list" value="${requestScope.list}"/>
                        <c:forEach items="${list}" var="food">
                            <div class="row">
                                <div class="col-1 my-3 row-table">${food.getFoodId()}</div>
                                <div class="col my-3 row-table">${food.getFoodName()}</div>
                                <div class="col-1 my-3 row-table">${food.getPrice()}</div>
                                <div class="col-2 my-3 row-table">${food.getCategory().getCategoryName()}</div>
                                <div class="col my-3 row-table">${food.getAddedDate()}</div>
                                <div class="col my-3 pb-4 row-table"><img class="img-thumbnail" src="${food.getImage()}" alt=""/></div>
                                <div class="col-1 my-3 row-table">
                                    <div class="my-1">
                                        <a href="editItem?itemId=${food.getFoodId()}&catId=${food.getCategory().getCategoryId()}" class="btn btn-danger">EDIT</a>
                                    </div>
                                    <div class="my-1">
                                        <a href="removeItem?itemId=${food.getFoodId()}&catId=${food.getCategory().getCategoryId()}" class="btn btn-danger">REMOVE</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:redirect url="index"/>
                </c:otherwise>
            </c:choose>
        </div>
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
    </body>
</html>
