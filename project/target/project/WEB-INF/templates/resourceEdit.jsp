<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.secj3303.model.Resource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Resource</title>
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
        .current-file {
            background-color: #f0f0f0;
            padding: 10px;
            border-radius: 5px;
            margin-top: 5px;
            font-size: 13px;
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
    <h1>Edit Resource</h1>
    
    <div class="form-container">
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <%
            Resource resource = (Resource) request.getAttribute("resource");
            if (resource != null) {
        %>
            <form action="<%= request.getContextPath() %>/resource/edit/<%= resource.getResourceId() %>" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="title">Resource Title *</label>
                    <input type="text" id="title" name="title" value="<%= resource.getTitle() %>">
                </div>

                <div class="form-group">
                    <label for="description">Description *</label>
                    <textarea id="description" name="description"><%= resource.getDescription() %></textarea>
                </div>

                <div class="form-group">
                    <label for="category">Category *</label>
                    <select id="category" name="category">
                        <option value="">-- Select Category --</option>
                        <option value="Anxiety" <%= "Anxiety".equals(resource.getCategory()) ? "selected" : "" %>>Anxiety</option>
                        <option value="Depression" <%= "Depression".equals(resource.getCategory()) ? "selected" : "" %>>Depression</option>
                        <option value="Stress Management" <%= "Stress Management".equals(resource.getCategory()) ? "selected" : "" %>>Stress Management</option>
                        <option value="Self-Care" <%= "Self-Care".equals(resource.getCategory()) ? "selected" : "" %>>Self-Care</option>
                        <option value="Mindfulness" <%= "Mindfulness".equals(resource.getCategory()) ? "selected" : "" %>>Mindfulness</option>
                        <option value="Counseling" <%= "Counseling".equals(resource.getCategory()) ? "selected" : "" %>>Counseling</option>
                        <option value="Crisis Support" <%= "Crisis Support".equals(resource.getCategory()) ? "selected" : "" %>>Crisis Support</option>
                        <option value="Academic Support" <%= "Academic Support".equals(resource.getCategory()) ? "selected" : "" %>>Academic Support</option>
                        <option value="General Wellness" <%= "General Wellness".equals(resource.getCategory()) ? "selected" : "" %>>General Wellness</option>
                        <option value="Other" <%= "Other".equals(resource.getCategory()) ? "selected" : "" %>>Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Current File</label>
                    <div class="current-file">
                        📄 <%= resource.getFileUrl().substring(resource.getFileUrl().lastIndexOf("/") + 1) %>
                    </div>
                </div>

                <div class="form-group">
                    <label for="resourceFile">Replace File (Optional)</label>
                    <input type="file" id="resourceFile" name="resourceFile">
                    <div class="file-note">Leave empty to keep current file. Accepted formats: PDF, DOC, DOCX, PPT, PPTX, JPG, PNG, TXT, MP4, AVI, MOV, WMV, MKV, FLV, WEBM (Max 200MB)</div>
                </div>

                <div style="margin-top: 30px;">
                    <button type="submit" class="btn btn-primary">💾 Save Changes</button>
                    <a href="<%= request.getContextPath() %>/resource/myresources" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        <%
            } else {
        %>
            <div class="error-message">Resource not found.</div>
            <a href="<%= request.getContextPath() %>/resource/myresources" class="btn btn-secondary">Back to My Resources</a>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
