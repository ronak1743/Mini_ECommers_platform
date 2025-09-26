<% String path=request.getContextPath();%>
<style>
    .navigation {
        display: flex;
        width: auto;
        margin-right: 30px;
        background:white;
        z-index:100;
    }
    .navitem {
        margin-left: 10px;
        margin-right: 10px;
        font-size: x-large;
        color: gray;
        cursor: pointer;
    }
    .navitem:hover {
        color: black;
    }
    .navitem{
        text-decoration:none;
    }
    .navlink{
            text-decoration: auto;
            color: gray;

    }
    .navlink:hover{
        color:black;
    }
</style>

<div class="nav" style="position: fixed;

        height: 80px;
        width: 100%;
        background-color: white;
        box-shadow: 1px 1px 10px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        z-index:100;
        ">
    <div><h1 style="margin-left: 20px;">All products</h1></div>
    <div class="navigation">
        <h2 class="navitem"><a class="navlink" href="<%=path%>/"><b>Home</b></a></h2>
        <h2 class="navitem"><a class="navlink" href="<%=path%>/show"><b>Orders</b></a></h2>
        <h2 class="navitem"><a class="navlink" href="<%=path%>/showcart"><b>Carts</b></a></h2>
        <h2 class="navitem"><a class="navlink" href="<%=path%>/logout"><b>Log out</b></a></h2>
    </div>
</div>
<hr>
