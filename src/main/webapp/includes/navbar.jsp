<%
    String path = request.getContextPath();
    String current = request.getRequestURI();
%>

<style>

    .navbar .nav-link:hover {
        color: #0d6efd !important;
        font-weight: bold;
    }

    .navbar .nav-link.active {
        color: #0d6efd !important;
        font-weight: bold;
        border-bottom: 2px solid #0d6efd;
    }

    .logout a:hover{
        color: white !important;
    }
</style>


<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
    <div class="container-fluid">

        <a class="navbar-brand ms-3" href="<%=path%>/">
            <img src="https://cdn-icons-png.flaticon.com/512/34/34568.png"
                 alt="Logo" width="30" height="30"
                 class="d-inline-block align-text-top">
            <strong>All Products</strong>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto me-3">

                <a class="nav-link <%= (current.equals(path) || current.equals(path + "/")||current.equals(path+"/index.jsp")) ? "active" : "" %>"
                   href="<%=path%>/">
                    <b>Home</b>
                </a>

                <a class="nav-link <%= current.contains(path + "/order.jsp") ? "active" : "" %>"
                   href="<%=path%>/show">
                    <b>Orders</b>
                </a>

                <a class="nav-link <%= current.contains(path + "/cart.jsp") ? "active" : "" %>"
                   href="<%=path%>/showcart">
                    <b>Carts</b>
                </a>


                <li class="nav-item logout">
                    <a class=" btn btn-outline-danger ms-2"
                       href="<%=path%>/logout">
                        <b>Log Out</b>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<div style="margin-top: 80px;"></div>
