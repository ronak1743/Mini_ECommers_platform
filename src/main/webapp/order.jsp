<%@ page import="com.ronak.model.Order" %>
<%@ page import="java.util.ArrayList" %>

<%
    if(request.getSession().getAttribute("user")==null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("orders");
%>

<html>
<head>
<title>Let's order </title>
<%@ include file="includes/header.jsp" %>
    <link rel="stylesheet" href="ordercart.css">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<div id="box">
<%
    for (Order o : list) {
%>
<div class="product">
        <div class="prod" id="name"><%= o.getItemname() %></div>
        <div class="prod" id="price"><%= o.getPrice() %></div>
        <div class="prod" id="quant"><%= o.getQuantity() %></div>
        <div class="prod" id="ammount"><%= o.getAmount() %></div>
        <div class="prod" id="del">
            <form action="delete" method="get">
                <input type="hidden" name="id" value="<%=o.getOid()%>">
                <button type="submit" >Delete</button>
            </form>
        </div>
    </div>
<% } %>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
