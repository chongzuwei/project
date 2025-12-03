<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Self Assessment</title>
    <link rel="stylesheet" href="styles.css">
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
    <h2>Result</h2>

    <div class="box">
        <p>Assessment type: PHQ - 9</p>
        <p>Score: 0</p>
        <p>Category: Minimal</p>

        <div class="progress-container">
            <div class="segments">
                <div class="segment" style="background-color: #8bc34a;"><label>Minimal</label></div>
                <div class="segment" style="background-color: #ffeb3b;"><label>Mild</label></div>
                <div class="segment" style="background-color: #ff9800;"><label>Moderate</label></div>
                <div class="segment" style="background-color: #f44336;"><label>Severe</label></div>
            </div>

            <div class="cutoffs">
                <span>0</span>
                <span>5</span>
                <span>10</span>
                <span>15</span>
                <span>20</span>
            </div>
        </div>

        <a href="homestudent.jsp">Back to home</a>
    </div>
</div>
</body>
</html>
