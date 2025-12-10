<%@ page import="com.ronak.model.Order" %>
<%@ page import="java.util.ArrayList" %>

<%
    if(request.getSession().getAttribute("user")==null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    ArrayList<Order> list = (ArrayList<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>PrimeBasket</title>
    <%@ include file="includes/header.jsp" %>
</head>
<body>

<%@ include file="includes/navbar.jsp" %>
<div class="container mt-5 pt-4">
    <h1 class="mb-4" style="color: #0d6efd;">Your Orders</h1>

    <% if (list == null || list.isEmpty()) { %>
    <div class="alert alert-info" role="alert">
        You currently have no active orders.
        <a href="<%=request.getContextPath()%>/" class="alert-link">Continue shopping</a>.
    </div>
    <% } else { %>

    <div class="table-responsive">
        <table class="table table-hover table-striped shadow-sm">
            <thead class="table-dark">
            <tr>
                <th scope="col">Item Name</th>
                <th scope="col" class="text-center">Price (Rs.)</th>
                <th scope="col" class="text-center">Quantity</th>
                <th scope="col" class="text-center">Total Amount (Rs.)</th>
                <th scope="col" class="text-right">Action</th>
            </tr>
            </thead>
            <% for (Order o : list) { %>
            <tr>
                <td class="align-middle">
                    <strong><%= o.getItemname() %></strong>
                </td>

                <td class="align-middle text-center"><%= o.getPrice() %></td>
                <td class="align-middle text-center"><%= o.getQuantity() %></td>
                <td class="align-middle text-center">
                    <span class="badge bg-success fs-6"><%= o.getAmount() %></span>
                </td>
                <td class="align-middle text-right">
                    <form action="delete" method="get" class="d-flex justify-content-end">
                        <input type="hidden" name="id" value="<%=o.getOid()%>">
                        <button type="submit" class="btn btn-sm btn-outline-danger">Cancel Order</button>
                    </form>
                </td>
            </tr>
            <% } %>

            </tbody>
        </table>
    </div>

    <% } %>

</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
