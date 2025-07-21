<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chore Tracker | Dashboard</title>
    <style>
        :root {
            --primary: #6d28d9;
            --primary-light: #8b5cf6;
            --secondary: #f59e0b;
            --dark: #1e293b;
            --light: #f8fafc;
        }
        body {
            background-color: #f5f3ff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        .title {
            color: var(--dark);
            font-size: 1.75rem;
            font-weight: 700;
        }
        .title span {
            color: var(--primary);
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
            margin-right: 1rem;
        }
        .btn-secondary:hover {
            background-color: #cbd5e1;
        }
        .section-title {
            color: var(--dark);
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #ddd;
        }
        .card {
            background: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th {
            background-color: var(--primary);
            color: white;
            padding: 1rem;
            text-align: left;
        }
        .table td {
            padding: 1rem;
            border-bottom: 1px solid #eee;
        }
        .table tr:hover {
            background-color: #f8fafc;
        }
        .action-link {
            color: var(--primary);
            text-decoration: none;
            margin-right: 0.75rem;
            font-weight: 500;
        }
        .action-link:hover {
            text-decoration: underline;
        }
        .action-link.danger {
            color: #ef4444;
        }
        .action-link.warning {
            color: var(--secondary);
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1 class="title">Welcome, <span>${user.firstName} ${user.lastName}</span></h1>
            <div>
                <a href="/logout" class="btn btn-secondary">Logout</a>
                <a href="/jobs/add" class="btn btn-primary">+ Add Job</a>
            </div>
        </div>

        <div class="grid">
            <div class="card">
                <h2 class="section-title">Available Jobs</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Job</th>
                            <th>Location</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="job" items="${jobs}">
                            <tr>
                                <td>${job.title}</td>
                                <td>${job.location}</td>
                                <td>
                                    <a href="/jobs/${job.id}" class="action-link">View</a>
                                    <a href="/jobs/addToMyList/${job.id}" class="action-link">Add</a>
                                    <c:if test="${job.user.id == user.id}">
                                        <a href="/edit/${job.id}" class="action-link warning">Edit</a>
                                        <a href="/delete/${job.id}" class="action-link danger" 
                                           onclick="return confirm('Are you sure you want to delete this job?')">Delete</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="card">
                <h2 class="section-title">My Jobs</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Job</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="job" items="${myJobs}">
                            <tr>
                                <td>${job.title}</td>
                                <td>
                                    <a href="/jobs/${job.id}" class="action-link">View</a>
                                    <a href="/jobs/done/${job.id}" class="action-link">Done</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>