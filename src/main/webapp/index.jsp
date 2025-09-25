<%-- Import the necessary Java classes --%>
<%@ page import="com.ronak.model.Connecter" %>
<%@ page import="com.ronak.model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>

<%
    HttpSession hs = request.getSession();
    String user = (String) hs.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    Connecter c = new Connecter();
    ArrayList<Item> list = c.getList();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Let's order</title>
    <%@ include file="/includes/header.jsp" %>
    <style>
        .itemlist{
            margin-top:90px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .item{
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            text-align: center;
            transition: transform 0.2s ease-in-out;
        }
        .item:hover {
            transform: scale(1.05);
        }
        .item img {
            width: 100%;
            height: 200px;
            object-fit: contain;
        }
        .details {
            padding: 10px;
        }
        .details h3 {
            margin: 5px 0;
            font-size: 18px;
        }
        .details p {
            margin: 5px 0;
            color: #666;
        }
        .details b {
            color: green;
            font-size: 16px;
        }
        .buy-btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            text-align: center;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background 0.2s ease;
        }
        .buy-btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body style="margin-top:-15px">

<%@ include file="includes/navbar.jsp" %>

<div class="itemlist">
    <% for (Item i : list) { %>
        <div class="item">
            <img src="<%= i.getUrl() %>" alt="<%= i.getName() %>"/>
            <div class="details">
                <h3><%= i.getName() %></h3>
                <p><%= i.getDiscription() %></p>
                <b> <%= i.getPrice() %> Rs.</b>
                <form action="placeorder" method="get">
                 <input type="hidden" name="id" value="<%= i.getId() %>"/>
                 <label for="qty_<%= i.getId() %>">Quantity:</label>
                 <input type="number" id="qty_<%= i.getId() %>" name="count" value="1" min="1" required/>
                 <button type="submit" class="buy-btn">Buy Now</button>
                </form>
            </div>
        </div>
    <% } %>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>