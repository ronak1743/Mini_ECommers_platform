<%
    HttpSession hs=(HttpSession)request.getSession();
    String user=(String)hs.getAttribute("user");
    if(user==null){
        response.sendRedirect(request.getContextPath()+"/login.jsp");
        return;
    }

%>

<html>
<head>
<title>Let's order </title>
<%@ include file="/includes/header.jsp" %>
</head
<body class="container">

<h2>Hello World!</h2>



<%@ include file="/includes/footer.jsp" %>
</body>
</html>
