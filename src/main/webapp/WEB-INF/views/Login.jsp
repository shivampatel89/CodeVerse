<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>

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
        .login-card {
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
            <div class="login-card">

                <h3 class="text-center mb-4">Login</h3>

                <form action="/login" method="post">

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email"
                               name="email"
                               class="form-control"
                               placeholder="Enter your email"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password"
                               name="password"
                               class="form-control"
                               placeholder="Enter your password"
                               required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">
                        Login
                    </button>

                    <!-- 🔑 Forgot Password -->
                    <div class="text-center mt-3">
                        <a href="/forgetpassword" class="text-decoration-none">
                            Forgot Password?
                        </a>
                    </div>

                    <!-- 🆕 Signup link -->
                    <div class="text-center mt-2">
                        <span>Don't have an account? </span>
                        <a href="/signup" class="text-decoration-none fw-semibold">
                            Signup
                        </a>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
