<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Profile</title>
<style>
    /* Basic CSS for a centered, clean look similar to the image */
    body {
        font-family: sans-serif;
        background-color: #f8f8f8;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        padding-top: 50px;
    }
    .container {
        width: 300px;
        padding: 20px;
        background: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Optional subtle shadow */
    }
    h1 {
        font-weight: bold;
        font-size: 1.5em;
        margin-bottom: 40px;
    }
    h2 {
        font-size: 1.2em;
        margin-bottom: 30px;
    }
    .input-group {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        border: 1px solid #ddd; /* Subtle border for input fields */
        border-radius: 5px;
        padding: 10px;
    }
    .input-group input {
        border: none;
        outline: none;
        flex-grow: 1;
        padding-left: 10px;
        font-size: 1em;
    }
    .input-group i {
        color: #555;
    }
    .btn-edit {
        width: 100%;
        padding: 15px;
        background-color: black;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1em;
        cursor: pointer;
        margin-top: 10px;
    }
    /* Simple placeholders for icons, as we can't use an actual icon library here */
    .icon {
        margin-right: 10px;
    }
</style>
</head>
<body>

    <h1>Edit user's profile Page</h1>

    <div class="container">
        <h2>Welcome!</h2>

        <%
            com.secj3303.model.User user = (com.secj3303.model.User) session.getAttribute("user");
            String email = user != null ? user.getEmail() : "";
            String firstName = user != null ? user.getFirstName() : "";
            String lastName = user != null ? user.getLastName() : "";
            String biography = user != null && user.getBiography() != null ? user.getBiography() : "";
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");
        %>

        <% if (error != null && !error.isEmpty()) { %>
            <div style="color: red; padding: 10px; margin-bottom: 15px; background: #ffe0e0; border-radius: 5px;">
                <%= error %>
            </div>
        <% } %>

        <% if (success != null && !success.isEmpty()) { %>
            <div style="color: green; padding: 10px; margin-bottom: 15px; background: #e0ffe0; border-radius: 5px;">
                <%= success %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/auth/updateProfile" method="post">

            <div class="input-group">
                <span class="icon">👤</span> <input type="email" name="email" placeholder="e-mail" value="<%= email %>" required>
            </div>

            <div class="input-group">
                <span class="icon">📛</span> <input type="text" name="firstName" placeholder="First name" value="<%= firstName %>" required>
            </div>

            <div class="input-group">
                <span class="icon">📛</span> <input type="text" name="lastName" placeholder="Last name" value="<%= lastName %>" required>
            </div>

            <div class="input-group" style="height:auto; align-items:flex-start;">
                <span class="icon">📝</span> <textarea name="biography" placeholder="Biography" style="border:none; outline:none; flex-grow:1; padding-left:10px; font-size:1em; resize:vertical; min-height:60px;"><%= biography %></textarea>
            </div>

            <div class="input-group">
                <span class="icon">🔒</span> <input type="password" name="password" placeholder="New password (leave blank to keep)" >
                <span class="icon">👁️</span>
            </div>

            <div class="input-group">
                <span class="icon">🔒</span> <input type="password" name="confirmPassword" placeholder="Confirm password" >
                <span class="icon">👁️</span>
            </div>

            <button type="submit" class="btn-edit">
                Save changes
            </button>

        </form>
    </div>

</body>
</html>