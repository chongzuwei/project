<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Resource</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eaf8ff;
            margin: 0;
            padding: 0;
        }
        .content {
            padding: 80px 40px 40px 40px;
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        .form-container {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }
        input[type="text"],
        textarea,
        select,
        input[type="file"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        textarea {
            min-height: 120px;
            resize: vertical;
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn-primary {
            background-color: #1a75ff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            display: inline-block;
        }
        .btn-secondary:hover {
            background-color: #545b62;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .file-note {
            font-size: 13px;
            color: #666;
            margin-top: 5px;
        }
    </style>
    <script>
        function validateForm() {
            const title = document.getElementById("title").value.trim();
            const description = document.getElementById("description").value.trim();
            const category = document.getElementById("category").value;

            if (!title) {
                alert("Please enter a resource title");
                return false;
            }
            if (!description) {
                alert("Please enter a resource description");
                return false;
            }
            if (!category) {
                alert("Please select a category");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<jsp:include page="navprof.jsp" />

<div class="content">
    <h1>Upload Mental Health Resource</h1>
    
    <div class="form-container">
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("success") != null) { %>
            <div class="success-message">
                <%= request.getAttribute("success") %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/resource/upload" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="title">Resource Title *</label>
                <input type="text" id="title" name="title" placeholder="Enter resource title">
            </div>

            <div class="form-group">
                <label for="description">Description *</label>
                <textarea id="description" name="description" placeholder="Describe the resource and its content"></textarea>
            </div>

            <div class="form-group">
                <label for="category">Category *</label>
                <select id="category" name="category">
                    <option value="">-- Select Category --</option>
                    <option value="Anxiety">Anxiety</option>
                    <option value="Depression">Depression</option>
                    <option value="Stress Management">Stress Management</option>
                    <option value="Self-Care">Self-Care</option>
                    <option value="Mindfulness">Mindfulness</option>
                    <option value="Counseling">Counseling</option>
                    <option value="Crisis Support">Crisis Support</option>
                    <option value="Academic Support">Academic Support</option>
                    <option value="General Wellness">General Wellness</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="resourceFile">Upload File *</label>
                <input type="file" id="resourceFile" name="resourceFile">
                <div class="file-note">Accepted formats: PDF, DOC, DOCX, PPT, PPTX, JPG, PNG, TXT, MP4, AVI, MOV, WMV, MKV, FLV, WEBM (Max 200MB)</div>
            </div>

            <div style="margin-top: 30px;">
                <button type="submit" class="btn btn-primary">📤 Upload Resource</button>
                <a href="<%= request.getContextPath() %>/resourceprof" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
