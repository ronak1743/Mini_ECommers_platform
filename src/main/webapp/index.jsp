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
<html lang="en">
<head>
    <title>PrimeBasket</title>
    <%@ include file="includes/header.jsp" %>
    <style>
        .transition-3d-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15) !important;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .card-img-top-custom {
            object-fit: contain;
            height: 200px;
            padding: 15px;
        }
    </style>
</head>
<body>

<%@ include file="includes/navbar.jsp" %>


<div class="container mt-5 pt-4">
    <h1 class="mb-4 text-primary">Browse Products</h1>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">


        <% for (Item i : list) { %>

        <div class="col">
            <div class="card shadow-sm h-100 transition-3d-hover">

                <img src="<%= i.getUrl() %>" class="card-img-top-custom" alt="<%= i.getName() %>">

                <div class="card-body d-flex flex-column">
                    <h5 class="card-title text-truncate" title="<%= i.getName() %>"><%= i.getName() %></h5>
                    <p class="card-text text-muted mb-3"><%= i.getDiscription() %></p>
                    <p class="card-text mt-auto">
                        <b class="fs-5 text-success"> <%= i.getPrice() %> Rs.</b>
                    </p>
                </div>

                <div class="card-footer bg-white border-0 pt-0">

                    <form method="get">
                        <input type="hidden" name="id" value="<%= i.getId() %>"/>

                        <div class="mb-3">

                            <label for="qty_<%= i.getId() %>" class="form-label d-block text-start">Quantity:</label>

                            <div class="d-flex align-items-center">
                                <input type="number" id="qty_<%= i.getId() %>" name="count" value="1" min="1" required class="form-control form-control-sm me-2 flex-grow-1">
                            </div>
                        </div>

                        <button type="submit" formaction="placeorder" class="btn btn-primary w-100 mb-2">Buy Now</button>
                        <button type="submit" formaction="addtocart" class="btn btn-outline-secondary w-100">Add to cart</button>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
<br>
<%@ include file="includes/footer.jsp" %>
</body>
</html>
