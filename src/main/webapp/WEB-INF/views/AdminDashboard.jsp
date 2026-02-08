<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
	<!-- CSS -->
    <jsp:include page="AdminCSS.jsp"></jsp:include>
</head>
<body>

	<!-- Header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	
        <div class="col-12 col-md-9 col-lg-10 content">
            <h2>Welcome Admin </h2>
            <p class="text-muted">This is your dashboard overview.</p>
            <div class="row mt-4">
                <div class="col-sm-6 col-lg-3 mb-3">
                    <div class="card shadow-sm"><div class="card-body text-center"><h6>Total Users</h6><h3>120</h3></div></div>
                </div>
                <div class="col-sm-6 col-lg-3 mb-3">
                    <div class="card shadow-sm"><div class="card-body text-center"><h6>Categories</h6><h3>15</h3></div></div>
                </div>
                <div class="col-sm-6 col-lg-3 mb-3">
                    <div class="card shadow-sm"><div class="card-body text-center"><h6>Active Users</h6><h3>98</h3></div></div>
                </div>
                <div class="col-sm-6 col-lg-3 mb-3">
                    <div class="card shadow-sm"><div class="card-body text-center"><h6>Reports</h6><h3>7</h3></div></div>
                </div>
            </div>
        </div>
   

	<!-- Footer -->
	<jsp:include page="AdminFooter.jsp"></jsp:include>

</body>
</html>
