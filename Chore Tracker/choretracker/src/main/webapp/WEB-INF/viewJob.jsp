<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Job</title>
    <style>
        /* Consistent with other pages */
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
        .job-container {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            padding: 2rem;
            width: 100%;
            max-width: 800px;
        }
        .job-title {
            color: var(--primary);
            font-size: 1.75rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }
        .job-meta {
            color: var(--dark);
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
        }
        .job-section {
            margin-bottom: 1.5rem;
        }
        .section-label {
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.5rem;
            display: block;
        }
        .section-content {
            color: #4b5563;
            line-height: 1.6;
        }
        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background-color: var(--primary);
            color: white;
            border: none;
        }
        .btn-primary:hover {
            background-color: var(--primary-light);
            transform: translateY(-2px);
        }
        .btn-secondary {
            background-color: #e2e8f0;
            color: var(--dark);
            border: none;
        }
        .btn-secondary:hover {
            background-color: #cbd5e1;
        }
    </style>
</head>
<body>
    <div class="job-container">
        <h1 class="job-title">${job.title}</h1>
        <div class="job-meta">
            Posted by ${job.user.firstName} ${job.user.lastName} on ${job.createdAt}
        </div>
        
        <div class="job-section">
            <span class="section-label">Description</span>
            <p class="section-content">${job.description}</p>
        </div>
        
        <div class="job-section">
            <span class="section-label">Location</span>
            <p class="section-content">${job.location}</p>
        </div>
        
        <div class="btn-group">
            <a href="/home" class="btn btn-secondary">Back to Dashboard</a>
            <c:if test="${job.user.id != user.id}">
                <a href="/jobs/addToMyList/${job.id}" class="btn btn-primary">Add to My Jobs</a>
            </c:if>
        </div>
    </div>
</body>
</html>