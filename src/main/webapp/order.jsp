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

<style>
        .product{
            border-radius: 10px;
            margin: 5px;
            padding: 10px;
            width: 100%;
            height: 90px;
            background-color: white;
            display: flex;
            align-items: center;
            box-shadow: 1px 1px 10px;
        }
        #name{
            width: 30%;
            font-size: 20px;
            font-weight: bold;
            height: 100%;
            display: flex;
            flex-wrap: wrap;
            align-items: center;

        }
        .prod{
            font-size: 20px;
            width: 20%;
            font-weight: bold;
        }
        button{

            border-radius: 10px;
            border: 0px;
            width: 90%;
            background-color: rgb(0, 106, 255);
            color: white;
            height: 50px;
            padding: 5px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }


    </style>

<body class="container">

<%
    for (Order o : list) {
%>
<div class="product">
        <span class="prod" id="name"><%= o.getItemname() %></span>
        <span class="prod" id="price"><%= o.getPrice() %></span>
        <span class="prod" id="quant"><%= o.getQuantity() %></span>
        <span class="prod" id="ammount"><%= o.getPrice() %></span>
        <span class="prod" id="del">
            <form action="delet" method="get">
                <input type="hidden" name="id" value="id">
                <button type="submit">Delet</button>
            </form>
        </span>

    </div>

<% } %>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>
