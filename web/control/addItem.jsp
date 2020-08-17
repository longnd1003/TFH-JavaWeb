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
        <title>Add an item - Control Panel</title>
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
                        <h1 class="mb-4">Add an item</h1>
                        <form action="addItem" method="post">
                            <div class="form-group">
                                <label for="item-name">Item Name</label>
                                <input type="text" name="foodName" class="form-control mb-3" id="item-name" required>
                                <label for="item-price">Price</label>
                                <input type="number" name="price" class="form-control mb-3" id="item-price" min="0" required>
                                <label for="item-category">Category</label>
                                <c:set var="catId" value="${param.catId}"/>
                                <div>
                                    <select name="categoryId" id="item-category" class="mb-4">
                                        <c:forEach items="${sessionScope.cats}" var="category">
                                            <option value="${category.getCategoryId()}" ${(category.getCategoryId() == catId) ? "selected" : ""}>
                                                ${category.getCategoryName()}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <label for="item-image">Enter image location</label>
                                <input type="text" name="image" class="form-control mb-3" id="item-image" value="img/item-img/" required>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-lg btn-primary mx-4 px-5">Add</button>
                                    <button type="reset" class="btn btn-lg btn-danger mx-4 px-5">Reset</button>
                                </div>
                            </div>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <c:redirect url="index"/>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap/popper.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/plugins/plugins.js"></script>
        <script src="js/active.js"></script>
    </body>
</html>
