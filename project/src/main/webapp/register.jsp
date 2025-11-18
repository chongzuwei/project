<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Page</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 360px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .role-box {
            margin-top: 15px;
            padding: 15px;
            border-radius: 10px;
            background: #fafafa;
            border: 1px solid #ddd;
        }

        .btn {
            width: 100%;
            padding: 14px;
            margin-top: 20px;
            background: black;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background: #333;
        }
    </style>

</head>
<body>

    <div class="container">
        <h2>Registration Page</h2>
        <h3 style="text-align:center;">Welcome!</h3>

        <form action="register" method="post">

            <input type="email" 
                   name="email" 
                   placeholder="E-mail" 
                   class="input-field" required>

            <input type="text" 
                   name="name" 
                   placeholder="Name" 
                   class="input-field" required>

            <input type="password" 
                   name="password" 
                   placeholder="Password" 
                   class="input-field" required>

            <input type="password" 
                   name="confirmPassword" 
                   placeholder="Confirm password" 
                   class="input-field" required>

            <div class="role-box">
                <strong>Select Your Role</strong><br><br>

                <input type="radio" id="student" name="role" value="student" checked>
                <label for="student">Student</label><br><br>

                <input type="radio" id="professional" name="role" value="professional">
                <label for="professional">Mental Health Professional</label>
            </div>

            <button type="submit" class="btn">Sign up</button>

        </form>

    </div>

</body>
</html>
