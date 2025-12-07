<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Professional Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 15px;
            background-color: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-link:hover {
            background-color: #764ba2;
        }
        .message {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .professionals-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .professionals-table th {
            background-color: #667eea;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }
        .professionals-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        .professionals-table tr:hover {
            background-color: #f9f9f9;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-approve {
            background-color: #28a745;
            color: white;
        }
        .btn-approve:hover {
            background-color: #218838;
        }
        .btn-reject {
            background-color: #dc3545;
            color: white;
        }
        .btn-reject:hover {
            background-color: #c82333;
        }
        .btn-view {
            background-color: #007bff;
            color: white;
            padding: 6px 12px;
            font-size: 12px;
        }
        .btn-view:hover {
            background-color: #0056b3;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }
        .status-pending {
            background-color: #ffc107;
            color: #000;
        }
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 18px;
        }
    </style>
</head>
<body>

<jsp:include page="navadmin.jsp" />

<div class="container">
    <h1>Professional Registration Verification</h1>
    
    <a href="<%= request.getContextPath() %>/homeadmin" class="back-link">← Back to Dashboard</a>

    <%
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
        String success = (String) request.getAttribute("success");
    %>

    <% if (error != null && !error.isEmpty()) { %>
        <div class="message error"><%= error %></div>
    <% } %>

    <% if (success != null && !success.isEmpty()) { %>
        <div class="message success"><%= success %></div>
    <% } %>

    <%
        java.util.List<com.secj3303.model.Professional> pendingProfessionals = 
            (java.util.List<com.secj3303.model.Professional>) request.getAttribute("pendingProfessionals");
    %>

    <% if (pendingProfessionals != null && !pendingProfessionals.isEmpty()) { %>
        <table class="professionals-table">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Submitted At</th>
                    <th>Document</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (com.secj3303.model.Professional prof : pendingProfessionals) { %>
                    <tr>
                        <td><%= prof.getEmail() %></td>
                        <td><%= prof.getFullName() %></td>
                        <td>
                            <span class="status-badge status-pending">
                                <%= prof.getVerificationStatus() != null ? prof.getVerificationStatus() : "PENDING" %>
                            </span>
                        </td>
                        <td><%= prof.getSubmittedAt() != null ? prof.getSubmittedAt() : "N/A" %></td>
                        <td>
                            <% if (prof.getVerificationDocument() != null && !prof.getVerificationDocument().isEmpty()) { %>
                                <a href="<%= request.getContextPath() %>/<%= prof.getVerificationDocument() %>" 
                                   target="_blank" class="btn btn-view">View Document</a>
                            <% } else { %>
                                <span style="color: #999;">No document</span>
                            <% } %>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <form action="<%= request.getContextPath() %>/auth/approveProfessional" method="post" style="display:inline;">
                                    <input type="hidden" name="email" value="<%= prof.getEmail() %>">
                                    <button type="submit" class="btn btn-approve">Approve</button>
                                </form>
                                <form action="<%= request.getContextPath() %>/auth/rejectProfessional" method="post" style="display:inline;">
                                    <input type="hidden" name="email" value="<%= prof.getEmail() %>">
                                    <button type="submit" class="btn btn-reject" onclick="return confirm('Are you sure?')">Reject</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <div class="empty-message">
            ✓ No pending professional registrations. All professionals have been verified!
        </div>
    <% } %>

</div>

</body>
</html>
