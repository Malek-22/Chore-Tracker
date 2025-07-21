<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chore Tracker | Login</title>
    <style>
        :root {
            --primary: #6d28d9;
            --primary-light: #8b5cf6;
            --secondary: #f59e0b;
            --dark: #1e293b;
            --light: #f8fafc;
        }
        body {
            background: linear-gradient(135deg, #f3e8ff, #c4b5fd);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 1rem;
        }
        .container {
            max-width: 1200px;
            width: 100%;
        }
        .card {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }
        .form-container {
            padding: 2rem;
        }
        .form-title {
            color: var(--primary);
            margin-bottom: 1.5rem;
            font-weight: 700;
            font-size: 1.5rem;
        }
        .form-group {
            margin-bottom: 1.25rem;
        }
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--dark);
            font-weight: 500;
        }
        .form-input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: all 0.2s;
        }
        .form-input:focus {
            outline: none;
            border-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(109, 40, 217, 0.1);
        }
        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            width: 100%;
        }
        .btn:hover {
            background-color: var(--primary-light);
            transform: translateY(-2px);
        }
        .text-center {
            text-align: center;
        }
        .grid {
            display: grid;
            gap: 2rem;
        }
        @media (min-width: 768px) {
            .grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        .error {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="grid">
                <div class="form-container">
                    <h2 class="form-title">Register</h2>
                    <form:form action="/register" modelAttribute="newUser">
                        <div class="form-group">
                            <form:label path="firstName" class="form-label">First Name</form:label>
                            <form:input path="firstName" class="form-input"/>
                            <form:errors path="firstName" class="error"/>
                        </div>
                        <div class="form-group">
                            <form:label path="lastName" class="form-label">Last Name</form:label>
                            <form:input path="lastName" class="form-input"/>
                            <form:errors path="lastName" class="error"/>
                        </div>
                        <div class="form-group">
                            <form:label path="email" class="form-label">Email</form:label>
                            <form:input path="email" class="form-input"/>
                            <form:errors path="email" class="error"/>
                        </div>
                        <div class="form-group">
                            <form:label path="password" class="form-label">Password</form:label>
                            <form:password path="password" class="form-input"/>
                            <form:errors path="password" class="error"/>
                        </div>
                        <div class="form-group">
                            <form:label path="confirm" class="form-label">Confirm Password</form:label>
                            <form:password path="confirm" class="form-input"/>
                            <form:errors path="confirm" class="error"/>
                        </div>
                        <button type="submit" class="btn">Register</button>
                    </form:form>
                </div>
                
                <div class="form-container">
                    <h2 class="form-title">Login</h2>
                    <form:form action="/login" modelAttribute="newLogin">
                        <div class="form-group">
                            <form:label path="email" class="form-label">Email</form:label>
                            <form:input path="email" class="form-input"/>
                            <form:errors path="email" class="error"/>
                        </div>
                        <div class="form-group">
                            <form:label path="password" class="form-label">Password</form:label>
                            <form:password path="password" class="form-input"/>
                            <form:errors path="password" class="error"/>
                        </div>
                        <button type="submit" class="btn">Login</button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>