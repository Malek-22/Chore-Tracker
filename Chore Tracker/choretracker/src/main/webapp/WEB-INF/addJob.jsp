<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Job</title>
    <style>
        /* Same root variables and base styles as index.jsp */
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
        .form-container {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            padding: 2rem;
            width: 100%;
            max-width: 600px;
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
        }
        .form-input:focus {
            outline: none;
            border-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(109, 40, 217, 0.1);
        }
        .btn {
            padding: 0.75rem 1.5rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
        }
        .btn:hover {
            background-color: var(--primary-light);
            transform: translateY(-2px);
        }
        .error {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">Add New Job</h2>
        <form:form action="/jobs/add" modelAttribute="job" method="post">
            <div class="form-group">
                <form:label path="title" class="form-label">Title</form:label>
                <form:input path="title" class="form-input"/>
                <form:errors path="title" class="error"/>
            </div>
            <div class="form-group">
                <form:label path="description" class="form-label">Description</form:label>
                <form:textarea path="description" class="form-input" rows="4"/>
                <form:errors path="description" class="error"/>
            </div>
            <div class="form-group">
                <form:label path="location" class="form-label">Location</form:label>
                <form:input path="location" class="form-input"/>
                <form:errors path="location" class="error"/>
            </div>
            <div class="form-group">
                <button type="submit" class="btn">Add Job</button>
                <a href="/home" class="btn" style="background-color: #e2e8f0; color: var(--dark); margin-left: 1rem;">Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>