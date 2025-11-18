<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Resource</title>
    <style>
        /* Styling based on the provided image design */
        body {
            font-family: Arial, sans-serif;
            background-color: #eaf8ff; /* Light blue background */
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            min-height: 100vh;
            padding-top: 50px;
        }
        .navbar {
            width: 100%;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 15px 5%;
            display: flex;
            justify-content: flex-start;
            gap: 30px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 10;
        }
        .navbar a {
            text-decoration: none;
            color: #333;
            font-size: 1.1em;
            font-weight: 500;
            transition: color 0.2s;
        }
        .navbar a:hover, .navbar a.active {
            color: #1a75ff;
            font-weight: bold;
        }
        .container {
            width: 90%;
            max-width: 400px;
            background: #eaf8ff;
            text-align: center;
            padding-top: 50px;
        }
        h1 {
            font-size: 1.8em;
            margin-bottom: 50px;
        }
        h2 {
            font-size: 1.5em;
            margin-bottom: 30px;
        }
        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            padding: 10px 15px;
        }
        .input-group input {
            border: none;
            outline: none;
            flex-grow: 1;
            padding: 5px;
            font-size: 1em;
        }
        .icon {
            color: #888;
            margin-right: 10px;
        }
        .btn-upload {
            width: 100%;
            padding: 15px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.1em;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.2s;
        }
        .btn-upload:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="homeprof.jsp">Home</a>
        <a href="uploadForm.jsp" class="active">Resources</a>
        <a href="profileprof.jsp">Profile</a>
    </div>

    <div class="container">
        <h1>Upload Page</h1>
        <h2>Welcome!</h2>

        <!-- 
            The form submits data using the POST method to uploadConfirm.jsp.
            We use POST because we are sending data that will potentially change state 
            (i.e., saving a new resource).
        -->
        <form action="uploadConfirm.jsp" method="POST">

            <!-- Name Field -->
            <div class="input-group">
                <!-- Simple placeholder for document icon -->
                <span class="icon">📄</span>
                <input type="text" name="resourceName" placeholder="Name" required>
            </div>

            <!-- Description Field -->
            <div class="input-group">
                <!-- Simple placeholder for lock/security icon -->
                <span class="icon">🔒</span> 
                <input type="text" name="description" placeholder="Description" required>
            </div>

            <!-- URL Link Field -->
            <div class="input-group">
                <!-- Simple placeholder for link icon -->
                <span class="icon">🔗</span>
                <input type="url" name="urlLink" placeholder="URL link" required>
            </div>

            <!-- Upload Button -->
            <button type="submit" class="btn-upload">
                upload
            </button>

        </form>
    </div>

</body>
</html>