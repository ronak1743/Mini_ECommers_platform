<%@ page import="com.ronak.model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ronak.model.Carditem" %>

<%
    ArrayList<Carditem> list = (ArrayList<Carditem>) request.getAttribute("cartlist");
%>

<html>
<head>
    <title>Let's order </title>
    <%@ include file="includes/header.jsp" %>
    <link rel="stylesheet" href="ordercart.css">

    <style>
        #name{
            width: 30%;
        }
        #quant{
            width: 30%;
        }
        #del{
            width: 39%;
        }
        form{
            width: 100%;
        }
        #del_btn{
            margin-right: 3%;
        }
    </style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<div id="box">
    <%
        for (Carditem o : list) {
    %>
    <div class="product" id="cartlist">
        <div class="prod cart" id="name"><%= o.getItemname() %></div>
        <div class="prod cart" id="quant"><%= o.getQuantity() %></div>
        <div class="prod cart" id="del">
            <form method="post" class="cart">
                <input type="hidden" name="id" value="<%=o.getOid()%>">
                <button id="del_btn" type="submit" formaction="deletecart">Delete</button>
                <button type="submit" formaction="addtoorder">Order</button>
            </form>
        </div>
    </div>
    <% } %>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
