<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Self Assessment</title>

    <style>
        body {
            padding: 0;
            margin: 0;
            background: #d9f0f8;
            font-family: Arial, sans-serif;
        }

        /* NAVIGATION */
        .navbar {
            width: 100%;
            padding: 15px 40px;
            background: white;
            font-size: 18px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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

        .box {
            width: 70%;
            margin: 30px auto;
            padding: 25px;
            background: white;
            border-radius: 15px;
            font-size: 17px;
            line-height: 1.6;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<!-- NAVIGATION BAR -->
<div class="navbar">
    <a href="homestudent.jsp">Home</a>
    <a href="resourcestudent.jsp">Resource</a>
    <a href="selfAssessment.jsp">Self-Assessment</a>
    <a href="activity.jsp">Activity Community</a>
    <a href="profilestudent.jsp">Profile</a>
</div>

<div class="content">
    <h2>Assessment: PHQ - 9</h2>
    <p>Select one that describes you the best:</p>
    <form>
        <p>Little interest or pleasure in doing things</p>
        <input type="radio" id="notatall" name="selection" value="0">
        <label for="notatall">Not At All</label>
        <input type="radio" id="several" name="selection" value="1">
        <label for="several">Several Days</label>
        <input type="radio" id="half" name="selection" value="2">
        <label for="half">More than half the days</label>
        <input type="radio" id="everyday" name="selection" value="3">
        <label for="everyday">Nearly Every day</label>
    </form>
</div>
</body>
</html>
