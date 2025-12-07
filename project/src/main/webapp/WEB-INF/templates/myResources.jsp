<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.secj3303.model.Resource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Resources</title>
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
        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background-color: #1a75ff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-edit {
            background-color: #28a745;
            color: white;
            padding: 8px 15px;
            font-size: 13px;
        }
        .btn-edit:hover {
            background-color: #218838;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
            padding: 8px 15px;
            font-size: 13px;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .resources-table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        thead {
            background-color: #1a75ff;
            color: white;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            font-weight: 600;
        }
        tbody tr:hover {
            background-color: #f8f9fa;
        }
        .no-resources {
            padding: 40px;
            text-align: center;
            color: #666;
        }
        .resource-actions {
            display: flex;
            gap: 10px;
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
        .category-badge {
            display: inline-block;
            padding: 4px 10px;
            background-color: #e3f2fd;
            color: #1976d2;
            border-radius: 12px;
            font-size: 12px;
        }
    </style>
    <script>
        function confirmDelete(resourceId, title) {
            if (confirm("Are you sure you want to delete '" + title + "'?\n\nThis action cannot be undone.")) {
                document.getElementById("deleteForm" + resourceId).submit();
            }
        }
    </script>
</head>
<body>

<jsp:include page="navprof.jsp" />

<div class="content">
    <h1>My Uploaded Resources</h1>
    
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

    <div class="action-bar">
        <div>
            <% 
                List<Resource> resources = (List<Resource>) request.getAttribute("resources");
                int resourceCount = (resources != null) ? resources.size() : 0;
            %>
            <strong>Total Resources: <%= resourceCount %></strong>
        </div>
        <a href="<%= request.getContextPath() %>/resource/upload" class="btn btn-primary">📤 Upload New Resource</a>
    </div>

    <div class="resources-table">
        <%
            if (resources != null && !resources.isEmpty()) {
        %>
            <table>
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Uploaded</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Resource resource : resources) {
                    %>
                        <tr>
                            <td><strong><%= resource.getTitle() %></strong></td>
                            <td><span class="category-badge"><%= resource.getCategory() %></span></td>
                            <td><%= resource.getDescription().length() > 100 ? resource.getDescription().substring(0, 100) + "..." : resource.getDescription() %></td>
                            <td><%= resource.getCreatedAt() %></td>
                            <td>
                                <div class="resource-actions">
                                    <a href="<%= request.getContextPath() %>/resource/edit/<%= resource.getResourceId() %>" class="btn btn-edit">✏️ Edit</a>
                                    <form id="deleteForm<%= resource.getResourceId() %>" action="<%= request.getContextPath() %>/resource/delete/<%= resource.getResourceId() %>" method="post" style="display:inline;">
                                        <button type="button" class="btn btn-delete" onclick="confirmDelete(<%= resource.getResourceId() %>, '<%= resource.getTitle().replace("'", "\\'") %>')">🗑️ Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <div class="no-resources">
                <p>📭 You haven't uploaded any resources yet.</p>
                <a href="<%= request.getContextPath() %>/resource/upload" class="btn btn-primary">Upload Your First Resource</a>
            </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
