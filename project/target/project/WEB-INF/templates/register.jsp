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

        #verificationSection {
            display: none;
            margin-top: 15px;
            padding: 15px;
            border-radius: 10px;
            background: #e8f4f8;
            border: 1px solid #b3d9e6;
        }

        .file-input-label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #333;
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

        <form action="<%= request.getContextPath() %>/auth/register" method="post" enctype="multipart/form-data" id="registerForm">

            <input type="email" 
                   name="email" 
                   placeholder="E-mail" 
                   class="input-field">

            <input type="text" 
                   name="firstName" 
                   placeholder="First Name" 
                   class="input-field">

            <input type="text" 
                   name="lastName" 
                   placeholder="Last Name" 
                   class="input-field">

            <input type="password" 
                   name="password" 
                   placeholder="Password" 
                   class="input-field">

            <input type="password" 
                   name="confirmPassword" 
                   placeholder="Confirm password" 
                   class="input-field">

            <div class="role-box">
                <strong>Select Your Role</strong><br><br>

                <input type="radio" id="student" name="role" value="STUDENT" checked onchange="toggleVerification()">
                <label for="student">👨‍🎓 Student</label><br><br>

                <input type="radio" id="professional" name="role" value="PROFESSIONAL" onchange="toggleVerification()">
                <label for="professional">👨‍⚕️ Professional</label>
            </div>

            <div id="verificationSection" style="display:none;">
                <label class="file-input-label">📄 Verification Document (Required for Professional):</label>
                <input type="file" 
                       name="verificationDocument" 
                       id="verificationFile"
                       accept=".pdf,.doc,.docx,.jpg,.jpeg,.png"
                       class="input-field">
                <small style="color: #666;">Accepted formats: PDF, DOC, DOCX, JPG, PNG (Max 50MB)</small>
            </div>

            <button type="submit" class="btn" onclick="return validateForm()">Sign up</button>

        </form>

        <script>
            function toggleVerification() {
                var professional = document.getElementById('professional').checked;
                var section = document.getElementById('verificationSection');
                if (professional) {
                    section.style.display = 'block';
                } else {
                    section.style.display = 'none';
                }
            }

            function validateForm() {
                var email = document.querySelector('input[name="email"]').value.trim();
                var firstName = document.querySelector('input[name="firstName"]').value.trim();
                var lastName = document.querySelector('input[name="lastName"]').value.trim();
                var password = document.querySelector('input[name="password"]').value.trim();
                var confirmPassword = document.querySelector('input[name="confirmPassword"]').value.trim();
                var role = document.querySelector('input[name="role"]:checked').value;
                var verificationFile = document.querySelector('input[name="verificationDocument"]').files;

                if (!email || !firstName || !lastName || !password || !confirmPassword) {
                    alert('All fields are required');
                    return false;
                }

                if (role === 'PROFESSIONAL' && verificationFile.length === 0) {
                    alert('Please upload a verification document for professional registration');
                    return false;
                }

                return true;
            }
        </script>

    </div>

</body>
</html>
