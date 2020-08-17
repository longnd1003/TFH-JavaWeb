<%@page import="entity.OrderDetail"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/header.jsp"%>

<div class="content">
    <div class="container my-5">
        <%  
            ArrayList<Item> list = (ArrayList<Item>) session.getAttribute("list");
            if (list.size() > 0) {
        %>
        <div class="row mt-5">
            <div class="col-1 my-3 row-header row-table">STT</div>
            <div class="col my-3 row-header row-table">Tên món</div>
            <div class="col-2 my-3 row-header row-table">Đơn giá</div>
            <div class="col-2 my-3 row-header row-table">Số lượng</div>
            <div class="col-2 my-3 row-header row-table">Thành tiền</div>
            <div class="col-1 my-3 row-header row-table">Thao tác</div>
        </div>
        <%
            int i = 1;
            int total = cart.totalMoney();
            DecimalFormat formatter = new DecimalFormat("###,###");
            ArrayList<OrderDetail> order = (ArrayList<OrderDetail>) session.getAttribute("order");
            if (order == null) {
                order = new ArrayList<>();
            }
            for (Item item : list) {
                
        %>
        <div class="row">
            <div class="col-1 my-3 row-table"><%=i++%></div>
            <div class="col my-3 row-table"><%=item.getFood().getFoodName()%></div>
            <div class="col-2 my-3 row-table"><%=formatter.format(item.getFood().getPrice())%></div>
            <div class="col-2 my-3 pb-4 row-table"><%=item.getQuantity()%></div>
            <div class="col-2 my-3 row-table"><%=formatter.format(item.getQuantity() * item.getFood().getPrice())%></div>
            <div class="col-2 my-3 row-table"><a href="returnItem?id=<%=item.getFood().getFoodId()%>" class="btn btn-danger">Trả</a></div>
        </div>
        <%
            OrderDetail od = new OrderDetail(0, item.getFood().getFoodId(), item.getFood().getPrice(),
                    "", item.getQuantity());
            order.add(od);
            session.setAttribute("order", order);
            }
        %>
        <div class="text-right">
            <h5 class="my-3">Tổng số tiền phải thanh toán: <%=formatter.format(total)%> VND</h5>
            <form action="checkout" method="get">
                <button class="my-3 btn btn-danger" type="submit">THANH TOÁN</button>
            </form>
        </div>
        <%
        } else {
        %>
        <div class="text-center">
            <h2>Giỏ hàng của bạn còn trống</h2>
            <a href="<%=request.getContextPath()%>" class="btn btn-danger">MUA NGAY</a>
        </div>
        <%
            }
        %>
    </div>
</div>

<%@include file="/WEB-INF/footer.jsp"%>