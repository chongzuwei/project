<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<!-- NAVIGATION BAR -->
<div class="navbar">
    <a href="homeadmin.jsp">Dashboard</a>
    <a href="profileadmin.jsp">Profile</a>
</div>

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
