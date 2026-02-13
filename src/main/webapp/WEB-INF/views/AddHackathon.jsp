<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="AdminCSS.jsp"></jsp:include>
<style>
/*  body {
            background-color: #f4f6f9;
        } */
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
						<div class="col-lg-8 col-md-10 col-12">

							<div class="card shadow">
								<div class="card-header admin-header">
									<h4 class="mb-0">Add Hackathon</h4>
								</div>


								<div class="card-body">
									<form action="saveHackathon" method="post">

										<!-- Title -->
										<div class="mb-3">
											<label class="form-label">Title</label> <input type="text"
												name="title" class="form-control" required>
										</div>

										<!-- Status & Event Type -->
										<!-- Row 1 -->
										<div class="row">

											<div class="col-md-6 mb-3">
												<label class="form-label">Status</label> <select
													name="status" class="form-select w-100">
													<option value="">Select</option>
													<option>Upcoming</option>
													<option>Ongoing</option>
													<option>Completed</option>
												</select>
											</div>

											<div class="col-md-6 mb-3">
												<label class="form-label">Event Type</label> <select
													name="event_type" class="form-select w-100">
													<option value="">Select</option>
													<option>Online</option>
													<option>Offline</option>
													<option>Hybrid</option>
												</select>
											</div>

										</div>

										<!-- Row 2 -->
										<div class="row">

											<div class="col-md-6 mb-3">
												<label class="form-label">Payment</label> <select
													name="payment" class="form-select w-100">
													<option value="">Select</option>
													<option>Free</option>
													<option>Paid</option>
												</select>
											</div>

											<div class="col-md-6 mb-3">
												<label class="form-label">User Type</label> <select
													name="userTypeId" class="form-select w-100">
													<option value="">-- Select User Type --</option>
													<c:forEach var="u" items="${allUserType}">
														<option value="${u.userTypeId}">${u.userType}</option>
													</c:forEach>
												</select>
											</div>

										</div>

										<!-- Team Size -->
										<div class="row">
											<div class="col-md-6 mb-3">
												<label class="form-label">Minimum Team Size</label> <input
													type="number" name="minTeamSize" class="form-control"
													min="1" required>
											</div>

											<div class="col-md-6 mb-3">
												<label class="form-label">Maximum Team Size</label> <input
													type="number" name="maxTeamSize" class="form-control"
													min="1" required>
											</div>
										</div>

										<!-- Location -->
										<div class="mb-3">
											<label class="form-label">Location</label> <input type="text"
												name="location" class="form-control">
										</div>



										<!-- Registration Dates -->
										<div class="row">
											<div class="col-md-6 mb-3">
												<label class="form-label">Registration Start Date</label> <input
													type="date" name="registrationStartDate"
													class="form-control" required>
											</div>

											<div class="col-md-6 mb-3">
												<label class="form-label">Registration End Date</label> <input
													type="date" name="registrationEndDate" class="form-control"
													required>
											</div>
										</div>

										<!-- Buttons -->
										<div class="text-end mt-4">
											<a href="adminDashboard" class="btn btn-secondary">Cancel</a>
											<button type="submit" class="btn btn-success">Save
												Hackathon</button>
										</div>

									</form>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<jsp:include page="AdminFooter.jsp"></jsp:include>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>
</html>