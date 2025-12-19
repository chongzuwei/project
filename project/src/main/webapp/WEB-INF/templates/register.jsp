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
            align-items: flex-start;
            min-height: 100vh;
            margin: 0;
            padding: 20px 0;
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

                <input type="radio" id="student" name="role" value="STUDENT" checked onchange="toggleRoleFields()">
                <label for="student">👨‍🎓 Student</label><br><br>

                <input type="radio" id="professional" name="role" value="PROFESSIONAL" onchange="toggleRoleFields()">
                <label for="professional">👨‍⚕️ Professional</label>
            </div>

            <!-- Student-specific fields -->
            <div id="studentSection" style="display:block; margin-top: 15px; padding: 15px; border-radius: 10px; background: #f0f8ff; border: 1px solid #b3d9ff;">
                <label class="file-input-label">Student Information:</label>
                
                <input type="text" 
                       name="studentId" 
                       id="studentId"
                       placeholder="Student ID (e.g., S12345)"
                       class="input-field">
                
                <input type="text" 
                       name="major" 
                       id="major"
                       placeholder="Major (e.g., Computer Science)"
                       class="input-field">
                
                <select name="academicYear" id="academicYear" class="input-field">
                    <option value="">Select Academic Year</option>
                    <option value="Year 1">Year 1</option>
                    <option value="Year 2">Year 2</option>
                    <option value="Year 3">Year 3</option>
                    <option value="Year 4">Year 4</option>
                    <option value="Graduate">Graduate</option>
                </select>
            </div>

                 <div id="verificationSection" style="display:none;">
                  <label class="file-input-label">📄 Verification Document (Required for Professional):</label>
                  <input type="file" 
                      name="verificationDocument" 
                      id="verificationFile"
                      accept=".pdf,.doc,.docx,.jpg,.jpeg,.png"
                      class="input-field">
                  <small style="color: #666;">Accepted formats: PDF, DOC, DOCX, JPG, PNG (Max 50MB)</small>

                  <label class="file-input-label" style="margin-top:12px;">Professional Information:</label>
                  <input type="text" 
                      name="professionalId" 
                      id="professionalId"
                      placeholder="Professional ID (e.g., P12345)"
                      class="input-field">

                  <input type="text" 
                      name="department" 
                      id="department"
                      placeholder="Department (e.g., Counseling Center)"
                      class="input-field">

                  <input type="text" 
                      name="qualification" 
                      id="qualification"
                      placeholder="Qualification (e.g., Licensed Counselor)"
                      class="input-field">

                  <input type="text" 
                      name="specialization" 
                      id="specialization"
                      placeholder="Specialization (e.g., Anxiety, CBT)"
                      class="input-field">
                 </div>

            <button type="submit" class="btn" onclick="return validateForm()">Sign up</button>

        </form>

        <script>
            function toggleRoleFields() {
                var isStudent = document.getElementById('student').checked;
                var isProfessional = document.getElementById('professional').checked;
                var studentSection = document.getElementById('studentSection');
                var verificationSection = document.getElementById('verificationSection');
                
                if (isStudent) {
                    studentSection.style.display = 'block';
                    verificationSection.style.display = 'none';
                } else if (isProfessional) {
                    studentSection.style.display = 'none';
                    verificationSection.style.display = 'block';
                }
            }

            function validateForm() {
                var email = document.querySelector('input[name="email"]').value.trim();
                var firstName = document.querySelector('input[name="firstName"]').value.trim();
                var lastName = document.querySelector('input[name="lastName"]').value.trim();
                var password = document.querySelector('input[name="password"]').value.trim();
                var confirmPassword = document.querySelector('input[name="confirmPassword"]').value.trim();
                var role = document.querySelector('input[name="role"]:checked').value;

                if (!email || !firstName || !lastName || !password || !confirmPassword) {
                    alert('All fields are required');
                    return false;
                }

                if (role === 'STUDENT') {
                    var studentId = document.querySelector('input[name="studentId"]').value.trim();
                    var major = document.querySelector('input[name="major"]').value.trim();
                    var academicYear = document.querySelector('select[name="academicYear"]').value;
                    
                    if (!studentId || !major || !academicYear) {
                        alert('Please fill in all student information fields');
                        return false;
                    }
                }

                if (role === 'PROFESSIONAL') {
                    var verificationFile = document.querySelector('input[name="verificationDocument"]').files;
                    var professionalId = document.querySelector('input[name="professionalId"]').value.trim();
                    var department = document.querySelector('input[name="department"]').value.trim();
                    var qualification = document.querySelector('input[name="qualification"]').value.trim();
                    var specialization = document.querySelector('input[name="specialization"]').value.trim();

                    if (verificationFile.length === 0) {
                        alert('Please upload a verification document for professional registration');
                        return false;
                    }
                    if (!professionalId || !department || !qualification || !specialization) {
                        alert('Please fill in Professional ID, Department, Qualification and Specialization');
                        return false;
                    }
                }

                return true;
            }
        </script>

    </div>

</body>
</html>
