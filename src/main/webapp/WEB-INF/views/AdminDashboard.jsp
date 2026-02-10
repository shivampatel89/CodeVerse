<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- ==== CSS ==== -->
<jsp:include page="AdminCSS.jsp"></jsp:include>
</head>

<body>

<!-- ===== HEADER ===== -->
<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- ===== SIDEBAR ===== -->
<jsp:include page="AdminSidebar.jsp"></jsp:include>

<!-- ===== CONTENT ===== -->
<div class="content">
    <h4 class="mb-4">Dashboard Overview</h4>

    <div class="row g-3">
        <!-- Card 1 -->
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="card shadow-sm text-center">
                <div class="card-body">
                    <i class="bi bi-people fs-2 text-primary"></i>
                    <h6 class="mt-2">Total Users</h6>
                    <h4>120</h4>
                </div>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="card shadow-sm text-center">
                <div class="card-body">
                    <i class="bi bi-tags fs-2 text-success"></i>
                    <h6 class="mt-2">Categories</h6>
                    <h4>15</h4>
                </div>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="card shadow-sm text-center">
                <div class="card-body">
                    <i class="bi bi-person-check fs-2 text-warning"></i>
                    <h6 class="mt-2">Active Users</h6>
                    <h4>98</h4>
                </div>
            </div>
        </div>

        <!-- Card 4 -->
        <div class="col-12 col-sm-6 col-lg-3">
            <div class="card shadow-sm text-center">
                <div class="card-body">
                    <i class="bi bi-bar-chart fs-2 text-danger"></i>
                    <h6 class="mt-2">Reports</h6>
                    <h4>7</h4>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ===== FOOTER ===== -->
<jsp:include page="AdminFooter.jsp"></jsp:include>

<!-- ===== JS ===== -->
<script>
    document.querySelector(".menu-btn").onclick = function () {
        document.querySelector(".sidebar").classList.toggle("show");
    };
</script>

</body>
</html>
