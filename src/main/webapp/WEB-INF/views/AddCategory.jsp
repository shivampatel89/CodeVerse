<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="AdminCSS.jsp"></jsp:include>
<style >

.admin-header {
	background: #1e3a8a;
	color: #fff;
}

.card-body {
	background: #e9ecef; /* Soft grey */
}

.form-label {
	color: #111827 !important; /* Dark text */
	font-weight: 600;
}

.form-control, .form-select {
	background: #f8f9fa; /* Form background se match karta hua */
	border: 1px solid #ced4da;
	color: #111827 !important;
	height: 45px;
}

.form-control:focus, .form-select:focus {
	background: #ffffff;
	border-color: #2563eb;
	color: #111827 !important;
	box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.15);
}



</style>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<jsp:include page="AdminHeader.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row justify-content-center">
						<!-- <div class="col-12 col-sm-10 col-md-6 col-lg-4"> -->
						<div class="col-lg-8 col-md-10 col-12">
							<div class="card shadow">
								<div class="card-header admin-header">
									<h4 class="mb-0">Add Category</h4>
								</div>
								<!-- <div class="category-card">-->
								<!-- <h3 class="text-center mb-4">Add New Category</h3> -->
								<div class="card-body">
									<form action="/saveCategory" method="post">

										<div class="mb-3">
											<label class="form-label ">Category Name</label> <input
												type="text" name="categoryName" class="form-control"
												placeholder="Enter category name" required>
										</div>

										<button type="submit" class="btn btn-primary w-100">
											Save Category</button>

										<div class="text-center mt-3">
											<a href="/" class="text-decoration-none"> Back to
												Dashboard </a>
										</div>

									</form>

								</div>
							</div>
						</div>
					</div>
				<!-- </div> -->
				</div>
				
				<!-- partial:partials/_footer.html -->
				
				<!-- partial -->

				<!-- main-panel ends -->
				<jsp:include page="AdminFooter.jsp"></jsp:include>
			</div>
			<!-- page-body-wrapper ends -->
		</div>
		<!-- container-scroller -->
		</div>
</body>
</html>