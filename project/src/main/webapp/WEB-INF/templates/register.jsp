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

        <%
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");
        %>
        
        <% if (error != null && !error.isEmpty()) { %>
            <div style="color: red; padding: 10px; margin-bottom: 15px; background: #ffe0e0; border-radius: 5px;">
                <%= error %>
            </div>
        <% } %>
        
        <% if (success != null && !success.isEmpty()) { %>
            <div style="color: green; padding: 10px; margin-bottom: 15px; background: #e0ffe0; border-radius: 5px;">
                <%= success %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/auth/register" method="post">

            <input type="email" 
                   name="email" 
                   placeholder="E-mail" 
                   class="input-field" required>

            <input type="text" 
                   name="firstName" 
                   placeholder="First Name" 
                   class="input-field" required>

            <input type="text" 
                   name="lastName" 
                   placeholder="Last Name" 
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

                <input type="radio" id="student" name="role" value="STUDENT" checked>
                <label for="student">👨‍🎓 Student</label><br><br>

                <input type="radio" id="professional" name="role" value="PROFESSIONAL">
                <label for="professional">👨‍⚕️ Professional</label><br><br>

                <input type="radio" id="admin" name="role" value="ADMIN">
                <label for="admin">👨‍💼 Admin</label>
            </div>

            <button type="submit" class="btn">Sign up</button>

        </form>

    </div>

</body>
</html>
