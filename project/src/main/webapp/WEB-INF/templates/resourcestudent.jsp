<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mental Health Resources</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background-color: #eaf7ff;
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
        .info-card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .info-card h2 {
            color: #1a75ff;
            margin-bottom: 15px;
        }
        .info-card p {
            color: #666;
            line-height: 1.6;
        }
        .category-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            margin-top: 15px;
        }
        .category-item {
            padding: 10px;
            background-color: #f0f8ff;
            border-radius: 5px;
            color: #333;
        }
    </style>
</head>
<body>
<jsp:include page="navstudent.jsp" />

<div class="content">
    <h1>Mental Health Resources</h1>
    
    <div class="action-buttons">
        <a href="<%= request.getContextPath() %>/resource/browse" class="btn btn-primary">🔍 Browse All Resources</a>
    </div>

    <div class="info-card">
        <h2>📚 Access Mental Health Resources</h2>
        <p>
            Browse our collection of mental health resources curated by professionals.<br>
            Find articles, guides, and materials covering topics like anxiety, depression, stress management, mindfulness, and more.
        </p>
        <p>
            Use the search feature to find resources by keywords or filter by category to discover content tailored to your needs.
        </p>
    </div>

    <div class="info-card">
        <h2>🎯 Categories Available</h2>
        <div class="category-grid">
            <div class="category-item">📘 Anxiety</div>
            <div class="category-item">📙 Depression</div>
            <div class="category-item">📗 Stress Management</div>
            <div class="category-item">📕 Self-Care</div>
            <div class="category-item">📔 Mindfulness</div>
            <div class="category-item">📓 Counseling</div>
            <div class="category-item">📒 Crisis Support</div>
            <div class="category-item">📖 Academic Support</div>
        </div>
    </div>
</div>