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
							<h5 class="mb-0">Hackathon List</h5>
						</div>

						<div class="card-body table-responsive">

							<table class="table table-hover align-middle text-center">

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
													<td>${loop.count}</td>
													<td>${h.title}</td>
													<td><span
														class="badge 
                                        ${h.status == 'Active' ? 'bg-success' : 'bg-info'}">
															${h.status} </span></td>
													<td>${h.event_type}</td>
													<td>${h.payment}</td>
													<td>${h.minTeamSize}</td>
													<td>${h.maxTeamSize}</td>
													<td>${h.location}</td>
													<td>${h.registrationStartDate}</td>
													<td>${h.registrationEndDate}</td>
													<td><a
														href="viewHackathon?hackathonId=${h.hackathonId}"
														class="btn btn-outline-info btn-sm mb-1"> View </a> <a
														href="editHackathon?hackathonId=${h.hackathonId}"
														class="btn btn-outline-warning btn-sm mb-1"> Edit </a> <a
														href="deleteHackathon?hackathonId=${h.hackathonId}"
														class="btn btn-outline-danger btn-sm mb-1"
														onclick="return confirm('Are you sure you want to delete this hackathon?');">
															Delete </a></td>

												</tr>
											</c:forEach>
										</c:when>

										<c:otherwise>
											<tr>
												<td colspan="12" class="text-muted">No Hackathons Found
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
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