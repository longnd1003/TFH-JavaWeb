<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/header.jsp"%>

<div class="content">
    <div class="container my-5">
        <div><h1>THANH TOÁN THÀNH CÔNG!</h1></div>
        <div class="text-right">
            <a href="<%=request.getContextPath()%>"> <button class="my-3 btn btn-danger" type="button">TIẾP TỤC MUA SẮM</button></a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/footer.jsp"%>