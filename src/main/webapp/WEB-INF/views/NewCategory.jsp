<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .category-card {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            width: 100%;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>

<div class="container">
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

</body>
</html>
