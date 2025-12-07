<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professional Resources</title>
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
        .action-buttons {
            display: flex;
            gap: 15px;
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
    </style>
</head>
<body>

<jsp:include page="navprof.jsp" />

<div class="content">
    <h1>Mental Health Resources Management</h1>
    
    <div class="action-buttons">
        <a href="<%= request.getContextPath() %>/resource/upload" class="btn btn-primary">📤 Upload New Resource</a>
        <a href="<%= request.getContextPath() %>/resource/myresources" class="btn btn-secondary">📋 My Resources</a>
        <a href="<%= request.getContextPath() %>/resource/browse" class="btn btn-secondary">🔍 Browse All</a>
    </div>

    <p style="color: #666; font-size: 16px;">
        Upload mental health resources, articles, guides, and educational materials for students.<br>
        You can manage your uploaded resources, edit details, or remove them at any time.
    </p>
</div>

</body>
</html>
      