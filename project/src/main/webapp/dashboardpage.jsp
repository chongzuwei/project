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

    <div class="dashboard-nav">
        <div class="tab active">Resources</div>
        <div class="tab">Users</div>
        <div class="tab">Lessons</div>
        <div class="tab">Assessments</div>
    </div>

    <div class="controls">
        <button>Sort By Date</button>
        <button>Sort By Title</button>

        <select id="filterType">
            <option value="all">Filter Type: All</option>
            <option value="Article">Article</option>
            <option value="Wellness advice">Wellness advice</option>
        </select>
    </div>

    <table id="resourceTable">
        <thead>
        <tr>
            <th>Date</th>
            <th>Title</th>
            <th>User Added</th>
            <th>Type</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>2024-07-12</td>
            <td>How To Identify Depression Symptoms</td>
            <td>professional1</td>
            <td>Article</td>
        </tr>
        <tr>
            <td>2024-07-10</td>
            <td>Learn To Love Yourself</td>
            <td>professional2</td>
            <td>Wellness advice</td>
        </tr>
        <tr>
            <td>2024-07-09</td>
            <td>A Guide To Handle Stress</td>
            <td>professional1</td>
            <td>Article</td>
        </tr>
        <tr>
            <td>2024-07-09</td>
            <td>Simple Tips To Feel Calmer</td>
            <td>professional3</td>
            <td>Wellness advice</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
