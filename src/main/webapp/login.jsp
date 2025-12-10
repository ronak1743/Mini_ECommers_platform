<html>
<head>
    <title>PrimeBasket</title>
    <%@ include file="includes/header.jsp" %>

    <style>
        body {
            background: #d4d4d491;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px;
        }

        .login-img-header {
            height: 200px;
            background:
                    linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                    url('https://images.pexels.com/photos/4195409/pexels-photo-4195409.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') no-repeat center center;
            background-size: cover;
        }
    </style>
</head>
<body>

<div class="card login shadow-lg" style="max-width: 700px; width: 100%;">

    <div class="login-img-header d-flex align-items-center justify-content-center">
        <h1 class="text-white display-4">Sign In</h1>
    </div>

    <div class="card-body p-4 p-md-5">
        <form action="login" method="post" class="needs-validation" novalidate>

            <div class="mb-4 row align-items-center">
                <label for="nameInput" class="col-sm-3 col-form-label text-sm-end text-primary fw-bold">Username</label>
                <div class="col-sm-9">
                    <input type="text" id="nameInput" name="name" class="form-control form-control-lg" placeholder="Enter username" required />
                </div>
            </div>

            <div class="mb-4 row align-items-center">
                <label for="passInput" class="col-sm-3 col-form-label text-sm-end text-primary fw-bold">Password</label>
                <div class="col-sm-9">
                    <input type="password" id="passInput" name="pass" class="form-control form-control-lg" placeholder="Enter Password" required />
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="rememberme" name="rememberme"/>
                        <label class="form-check-label text-muted" for="rememberme">Remember me</label>
                    </div>
                </div>
                <div class="col-md-6 text-md-end mt-2 mt-md-0">
                    <a href="http://localhost:9090/Mini_E-commers_Platform/signup.jsp" class="text-primary text-decoration-none fw-semibold">Create new account</a>
                </div>
            </div>

            <div class="d-grid gap-2 mt-5">
                <button type="submit" class="btn btn-primary btn-lg shadow-sm">
                    LOGIN
                </button>
            </div>
        </form>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

<script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>

</body>
</html>
