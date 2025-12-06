<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fafafa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 350px;
            text-align: center;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 40px;
            font-weight: bold;
        }
        h2 {
            font-size: 22px;
            margin-bottom: 30px;
        }
        .input-box {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ddd;
            display: flex;
            align-items: center;
            background: #fff;
        }
        .input-box input {
            width: 100%;
            border: none;
            outline: none;
            margin-left: 8px;
            font-size: 14px;
        }
        .login-btn {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-btn:hover {
            opacity: 0.9;
        }
        .signup-text {
            margin-top: 15px;
            font-size: 13px;
        }
        .signup-text a {
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login Page</h1>
        <h2>Welcome!</h2>

        <form action="loginServlet" method="post">
            <div class="input-box">
                <span>&#9993;</span>
                <input type="email" name="email" placeholder="E-mail" required />
            </div>

            <div class="input-box">
                <span>&#128274;</span>
                <input type="password" name="password" placeholder="Password" required />
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>

        <div class="signup-text">
            No account yet? <a href="signup.jsp">Sign up here</a>
        </div>
    </div>
</body>
</html>
