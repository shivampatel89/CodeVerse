<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Category List</title>

    <!-- CSS -->
   <jsp:include page="AdminCSS.jsp"></jsp:include>

    <style>
        body {
        	
            background: #f4f6f9;
            min-height: 100vh;
            padding: 40px 0;
        }
        .card {
        	margin-top:80px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        .table thead {
            background-color: #f1f3f5;
        }
    </style>
</head>

<body>

	<!-- Header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>
	
	<!-- Header -->
	<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>
	
<div class="content">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-10">
            <div class="card">
                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="mb-0">Category List</h4>
                        <a href="/addCategory" class="btn btn-primary btn-sm">
                            + Add Category
                        </a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle text-center">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Category Name</th>
                                    <th>Active</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:if test="${empty categoryList}">
                                    <tr>
                                        <td colspan="4" class="text-muted">
                                            No categories found
                                        </td>
                                    </tr>
                                </c:if>

                                <c:forEach items="${categoryList}" var="cat" varStatus="status">
                                    <tr>
                                        <td>${status.count}</td>
                                        <td>${cat.categoryName}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${cat.active}">
                                                    <span class="badge bg-success">Yes</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-danger">No</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="/edit-category/${cat.categoryId}"
                                               class="btn btn-sm btn-warning">
                                                Edit
                                            </a>
                                            <a href="/delete-category/${cat.categoryId}"
                                               class="btn btn-sm btn-danger">
                                                Delete
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <div class="text-center mt-3">
                        <a href="/adminDashboard" class="text-decoration-none fw-semibold">
                            Back to Dashboard
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
