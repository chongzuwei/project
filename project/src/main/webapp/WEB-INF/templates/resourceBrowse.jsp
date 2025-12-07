<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.secj3303.model.Resource" %>
<%@ page import="com.secj3303.model.UserRole" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Resources</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eaf8ff;
            margin: 0;
            padding: 0;
        }
        .content {
            padding: 80px 40px 40px 40px;
            max-width: 1200px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #1a75ff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .resource-item {
            background: white;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
    <h1>Browse Mental Health Resources</h1>
    
    <%
        try {
            List<Resource> resources = (List<Resource>) request.getAttribute("resources");
            String error = (String) request.getAttribute("error");
            
            if (error != null && !error.isEmpty()) {
    %>
                <div style="background-color: #f8d7da; color: #721c24; padding: 15px; border-radius: 5px; margin-bottom: 20px;">
                    <%= error %>
                </div>
    <%
            }
            
            if (resources != null && !resources.isEmpty()) {
    %>
                <p><strong>Found <%= resources.size() %> resource(s)</strong></p>
    <%
                for (Resource resource : resources) {
                    if (resource != null) {
    %>
                    <div class="resource-item">
                        <strong><%= resource.getTitle() != null ? resource.getTitle() : "Untitled" %></strong><br>
                        Category: <%= resource.getCategory() != null ? resource.getCategory() : "Other" %><br>
                        <a href="<%= request.getContextPath() %>/resource/view/<%= resource.getResourceId() %>" class="btn btn-primary" style="margin-top: 10px;">View</a>
                    </div>
    <%
                    }
                }
    %>
    <%
            } else {
    %>
                <div style="background-color: #e8f4f8; padding: 40px; text-align: center; border-radius: 10px;">
                    <p>No resources found.</p>
                    <a href="<%= request.getContextPath() %>/resourcestudent" class="btn btn-primary">Back</a>
                </div>
    <%
            }
        } catch (Exception e) {
    %>
        <div style="background-color: #f8d7da; color: #721c24; padding: 15px; border-radius: 5px;">
            <strong>Error:</strong> <%= e.getMessage() %><br>
            <pre><%= e.toString() %></pre>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eaf8ff;
            margin: 0;
            padding: 0;
        }
        .content {
            padding: 80px 40px 40px 40px;
            max-width: 1200px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        .search-bar {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .search-form {
            display: flex;
            gap: 15px;
            align-items: flex-end;
        }
        .form-group {
            flex: 1;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            white-space: nowrap;
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
        .results-info {
            margin-bottom: 20px;
            color: #666;
            font-size: 14px;
        }
        .resource-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 20px;
        }
        .resource-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .resource-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        }
        .resource-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }
        .resource-category {
            display: inline-block;
            padding: 4px 10px;
            background-color: #e3f2fd;
            color: #1976d2;
            border-radius: 12px;
            font-size: 12px;
            margin-bottom: 10px;
        }
        .resource-description {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
            line-height: 1.5;
        }
        .resource-meta {
            font-size: 12px;
            color: #999;
            margin-bottom: 15px;
        }
        .resource-actions {
            text-align: right;
        }
        .no-results {
            background: white;
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            color: #666;
        }
    </style>
</head>
<body>

<div class="content">
    <h1>Browse Mental Health Resources</h1>
    
    <div class="search-bar">
        <form action="<%= request.getContextPath() %>/resource/browse" method="get" class="search-form">
            <div class="form-group">
                <label for="search">Search Resources</label>
                <input type="text" id="search" name="search" placeholder="Enter keywords (title, description, or category)" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <select id="category" name="category">
                    <option value="">All Categories</option>
                    <option value="Anxiety" <%= "Anxiety".equals(request.getParameter("category")) ? "selected" : "" %>>Anxiety</option>
                    <option value="Depression" <%= "Depression".equals(request.getParameter("category")) ? "selected" : "" %>>Depression</option>
                    <option value="Stress Management" <%= "Stress Management".equals(request.getParameter("category")) ? "selected" : "" %>>Stress Management</option>
                    <option value="Self-Care" <%= "Self-Care".equals(request.getParameter("category")) ? "selected" : "" %>>Self-Care</option>
                    <option value="Mindfulness" <%= "Mindfulness".equals(request.getParameter("category")) ? "selected" : "" %>>Mindfulness</option>
                    <option value="Counseling" <%= "Counseling".equals(request.getParameter("category")) ? "selected" : "" %>>Counseling</option>
                    <option value="Crisis Support" <%= "Crisis Support".equals(request.getParameter("category")) ? "selected" : "" %>>Crisis Support</option>
                    <option value="Academic Support" <%= "Academic Support".equals(request.getParameter("category")) ? "selected" : "" %>>Academic Support</option>
                    <option value="General Wellness" <%= "General Wellness".equals(request.getParameter("category")) ? "selected" : "" %>>General Wellness</option>
                    <option value="Other" <%= "Other".equals(request.getParameter("category")) ? "selected" : "" %>>Other</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">🔍 Search</button>
        </form>
    </div>

    <%
        List<Resource> resources = (List<Resource>) request.getAttribute("resources");
        int resourceCount = (resources != null) ? resources.size() : 0;
    %>
    
    <div class="results-info">
        <strong>Found <%= resourceCount %> resource<%= resourceCount != 1 ? "s" : "" %></strong>
    </div>

    <%
        if (resources != null && !resources.isEmpty()) {
    %>
        <div class="resource-grid">
            <%
                for (Resource resource : resources) {
                    if (resource == null) continue;
            %>
                <div class="resource-card">
                    <div class="resource-title"><%= resource.getTitle() != null ? resource.getTitle() : "Untitled" %></div>
                    <div class="resource-category"><%= resource.getCategory() != null ? resource.getCategory() : "Other" %></div>
                    <div class="resource-description">
                        <% 
                            String desc = resource.getDescription();
                            if (desc == null) desc = "";
                            if (desc.length() > 150) {
                                out.print(desc.substring(0, 150) + "...");
                            } else {
                                out.print(desc);
                            }
                        %>
                    </div>
                    <div class="resource-meta">
                        📤 Uploaded by: <%= resource.getUploadedByName() != null ? resource.getUploadedByName() : "Unknown" %><br>
                        📅 Date: <%= resource.getCreatedAt() != null ? resource.getCreatedAt() : "N/A" %>
                    </div>
                    <div class="resource-actions">
                        <a href="<%= request.getContextPath() %>/resource/view/<%= resource.getResourceId() %>" class="btn btn-secondary">View Details</a>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    <%
        } else {
    %>
        <div class="no-results">
            <p>📭 No resources found matching your criteria.</p>
            <% if (request.getParameter("search") != null || request.getParameter("category") != null) { %>
                <a href="<%= request.getContextPath() %>/resource/browse" class="btn btn-primary">Clear Filters</a>
            <% } %>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
