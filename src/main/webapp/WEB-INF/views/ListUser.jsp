<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Users</title>

    <!-- Admin CSS -->
    <jsp:include page="AdminCSS.jsp"></jsp:include>
</head>

<body>

<!-- ================= HEADER ================= -->
<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ================= SIDEBAR ================= -->
<jsp:include page="AdminSidebar.jsp"></jsp:include>

<!-- ================= CONTENT ================= -->
<div class="content">

    <h4 class="mb-4">User List</h4>

    <div class="card shadow-sm">
        <div class="card-body">

            <!-- Responsive Table -->
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle text-center">
                    <thead class="table-light">
                        <tr>
                            <th>SrNo</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Gender</th>
                            <th>Birth Year</th>
                            <th>Profile</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="u" items="${users}" varStatus="s">
                            <tr>
                                <td>${s.count}</td>

                                <td>
                                    ${u.firstName} ${u.lastName}
                                </td>

                                <td>${u.email}</td>

                                <td>
                                    <span class="badge bg-primary">
                                        ${u.role}
                                    </span>
                                </td>

                                <td>${u.gender}</td>

                                <td>${u.birthYear}</td>

                                <td>
                                    <img src="${u.profilePicURL}"
                                         alt="Profile"
                                         width="40"
                                         height="40"
                                         class="rounded-circle">
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${u.active}">
                                            <span class="badge bg-success">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <a href="editUser?userId=${u.userId}"
                                       class="btn btn-sm btn-warning">
                                        Edit
                                    </a>
                                    <a href="deleteUser?userId=${u.userId}"
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure?')">
                                        Delete
                                    </a>
                                      <!-- View -->
    								<a href="viewUser?userId=${u.userId}"
       									class="btn btn-sm btn-info text-white mb-1">
        								View
    								</a>
                                </td>
                            </tr>
                        </c:forEach>

                        <!-- Agar list empty ho -->
                        <c:if test="${empty users}">
                            <tr>
                                <td colspan="9" class="text-muted">
                                    No users found
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

</div>

<!-- ================= FOOTER ================= -->
<jsp:include page="AdminFooter.jsp"></jsp:include>

</body>
</html>
