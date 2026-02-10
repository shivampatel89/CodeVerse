<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <title>Hackathon List</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .admin-header {
            background-color: #212529;
            color: #fff;
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="container-fluid mt-4">

    <div class="card shadow">

        <!-- Header -->
        <div class="card-header admin-header d-flex justify-content-between align-items-center">
            <h4 class="mb-0">Hackathon List</h4>
            <a href="addHackathon" class="btn btn-light btn-sm">+ Add Hackathon</a>
        </div>

        <!-- Body -->
        <div class="card-body table-responsive">

            <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-dark">
                <tr>
                    <th>Sr No</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Event Type</th>
                    <th>Payment</th>
                    <th>Min Team</th>
                    <th>Max Team</th>
                    <th>Location</th>
                    <th>Reg Start</th>
                    <th>Reg End</th>
                    <th>Action</th>
                </tr>
                </thead>

                <tbody>
                <c:choose>
                    <c:when test="${not empty hackathonList}">
                        <c:forEach var="h" items="${hackathonList}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${h.title}</td>
                                <td>
                                    <span class="badge 
                                        ${h.status == 'Active' ? 'bg-success' : 'bg-secondary'}">
                                        ${h.status}
                                    </span>
                                </td>
                                <td>${h.event_type}</td>
                                <td>${h.payment}</td>
                                <td>${h.minTeamSize}</td>
                                <td>${h.maxTeamSize}</td>
                                <td>${h.location}</td>
                                <td>${h.registrationStartDate}"</td>
                                <td> ${h.registrationEndDate}</td>
                                <td>
    								<a href="viewHackathon?hackathonId=${h.hackathonId}"class="btn btn-info btn-sm mb-1">
       										 View
    									</a>

    								<a href="editHackathon?hackathonId=${h.hackathonId}"class="btn btn-warning btn-sm mb-1">
        									 Edit
   										 </a>

    								<a href="deleteHackathon?hackathonId=${h.hackathonId}" class="btn btn-danger btn-sm mb-1"
       									onclick="return confirm('Are you sure you want to delete this hackathon?');">
        									Delete
    									</a>
									</td>

                            </tr>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td colspan="12" class="text-muted">
                                No Hackathons Found
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>

            </table>

        </div>

    </div>

</div>

</body>
</html>
