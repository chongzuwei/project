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
        .search-container{
            margin-left: auto;
        }
        .search-container input{
            width: 250px;
            padding: 8px 12px;
            border-radius: 20px;
            border: 1px solid #ccc;
        }
        .grid{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
            padding: 40px;
        }
        .card{
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            font-size: 14px;
        }
        .card h3{
            margin-top: 0;
            font-size: 18px;
        }
    </style>
</head>
<body>

<div class="navbar">
   
        <a href="homestudent.jsp">Home</a>
        <a href="resourcestudent.jsp"style="font-weight:bold;">Resource</a>
        <a href="selfAssessment.jsp">Self-Assessment</a>
        <a href="activity.jsp">Activity Community</a>
        <a href="profilestudent.jsp">Profile</a>
</div><br
<div class="search-container">
        <input type="text" placeholder="Search...">
    </div><br>
<div class="grid">
    <div class="card">
        <h3>Mental Health Resources</h3>
        <p>Find mental health resources made specifically to benefit individuals with specific challenges and requirements.</p>
    </div>

    <div class="card">
        <h3>Mental Health: Strengthening Our Response</h3>
        <p>Includes strategies for mental health improvement, counseling, and strengthening health services.</p>
    </div>

    <div class="card">
        <h3>Mental Health</h3>
        <p>Access information on mental health, symptoms, prevention, and treatment strategies.</p>
    </div>

    <div class="card">
        <h3>Caring for Your Mental Health</h3>
        <p>Learn simple practices that can improve your daily mental well-being.</p>
    </div>

    <div class="card">
        <h3>Mental Health at Work</h3>
        <p>Tips for maintaining mental well-being in the workplace through communication and balance.</p>
    </div>

    <div class="card">
        <h3>The National Strategic Plan for Mental Health 2020–2025</h3>
        <p>Discover the strategy focused on improving nationwide mental health support systems