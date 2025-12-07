<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .navbar {
        width: 100%;
        background-color: white;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 15px 30px;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
        display: flex;
        gap: 30px;
    }
    .navbar a {
        text-decoration: none;
        color: #333;
        font-size: 16px;
        font-weight: 500;
        transition: color 0.2s;
    }
    .navbar a:hover {
        color: #1a75ff;
    }
</style>
<div class="navbar">
    <a href="<%= request.getContextPath() %>/homeadmin">Dashboard</a>
    <a href="<%= request.getContextPath() %>/profileadmin">Profile</a>
</div>