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

        body{
            display:flex;

            justify-content:center;
        }
        .product{
            border-radius: 10px;
            margin: 15px;
            padding: 10px;

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
            align-items:center;
        }
        form{
            position:relative;
            top:10px;
            display:flex;
            align-items:center;
            justify-content:center;
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
        #box{
            width:100%;
            width: 96%;
            margin-top:50px;
            flex-wrap:wrap;
        }

    </style>

<body>

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

<%@ include file="/includes/footer.jsp" %>
</body>
</html>
