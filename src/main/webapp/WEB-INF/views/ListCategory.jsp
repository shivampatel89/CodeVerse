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
						<div
							class="card-header admin-header d-flex justify-content-between align-items-center mb-3">
							<h5 class="mb-0">Category List</h5>
							<a href="/addCategory" class="btn btn-primary btn-sm"> + Add
								Category </a>
						</div>
						<div class="card-body table-responsive">
							<table
								class="table table-hover align-middle text-center">
								<thead class="table-dark">
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
											<td colspan="4" class="text-muted">No categories found</td>
										</tr>
									</c:if>

									<c:forEach items="${categoryList}" var="cat" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${cat.categoryName}</td>
											<td><c:choose>
													<c:when test="${cat.active}">
														<span class="badge bg-success">Active</span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-danger">Inactive</span>
													</c:otherwise>
												</c:choose></td>
											<td><a href="/editCategory?categoryId=${cat.categoryId}"
												class="btn btn-sm btn-warning"> Edit </a> 
												<a href="/deleteCategory?categoryId=${cat.categoryId}"
												class="btn btn-sm btn-danger"> Delete </a>
												<a href="/viewCategory?categoryId=${cat.categoryId}"
												class="btn btn-sm btn-info"> View </a></td>
										</tr>
									</c:forEach>

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