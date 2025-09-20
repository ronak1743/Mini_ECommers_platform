<%@ page import="com.ronak.model.Order" %>
<%@ page import="java.util.ArrayList" %>

<%
    ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("orders");
%>

<html>
<head>
<title>Let's order </title>
<%@ include file="/includes/header.jsp" %>
</head>
<body class="container">

<h2>Hello World!</h2>
<%
    for (Order o : list) {
%>
    <div>
        <h4><%= o.getUser() %></h4>
        <h4><%= o.getItemname() %></h4>
        <h4><%= o.getOid() %></h4>
        <h4><%= o.getAmount() %></h4>
        <h4><%= o.getQuantity() %></h4>
        <h4><%= o.getPrice() %></h4>
    </div>
<% } %>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>
