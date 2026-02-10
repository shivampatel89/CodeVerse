<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>View User</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .profile-img {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #dee2e6;
        }
        .label {
            font-weight: 600;
            color: #555;
            width: 160px;
        }
    </style>
</head>

<body class="bg-light">

<div class="container my-4">

    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">User Profile</h4>
        </div>

        <div class="card-body">
            <div class="row">

                <!-- LEFT : PROFILE -->
                <div class="col-md-3 text-center">
                    <c:choose>
                        <c:when test="${not empty user.profilePicURL}">
                            <img src="${user.profilePicURL}" class="profile-img">
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/130" class="profile-img">
                        </c:otherwise>
                    </c:choose>

                    <h5 class="mt-3">${user.firstName} ${user.lastName}</h5>

                    <span class="badge bg-info text-dark">${user.role}</span>
                </div>

                <!-- RIGHT : DETAILS -->
                <div class="col-md-9">
                    <table class="table table-borderless">
                        <tr>
                            <td class="label">User ID</td>
                            <td>${user.userId}</td>
                        </tr>
                        <tr>
                            <td class="label">Email</td>
                            <td>${user.email}</td>
                        </tr>
                        <tr>
                            <td class="label">Gender</td>
                            <td>${user.gender}</td>
                        </tr>
                        <tr>
                            <td class="label">Birth Year</td>
                            <td>${user.birthYear}</td>
                        </tr>
                        <tr>
                            <td class="label">Contact No</td>
                            <td>${user.contactNum}</td>
                        </tr>
                        <tr>
                            <td class="label">Created At</td>
                            <td>${user.createdAt}</td>
                        </tr>
                        <tr>
                            <td class="label">Status</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.active}">
                                        <span class="badge bg-success">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Inactive</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                       

                        <!-- USER DETAIL -->
                        <tr>
                            <td class="label">Country</td>
                            <td>${userDetail.country}</td>
                        </tr>
                        <tr>
                            <td class="label">State</td>
                            <td>${userDetail.state}</td>
                        </tr>
                        <tr>
                            <td class="label">City</td>
                            <td>${userDetail.city}</td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>

        <div class="card-footer text-end">
            <a href="listUser" class="btn btn-secondary">Back</a>
            <a href="editUser?userId=${user.userId}" class="btn btn-warning">Edit</a>
        </div>
    </div>

</div>

</body>
</html>
