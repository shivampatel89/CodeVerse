<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>

    <!-- Admin CSS -->
    <jsp:include page="AdminCSS.jsp"></jsp:include>

    <style>
        body {
            background: #f4f6f9;
        /*     min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center; */
        }
        .category-card {
        	margin-top:80px;
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            width: 100%;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>

	<!-- Header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>
	
	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	

<div class="content">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-6 col-lg-4">
            <div class="category-card">

                <h3 class="text-center mb-4">Add New Category</h3>

                <form action="/saveCategory" method="post">

                    <div class="mb-3">
                        <label class="form-label">Category Name</label>
                        <input type="text"
                               name="categoryName"
                               class="form-control"
                               placeholder="Enter category name"
                               required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">
                        Save Category
                    </button>

                    <div class="text-center mt-3">
                        <a href="/" class="text-decoration-none">
                            Back to Dashboard
                        </a>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
	
	<!-- Footer -->
	<jsp:include page="AdminFooter.jsp"></jsp:include>
</body>
</html>