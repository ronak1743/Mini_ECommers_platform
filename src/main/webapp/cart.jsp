<%@ page import="com.ronak.model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ronak.model.Carditem" %>

<%
    if(request.getSession().getAttribute("user")==null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    ArrayList<Carditem> list = (ArrayList<Carditem>) request.getAttribute("cartlist");
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
    <h1 class="mb-4" style="color: #0d6efd;">Your Shopping Cart</h1>

    <% if (list == null || list.isEmpty()) { %>
    <div class="alert alert-info" role="alert">
        Your cart is currently empty.
        <a href="<%=request.getContextPath()%>/" class="alert-link">Continue shopping</a>.
    </div>
    <% } else { %>
    <div class="table-responsive">
        <table class="table table-hover table-striped shadow-sm">
            <thead class="table-dark">
            <tr>
                <th scope="col">Item Name</th>
                <th scope="col" class="text-center">Quantity</th>
                <th scope="col" class="text-right">Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Carditem o : list) { %>
            <tr>
                <td class="align-middle">
                    <strong><%= o.getItemname() %></strong>
                </td>

                <td class="align-middle text-center">
                    <span class="badge bg-secondary"><%= o.getQuantity() %></span>
                </td>

                <td class="align-middle text-right">
                    <form method="post" class="d-flex justify-content-end">
                        <input type="hidden" name="id" value="<%=o.getOid()%>">

                        <button type="submit" formaction="deletecart" class="btn btn-sm btn-outline-danger me-2">
                            Delete
                        </button>

                        <button type="submit" formaction="addtoorder" class="btn btn-sm btn-success">
                            Order Now
                        </button>
                    </form>
                </td>
            </tr>
            <% } %>

            </tbody>
        </table>
    </div>

    <div class="row justify-content-end mt-4">
        <div class="col-md-4">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title">Cart Summary</h5>
                    <p class="card-text">Total Items: <b><%= list.size() %></b></p>
                    <button class="btn btn-primary w-100">Proceed to Checkout</button>
                </div>
            </div>
        </div>
    </div>
    <% } %>

</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
