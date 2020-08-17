<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>TheFastfoodHouse</title>
        <link rel="icon" href="img/core-img/favicon.png">
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <div class="welcome text-center">
            <img src="img/core-img/logo.png" alt=""/>
            <h1 class="welcome-title mt-5 mb-4">Đăng kí thành công!</h1>
            <h2>Hệ thống sẽ tự động chuyển đến trang đăng nhập trong <span id='timeCount'></span> giây...</h2>
        </div>
        <script>
            var time = 3;
            var interval = setInterval(timer, 1000);
            function timer() {
                document.getElementById("timeCount").innerHTML = time;
                time--;
                if (time < 0) {
                    clearInterval(interval);
                    location.href = "login";
                }
            }
        </script>
    </body>

</html>
