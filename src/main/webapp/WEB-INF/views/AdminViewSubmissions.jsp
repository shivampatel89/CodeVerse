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
							<h5 class="mb-0">Hackathon Submissions</h5>
							<a href="listHackathon" class="btn btn-sm btn-light">Back</a>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover align-middle">
								<thead class="table-dark">
									<tr>
										<th>Sr No</th>
										<th>Team/User</th>
										<th>PPT</th>
										<th>Title</th>
										<th>Description</th>
										<th>Submission Link</th>
										<th>Submitted At</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="s" items="${submissions}" varStatus="loop">
										<tr>
											<td>${loop.count}</td>
											<td>
												<c:choose>
													<c:when test="${not empty s.teamId}">
														<c:choose>
															<c:when test="${not empty teamNameMap[s.teamId]}">Team: ${teamNameMap[s.teamId]}</c:when>
															<c:otherwise>Team ID: ${s.teamId}</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>User ID: ${s.userId}</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${not empty s.teamId and not empty teamPptMap[s.teamId]}">
														<a href="${teamPptMap[s.teamId]}" target="_blank" class="btn btn-xs btn-outline-success">View PPT</a>
													</c:when>
													<c:when test="${empty s.teamId and not empty userPptMap[s.userId]}">
														<a href="${userPptMap[s.userId]}" target="_blank" class="btn btn-xs btn-outline-success">View PPT</a>
													</c:when>
													<c:otherwise>
														<span class="text-warning">Not available</span>
													</c:otherwise>
												</c:choose>
											</td>
											<td><strong>${s.title}</strong></td>
											<td><small>${s.description}</small></td>
											<td><a href="${s.submissionLink}" target="_blank" class="btn btn-xs btn-outline-info">View Project</a></td>
											<td>${s.submissionDate}</td>
										</tr>
									</c:forEach>
									<c:if test="${empty submissions and not empty registrations}">
										<c:forEach var="r" items="${registrations}" varStatus="loop">
											<tr>
												<td>${loop.count}</td>
												<td>
													<c:choose>
														<c:when test="${not empty r.teamId and not empty teamNameMap[r.teamId]}">Team: ${teamNameMap[r.teamId]}</c:when>
														<c:when test="${not empty r.teamId}">Team ID: ${r.teamId}</c:when>
														<c:otherwise>User ID: ${r.userId}</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${not empty r.pptLink}">
															<a href="${r.pptLink}" target="_blank" class="btn btn-xs btn-outline-success">View PPT</a>
														</c:when>
														<c:otherwise>
															<span class="text-warning">Not available</span>
														</c:otherwise>
													</c:choose>
												</td>
												<td><strong>${r.problemStatement}</strong></td>
												<td><small>Registered, final solution not submitted yet.</small></td>
												<td><span class="text-warning">Not submitted yet</span></td>
												<td>${r.registrationDate}</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty submissions and empty registrations}">
										<tr>
											<td colspan="7" class="text-center text-secondary py-4">No submissions yet.</td>
										</tr>
									</c:if>
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
