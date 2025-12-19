<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Profile</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background-color: #eef5ff;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .info-box{
            background-color: white;
            width: 350px;
            margin: 80px auto 20px auto;
            border-radius: 20px;
            padding: 20px;
            font-size: 16px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }
        .stats-box{
            background-color: white;
            width: 500px;
            margin: 20px auto;
            border-radius: 20px;
            padding: 30px;
            display: flex;
            justify-content: space-around;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }
        .stat{
            text-align: center;
        }
        .stat-value{
            background-color: #2d2626;
            color: white;
            font-size: 32px;
            padding: 12px 22px;
            border-radius: 14px;
            margin-top: 6px;
        }
        .btn{
            width: 250px;
            padding: 12px;
            margin: 15px auto;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            cursor: pointer;
            display: block;
            background-color: #000;
            color: white;
            text-decoration: none;
        }
        .btn:hover{ opacity: 0.85; }
    </style>
</head>
<body>

<jsp:include page="navadmin.jsp" />

<div class="info-box">
    <%
        String userEmail = (String) session.getAttribute("userEmail");
        String userName = (String) session.getAttribute("userName");
        String bio = null;
        com.secj3303.model.User profileUser = (com.secj3303.model.User) session.getAttribute("user");
        if (profileUser != null) {
            bio = profileUser.getBiography();
        }
        if (userEmail == null) userEmail = "Not available";
        if (userName == null) userName = "Not available";
    %>
    <p>Email: <%= userEmail %><br>Name: <%= userName %></p>
    <p>Bio: <%= (bio != null && !bio.isEmpty()) ? bio : "Not available" %></p>
</div>

<%
    Long resourceCount = (Long) request.getAttribute("resourceCount");
    if (resourceCount == null) resourceCount = 0L;
    Long userCount = (Long) request.getAttribute("userCount");
    if (userCount == null) userCount = 0L;
%>

<div class="stats-box">
    <div class="stat">
        <p>total users</p>
        <div class="stat-value"><%= userCount %></div>
    </div>
    <div class="stat">
        <p>total resources</p>
        <div class="stat-value"><%= resourceCount %></div>
    </div>
</div>

<a class="btn" href="<%= request.getContextPath() %>/edituser">edit user's profile</a>
<a class="btn" href="<%= request.getContextPath() %>/auth/logout">log out</a>

</body>
</html>
