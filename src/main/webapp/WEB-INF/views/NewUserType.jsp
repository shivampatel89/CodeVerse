<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New User Type</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            border-radius: 12px;
            width: 100%;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-6 col-lg-4">
            <div class="card shadow">
                <div class="card-body p-4">

                    <h4 class="text-center mb-4">Add New User Type</h4>

                    <form action="/saveUserType" method="post">

                        <div class="mb-3">
                            <label class="form-label">User Type</label>
                            <input type="text" name ="userType" class="form-control" placeholder="Enter user type" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 mb-2">
                            Save User Type
                        </button>

                        <a href="/adminDashboard" class="btn btn-outline-secondary w-100">
                            Back to Dashboard
                        </a>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>