<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: #f4f6f9;
        }
        .header {
            background: #fff;
            padding: 12px 20px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .sidebar {
            min-height: calc(100vh - 120px);
            background: linear-gradient(180deg, #667eea, #764ba2);
            color: #fff;
            padding-top: 15px;
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
            padding: 12px 15px;
            display: block;
            border-radius: 6px;
            margin-bottom: 5px;
        }
        .sidebar a:hover {
            background: rgba(255,255,255,0.2);
        }
        .sidebar .brand {
            font-size: 22px;
            font-weight: bold;
            padding: 10px 15px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.3);
            margin-bottom: 15px;
        }
        .content {
            padding: 25px;
            min-height: calc(100vh - 120px);
        }
        .footer {
            background: #fff;
            text-align: center;
            padding: 10px;
            font-size: 14px;
            box-shadow: 0 -2px 6px rgba(0,0,0,0.1);
        }
        @media (max-width: 768px) {
            .sidebar {
                min-height: auto;
            }
        }
    </style>
</head>
<body>

<div class="header d-flex justify-content-between align-items-center">
    <h5 class="mb-0">Admin Dashboard</h5>
    <div><i class="bi bi-person-circle me-2"></i>Admin</div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-12 col-md-3 col-lg-2 sidebar">
            <div class="brand">Admin Panel</div>
            <a href="#"><i class="bi bi-speedometer2 me-2"></i>Dashboard</a>
            <a href="newCategory"><i class="bi bi-tags me-2"></i>Add Category</a>
            <a href="#"><i class="bi bi-people me-2"></i>Users</a>
            <a href="#"><i class="bi bi-clipboard-data me-2"></i>Reports</a>
            <a href="#"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
        </div>
        <div class="col-12 col-md-9 col-lg-10 content">
            <h2>Welcome Admin </h2>
            <p class="text-muted">This is your dashboard overview.</p>
            <div class="row mt-4">
                <div class="col-sm-6 col-lg-3 mb-3">
                    <div class="card shadow-sm"><div class="card-body text-center"><h6>Total Users</h6><h3>120</h3></div></div>
                </div>
                <div class="col-sm-6 col-lg-3 mb-3">
                    <div class="card shadow-sm"><div class="card-body text-center"><h6>Categories</h6><h3>15</h3></div></div>
                </div>
                <div class="col-sm-6 col-lg-3 mb-3">
                    <div class="card shadow-sm"><div class="card-body text-center"><h6>Active Users</h6><h3>98</h3></div></div>
                </div>
                <div class="col-sm-6 col-lg-3 mb-3">
                    <div class="card shadow-sm"><div class="card-body text-center"><h6>Reports</h6><h3>7</h3></div></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer"> 2026 Grownited | Admin Panel</div>

</body>
</html>
