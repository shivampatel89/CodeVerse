<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <!-- Mobile responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Signup</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px;
        }

        .signup-card {
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
            <div class="signup-card">

                <h3 class="text-center mb-4">Signup</h3>

                <!-- multipart for file upload -->
                <form action="/register" method="post" >

                    <div class="mb-3">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstName"
                               class="form-control"
                               placeholder="Enter your first name" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastName"
                               class="form-control"
                               placeholder="Enter your last name" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email"
                               class="form-control"
                               placeholder="Enter your email" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mobile Number</label>
                        <input type="tel" name="contactNum"
                               class="form-control"
                               placeholder="Enter 10-digit mobile number"
                               pattern="[0-9]{10}" required>
                    </div>

                    <!-- Gender -->
                    <div class="mb-3">
                        <label class="form-label">Gender</label>
                        <div class="d-flex gap-3">
                            <div class="form-check">
                                <input class="form-check-input"
                                       type="radio"
                                       name="gender"
                                       value="Male" required>
                                <label class="form-check-label">Male</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input"
                                       type="radio"
                                       name="gender"
                                       value="Female">
                                <label class="form-check-label">Female</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input"
                                       type="radio"
                                       name="gender"
                                       value="Other">
                                <label class="form-check-label">Other</label>
                            </div>
                        </div>
                    </div>

                    <!-- Birth Year -->
                    <div class="mb-3">
                        <label class="form-label">Birth Year</label>
                        <input type="number" name="birthYear"
                               class="form-control"
                               placeholder="e.g. 2000"
                               min="1900" max="2025" required>
                    </div>
                    
                    <!-- Qualification -->
                    <div class="mb-3">
                        <label class="form-label">Qualification</label>
                        <input type="text" name="qualification"
                               class="form-control"
                               placeholder="e.g. MCA,BCA,B.TECH"
                               required>
                    </div>
                    
                    <!-- City-->
                    <div class="mb-3">
                        <label class="form-label">Cityr</label>
                        <input type="text" name="city"
                               class="form-control"
                               placeholder="Enter your city"
                                required>
                    </div>
                    
                     <!-- State-->
                    <div class="mb-3">
                        <label class="form-label">State</label>
                        <input type="text" name="state"
                               class="form-control"
                               placeholder="Enter your state"
                                required>
                    </div>
                    
                     <!-- Country-->
                    <div class="mb-3">
                        <label class="form-label">Country</label>
                        <input type="text" name="country"
                               class="form-control"
                               placeholder="Enter your country"
                                required>
                    </div>

                    <!-- Profile Picture -->
                    <div class="mb-3">
                        <label class="form-label">Profile Picture</label>
                        <input type="file" name="profilePic"
                               class="form-control"
                               accept="image/*"> 
                     </div> 

                    <!-- Password -->
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <div class="input-group">
                            <input type="password" id="password"
                                   name="password"
                                   class="form-control"
                                   placeholder="Create a password" required>
                            <button type="button"
                                    class="btn btn-outline-secondary"
                                    onclick="togglePassword()">👁️</button>
                        </div>
                    </div>

                    <button type="submit"
                            class="btn btn-primary w-100">
                        Create Account
                    </button>

                    <div class="text-center mt-3">
                        <span>Already have an account?</span>
                        <a href="/login"
                           class="text-decoration-none fw-semibold">
                            Login
                        </a>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

<script>
    function togglePassword() {
        const pwd = document.getElementById("password");
        pwd.type = pwd.type === "password" ? "text" : "password";
    }
</script>

</body>
</html>
