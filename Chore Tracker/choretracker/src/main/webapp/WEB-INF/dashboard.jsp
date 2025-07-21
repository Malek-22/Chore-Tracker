<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="max-w-6xl mx-auto mt-10">
<h1 class="text-3xl font-bold text-center mb-6">Dashboard</h1>

<div class="flex justify-between mb-4">
  <a href="/jobs/add" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">+ Add Job</a>
  <a href="/logout" class="px-4 py-2 bg-gray-400 rounded hover:bg-gray-500">Logout</a>
</div>

<div class="grid grid-cols-2 gap-6">
  <div>
    <h2 class="text-xl font-bold mb-2">Available Jobs</h2>
    <c:forEach var="job" items="${allJobs}">
      <div class="bg-white p-4 mb-2 rounded shadow">
        <h3 class="font-semibold">
          <a href="/jobs/${job.id}" class="text-blue-600 hover:underline">${job.title}</a>
        </h3>
        <p>Location: ${job.location}</p>
      </div>
    </c:forEach>
  </div>

  <div>
    <h2 class="text-xl font-bold mb-2">My Jobs</h2>
    <c:forEach var="job" items="${myJobs}">
      <div class="bg-white p-4 mb-2 rounded shadow">
        <h3 class="font-semibold">
          <a href="/jobs/${job.id}" class="text-blue-600 hover:underline">${job.title}</a>
        </h3>
        <p>Location: ${job.location}</p>
        <a href="/jobs/markDone/${job.id}" class="text-sm text-red-600 hover:underline">Mark as Done</a>
      </div>
    </c:forEach>
  </div>
</div>
</div>
</body>
</html>
