<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #d9f0f8;
            font-family: Arial, sans-serif;
        }

        .navbar {
            width: 100%;
            padding: 15px 40px;
            background: white;
            font-size: 18px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .navbar a {
            margin-right: 25px;
            color: black;
            text-decoration: none;
            font-weight: 500;
        }

        .navbar a:hover {
            color: #1a75ff;
        }

        .content {
            padding: 40px;
        }
    </style>
</head>
<body>

<!-- NAVIGATION BAR -->
<jsp:include page="navadmin.jsp" />

<!-- MAIN CONTENT -->
<div class="content">

    <h2>Dashboard</h2>

    <div class="dashboard-stats">
        <div class="box">
            <p>Content Metrics</p>
            <p>Resources uploaded this week: 12</p>
            <p>Posts made this week: 25</p>
            <p>Total lessons completed: 30</p>
        </div>
        <div class="box">
            <p>Users Engagement</p>
            <p>New users this week: 40</p>
            <p>Average active users this week: 35</p>
            <p>Average time online: 20 minutes</p>
        </div>
        <a href="dashboardpage.jsp"><button style="border: none; border-radius: 5px; background-color: #1a75ff; color: white">
            See detailed stats
        </button></a>
    </div>
</div>
</body>
</html>
