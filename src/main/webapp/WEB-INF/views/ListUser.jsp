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
							<h4 class="mb-4">User List</h4>
						</div>

						<!-- Responsive Table -->
						<div class="card-body table-responsive">

							<table class="table table-hover align-middle text-center">

								<thead class="table-dark">

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

											<td>${u.firstName} ${u.lastName}</td>

											<td>${u.email}</td>

											<td><span class="badge bg-primary"> ${u.role} </span></td>

											<td>${u.gender}</td>

											<td>${u.birthYear}</td>

											<td><img src="${u.profilePicURL}" alt="Profile"
												width="40" height="40" class="rounded-circle"></td>

											<td><c:choose>
													<c:when test="${u.active}">
														<span class="badge bg-success">Active</span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-danger">Inactive</span>
													</c:otherwise>
												</c:choose></td>

											<td><a href="editUser?userId=${u.userId}"
												class="btn btn-sm btn-warning"> Edit </a> 
												<a href="deleteUser?userId=${u.userId}"
												class="btn btn-sm btn-danger"
												onclick="return confirm('Are you sure?')"> Delete </a> <!-- View -->
												<a href="viewUser?userId=${u.userId}"
												class="btn btn-sm btn-info"> View </a></td>
										</tr>
									</c:forEach>

									<!-- Agar list empty ho -->
									<c:if test="${empty users}">
										<tr>
											<td colspan="9" class="text-muted">No users found</td>
										</tr>
									</c:if>
								</tbody>
							</table>
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