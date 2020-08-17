<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí tài khoản - TheFastfoodHouse</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="style.css">
        <link rel="icon" href="img/core-img/favicon.png">
    </head>
    <body class="bg-reg">
        <div class="container">
            <div class="login-box">
                <form action="register" method="post">
                    <h1>Đăng kí</h1>
                    <div class="input-box">
                        <i class="fas fa-pen"></i>
                        <input type="text" name="firstName" placeholder="Tên" pattern='([A-Za-z]+\s*)+' minlength="1" required>
                    </div>
                    <div class="input-box">
                        <i class="fas fa-pen"></i>
                        <input type="text" name="lastName" placeholder="Họ" pattern='([A-Za-z]+\s*)+' minlength="1" required>
                    </div>
                    <div class="input-box">
                        <i class="fa fa-user"></i>
                        <input type="text" name="username" placeholder="Tên đăng nhập" pattern='\w+' required>
                    </div>
                    <div class="input-box">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="password" placeholder="Mật khẩu" pattern='.{6,40}' title='Tối thiểu 6 và tối đa 50 kí tự' required>
                    </div>
                    <div class="input-box">
                        <i class="fas fa-at"></i>
                        <input type="email" name="email" placeholder="Email" required>
                    </div>
                    <div class="input-box">
                        <i class="fas fa-mobile-alt"></i>
                        <input type="text" name="phone" placeholder="Số điện thoại" pattern='\d{10,11}' required>
                    </div>
                    <p class="text-danger">${requestScope.error}</p>
                    <button type="submit" class="btn btn-lg btn-danger mt-4 mb-2 mx-5">Đăng kí</button>
                    <button type="reset" class="btn btn-lg btn-info mt-4 mb-2 mx-5">Đặt lại</button>
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
