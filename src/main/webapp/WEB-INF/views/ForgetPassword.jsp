<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <!-- ✅ Mobile Responsive Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Forgot Password</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px;
        }
        .forgot-card {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-8 col-lg-5">
            <div class="forgot-card">

                <h3 class="text-center mb-3">Forgot Password</h3>
                <p class="text-center text-muted mb-4">
                    Enter your registered email to reset your password
                </p>

                <form action="/forgetpassword" method="post">

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email"
                               name="email"
                               class="form-control"
                               placeholder="Enter your registered email"
                               required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">
                        Send Reset Link
                    </button>

                    <div class="text-center mt-3">
                        <a href="/login" class="text-decoration-none fw-semibold">
                            ← Back to Login
                        </a>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
