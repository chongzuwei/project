<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background-color: #d8f0f7;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .navbar{
            width: 100%;
            padding: 15px 30px;
            background-color: white;
            display: flex;
            align-items: center;
            gap: 25px;
            font-size: 18px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .navbar a{
            text-decoration: none;
            color: black;
        }
        .navbar a.active{
            font-weight: bold;
        }
        .info-box{
            background-color: white;
            width: 350px;
            margin: 40px auto 20px auto;
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
            font-size: 40px;
            padding: 15px 25px;
            border-radius: 15px;
            margin-top: 5px;
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
        }
        .btn:hover{
            opacity: 0.85;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="homeprof.jsp" >Home</a>
    <a href="resourceprof.jsp" >Resource</a>
    <a href="profileprof.jsp" style="font-weight:bold;">Profile</a>
</div>

<div class="info-box">
    <p>Email: ali@gmail.com<br>Name: Ali</p>
</div>

<div class="stats-box">
    <div class="stat">
        <p>quiz<br>created</p>
        <div class="stat-value">6</div>
    </div>
    <div class="stat">
        <p>resource<br>created</p>
        <div class="stat-value">6</div>
    </div>
</div>

<button class="btn">edit user's profile</button>
<button class="btn">log out</button>

</body>
</html>
