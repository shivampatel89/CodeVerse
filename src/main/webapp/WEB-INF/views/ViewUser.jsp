<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
.admin-header {
    background-color: #1e3a8a ;
    color: #fff;
    font-weight: 600;
}

.table thead th {
		color:#fff;
        font-size: 14px;
        letter-spacing: 0.5px;
    }

    .table tbody tr {
        transition: 0.2s ease-in-out;
        color:#fff;
    }

    .table tbody tr:hover {
        background-color: #f8f9fa;
        transform: scale(1.01);
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
					<div class="card shadow-sm border-0">
						<div class="card-header admin-header">
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
											<img src="https://via.placeholder.com/130"
												class="profile-img">
										</c:otherwise>
									</c:choose>

									<h5 class="mt-3">${user.firstName}${user.lastName}</h5>

									<span class="badge bg-info text-dark">${user.role}</span>
								</div>

								<!-- RIGHT : DETAILS -->
								<div class="col-md-9">
									<table class="table table-hover align-middle text-center">
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
											<td><c:choose>
													<c:when test="${user.active}">
														<span class="badge bg-success">Active</span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-danger">Inactive</span>
													</c:otherwise>
												</c:choose></td>
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
							<a href="listUser" class="btn btn-secondary">Back</a> <a
								href="editUser?userId=${user.userId}" class="btn btn-warning">Edit</a>
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