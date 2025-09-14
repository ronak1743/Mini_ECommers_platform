<html>
<head>
    <title>Let's order</title>
    <style>
        body {
            margin: 0;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 15px;
            background: orange;
        }

        .login {
            position: relative;
            background-color: #ffffff;
            max-width: 700px;
            width: 100%;
            min-height: 550px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            display: flex;
            flex-direction: column;
        }

        .loginImg {
            width: 100%;
            height:200px;
            background-color: #000000;
            display: flex;
            align-items: center;
            justify-content: center;
            background:
                    linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                    url('https://images.pexels.com/photos/4195409/pexels-photo-4195409.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') no-repeat center center;
                background-size: cover;
        }

        .loginImg > h1 {
            font-size: 3rem;
            color: #ffffff;
            margin: 0px;
        }


        .lables{
            display:flex;
            align-items:center;
            justify-content:center;
            width:100%;
        }
        .lables>h3{
            display:inline-block;
            margin:30px;
            margin-left:40px;
            font-size:17px;
            color:gray;
        }

        .lables > input {
            padding: 10px 5px;
            margin-left: 10px;
            width: 70%;

            background: transparent;
            border: none;
            border-bottom: 2px solid #000;
            outline: none;
            font-size: 16px;
            transition: border-color 0.3s;
        }



        .lables > input:focus {
            border-bottom-color: #57b846;
        }

        form>button{
            background:#57b846;
            padding: 5px 30px;
            border:0px;
           border-radius: 30px;
               width: auto;
               position: absolute;
               bottom: 15%;
               left: 44%;
               color:white;
               font-size:20px;
               text-style:bold;

        }
        .check{
            position:absolute;
            left:26%;
            top:370px;
            color:gray;
            cursor: pointer;
        }
        .check>label{
            cursor: pointer;
        }
        .already{
            position:absolute;
            left:65%;
            color:gray;
            cursor: pointer;
            top:370px;
            text-decoration:none;
        }
        .already>a{
            color:gray;
            text-decoration:none;
        }

    </style>
</head>
<body>

    <%@ include file="/includes/header.jsp" %>

    <div class="login">

        <div class="loginImg">
            <h1>Sign In</h1>
        </div>

        <div class="loginForm">
            <form action="login" Method="post">
                <div class="lables">
                    <h3>Username</h3>
                    <input type="text" name="name" class="lineinp" placeholder="Enter username"/>
                </div>
                <div class="lables">
                    <h3>Password</h3>
                    <input type="password" name="pass" class="lineinp" placeholder="Enter Password"/>
                </div>

                <div class="check">
                    <input type="checkbox" id="rememberme" name="rememberme"/>
                    <label for="rememberme">Remember me</label>
                </div>
                <div class="already">
                    <a href="http://localhost:9090/Mini_E-commers_Platform/signup.jsp">Create new account</a>
                </div>

                <button type="submit"><b>LOGIN</b></button>
            </form>
        </div>
    </div>

    <%@ include file="/includes/footer.jsp" %>

</body>
</html>
