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
    <a href="./resourcestudent.jsp">Resource</a>
    <a href="./selfAssessment.jsp">Self-Assessment</a>
    <a href="activity.jsp">Activity Community</a>
    <a href="profilestudent.jsp">Profile</a>
</div>

<div class="content">
    <h2>Mental Health Self Assessment</h2>


    <p style="text-align: center">Please select an assessment type below:</p>
</div>
    <div class="box">
        <h3>Patient Health Questionnaire (PHQ - 9)</h3>
        <p>
            Details:
        <ul>
            <li>Number of Questions: 9</li>
            <li>Purpose: Scan for presence and severity of depression</li>
        </ul>
        </p>
        <a href="phq9.jsp">Take</a>
    </div>
<%--    <div class="box">--%>
<%--        <h3>Depression, Anxiety & Stress Scale</h3>--%>
<%--        <p>--%>
<%--            Details:--%>
<%--        <ul>--%>
<%--            <li>Number of Questions: 21</li>--%>
<%--            <li>Purpose: Measure current mental health and emotional status, identifying Depression, Anxiety and--%>
<%--                Stress--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--        </p>--%>
<%--        <a href="#">Take</a>--%>
<%--    </div>--%>
<%--    <div class="box">--%>
<%--        <h3>Copenhagen Burnout Inventory (CBI)</h3>--%>
<%--        <p>--%>
<%--            Details:--%>
<%--        <ul>--%>
<%--            <li>Number of questions: 13</li>--%>
<%--            <li>Purpose: Identify magnitude of Personal Burnout and Work-related Burnout</li>--%>
<%--        </ul>--%>
<%--        </p>--%>
<%--        <a href="#">Take</a>--%>
<%--    </div>--%>
</body>
</html>
