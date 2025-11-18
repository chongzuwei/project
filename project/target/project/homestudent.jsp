<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #d9f0f8; /* light blue */
            font-family: Arial, sans-serif;
        }

        /* NAVIGATION */
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
            text-decoration: underline;
        }

        /* CONTENT */
        .content {
            text-align: center;
            padding-top: 40px;
        }

        .main-image {
            width: 300px;
            border-radius: 15px;
        }

        .box {
            width: 70%;
            margin: 30px auto;
            padding: 25px;
            background: white;
            border-radius: 15px;
            font-size: 17px;
            line-height: 1.6;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
    </style>

</head>
<body>

    <!-- NAVIGATION BAR -->
    <div class="navbar">
        <a href="homestudent.jsp" style="font-weight:bold;">Home</a>
        <a href="resourcestudent.jsp">Resource</a>
        <a href="selfAssessment.jsp">Self-Assessment</a>
        <a href="activity.jsp">Activity Community</a>
        <a href="profilestudent.jsp">Profile</a>
    </div>

    <!-- MAIN CONTENT -->
    <div class="content">
        <img src="images/mental_health.png" class="main-image" alt="Mental Health">

        <div class="box">
            Nowadays, mental health issues among higher education
            students have become a growing concern in recent years.
            Many students experience stress, anxiety, depression, and
            burnout due to academic pressures, financial stress, and
            social challenges. Despite the availability of counselling
            services, several barriers prevent students from seeking
            timely help such as stigma, lack of awareness, difficulty
            in accessing professional support, and the absence of
            centralized digital resources.
        </div>

        <div class="box">
            We propose to build a new system named “Digital Mental
            Health Literacy Hub”. This system is designed to help higher
            education students explore topics on mental health resources
            and access information and tools. A self-assessment feature
            is also included for the student to check on their own mental
            health status. The system also includes interactive learning
            through gamification, community sharing as well as tracking
            activity and wellness.
        </div>
    </div>

</body>
</html>
