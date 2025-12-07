<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.secj3303.model.Resource" %>
<%@ page import="com.secj3303.model.UserRole" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resource Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eaf8ff;
            margin: 0;
            padding: 0;
        }
        .content {
            padding: 80px 40px 40px 40px;
            max-width: 900px;
            margin: 0 auto;
        }
        .resource-detail {
            background: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
        }
        .category-badge {
            display: inline-block;
            padding: 6px 15px;
            background-color: #e3f2fd;
            color: #1976d2;
            border-radius: 15px;
            font-size: 14px;
            margin-bottom: 20px;
        }
        .meta-info {
            background-color: #f8f9fa;
            border-left: 4px solid #1a75ff;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 5px;
        }
        .meta-item {
            margin-bottom: 8px;
            color: #666;
            font-size: 14px;
        }
        .meta-item strong {
            color: #333;
        }
        .description-section {
            margin-bottom: 30px;
        }
        .description-section h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 18px;
        }
        .description-text {
            color: #555;
            line-height: 1.8;
            font-size: 16px;
        }
        .download-section {
            background-color: #f0f8ff;
            border: 2px dashed #1a75ff;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
            margin-bottom: 25px;
        }
        .download-section h3 {
            color: #333;
            margin-bottom: 15px;
        }
        .file-name {
            background-color: white;
            padding: 10px 15px;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 15px;
            font-family: monospace;
            color: #666;
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
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
        }
        .btn-secondary:hover {
            background-color: #545b62;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .action-buttons {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>

<%
    UserRole userRole = (UserRole) session.getAttribute("userRole");
    if (userRole == UserRole.STUDENT) {
%>
    <jsp:include page="navstudent.jsp" />
<%
    } else if (userRole == UserRole.PROFESSIONAL) {
%>
    <jsp:include page="navprof.jsp" />
<%
    } else if (userRole == UserRole.ADMIN) {
%>
    <jsp:include page="navadmin.jsp" />
<%
    }
%>

<div class="content">
    <%
        Resource resource = (Resource) request.getAttribute("resource");
        if (resource != null) {
    %>
        <div class="resource-detail">
            <h1><%= resource.getTitle() %></h1>
            <span class="category-badge">📚 <%= resource.getCategory() %></span>
            
            <div class="meta-info">
                <div class="meta-item">
                    <strong>📤 Uploaded by:</strong> <%= resource.getUploadedByName() %>
                </div>
                <div class="meta-item">
                    <strong>📅 Uploaded on:</strong> <%= resource.getCreatedAt() %>
                </div>
                <% if (resource.getUpdatedAt() != null && !resource.getUpdatedAt().equals(resource.getCreatedAt())) { %>
                    <div class="meta-item">
                        <strong>🔄 Last updated:</strong> <%= resource.getUpdatedAt() %>
                    </div>
                <% } %>
            </div>

            <div class="description-section">
                <h3>Description</h3>
                <div class="description-text">
                    <%= resource.getDescription() %>
                </div>
            </div>

            <div class="download-section">
                <h3>📥 Download Resource</h3>
                <%
                    String filename = resource.getFileUrl().substring(resource.getFileUrl().lastIndexOf("/") + 1);
                    String extension = filename.substring(filename.lastIndexOf("."));
                    String displayName = resource.getTitle() + extension;
                %>
                <div class="file-name">
                    📄 <%= displayName %>
                </div>
                <br>
                <a href="<%= request.getContextPath() %><%= resource.getFileUrl() %>" class="btn btn-primary" download="<%= displayName %>">⬇️ Download File</a>
            </div>

            <div class="action-buttons">
                <a href="<%= request.getContextPath() %>/resource/browse" class="btn btn-secondary">← Back to Browse</a>
                <% if (userRole == UserRole.PROFESSIONAL && resource.getUploadedBy().equals(session.getAttribute("userEmail"))) { %>
                    <a href="<%= request.getContextPath() %>/resource/edit/<%= resource.getResourceId() %>" class="btn btn-primary">✏️ Edit Resource</a>
                <% } %>
            </div>
        </div>
    <%
        } else {
    %>
        <div class="resource-detail">
            <div class="error-message">
                <strong>Resource not found.</strong><br>
                The resource you're looking for doesn't exist or has been removed.
            </div>
            <div class="action-buttons">
                <a href="<%= request.getContextPath() %>/resource/browse" class="btn btn-secondary">← Back to Browse</a>
            </div>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
