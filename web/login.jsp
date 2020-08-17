<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập - TheFastfoodHouse</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="style.css">
        <link rel="icon" href="img/core-img/favicon.png">
    </head>
    <body class="bg-login">
        <div class="container">
            <div class="login-box">
                <form action="login" method="post">
                    <h1>Đăng nhập</h1>
                    <div class="input-box">
                        <i class="fa fa-user"></i>
                        <input type="text" name="username" placeholder="Tên đăng nhập" required>
                    </div>
                    <div class="input-box">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="password" placeholder="Mật khẩu" required>
                    </div>
                    <p class="info-text text-danger">${requestScope.error}</p>
                    <button type="submit" class="btn btn-lg btn-danger mt-4 mb-2">Đăng nhập</button>
                    <p class="info-text">Chưa có tài khoản? <a class="text-primary" href="register">Đăng kí tại đây</a>!</p>
                </form>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/9b81e7de6f.js" crossorigin="anonymous"></script>
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap/popper.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/plugins/plugins.js"></script>
        <script src="js/active.js"></script>
    </body>
</html>
