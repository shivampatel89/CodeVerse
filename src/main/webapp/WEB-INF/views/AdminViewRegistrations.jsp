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
}
.table tbody tr {
    color:#fff;
}
</style>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="AdminHeader.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card shadow-sm border-0">
						<div class="card-header admin-header d-flex justify-content-between">
							<h5 class="mb-0">Participant Registrations</h5>
							<a href="listHackathon" class="btn btn-sm btn-light">Back</a>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover align-middle text-center">
								<thead class="table-dark">
									<tr>
										<th>Sr No</th>
										<th>User ID</th>
										<th>Team ID</th>
										<th>Status</th>
										<th>Date</th>
										<th>Stripe Session</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="r" items="${registrations}" varStatus="loop">
										<tr>
											<td>${loop.count}</td>
											<td>${r.userId}</td>
											<td>${r.teamId != null ? r.teamId : 'Solo'}</td>
											<td><span class="badge ${r.paymentStatus == 'Success' ? 'bg-success' : 'bg-warning'}">${r.paymentStatus}</span></td>
											<td>${r.registrationDate}</td>
											<td class="small">${r.stripeSessionId}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<jsp:include page="AdminFooter.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>
