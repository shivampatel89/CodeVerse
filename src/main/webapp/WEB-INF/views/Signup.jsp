<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CodeVerse Signup</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <style>
      :root {
        --bg: #020617;
        --panel: rgba(15, 23, 42, 0.88);
        --panel-border: rgba(255, 255, 255, 0.08);
        --primary: #6366f1;
        --accent: #22d3ee;
      }

      body {
        font-family: "Outfit", sans-serif;
        background:
          radial-gradient(
            circle at top right,
            rgba(99, 102, 241, 0.18),
            transparent 35%
          ),
          radial-gradient(
            circle at bottom left,
            rgba(34, 211, 238, 0.12),
            transparent 30%
          ),
          var(--bg);
        color: #f8fafc;
        min-height: 100vh;
      }

      .auth-shell {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 24px;
      }

      .auth-panel {
        width: 100%;
        max-width: 1200px;
        display: grid;
        grid-template-columns: 0.95fr 1.05fr;
        gap: 24px;
        align-items: stretch;
      }

      .hero-card,
      .form-card {
        background: var(--panel);
        border: 1px solid var(--panel-border);
        border-radius: 24px;
        backdrop-filter: blur(12px);
        box-shadow: 0 24px 60px rgba(0, 0, 0, 0.35);
      }

      .hero-card {
        padding: 44px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        position: relative;
        overflow: hidden;
      }

      .hero-title {
        font-size: clamp(2.2rem, 4vw, 3.8rem);
        font-weight: 800;
        line-height: 1.05;
        margin-bottom: 16px;
      }

      .hero-title span {
        color: var(--primary);
      }

      .hero-copy {
        color: #cbd5e1;
        max-width: 560px;
        line-height: 1.7;
        font-size: 1rem;
      }

      .pill {
        display: inline-block;
        padding: 10px 14px;
        border-radius: 999px;
        border: 1px solid rgba(255, 255, 255, 0.08);
        background: rgba(255, 255, 255, 0.04);
        color: #e2e8f0;
        font-size: 0.9rem;
        margin-right: 10px;
        margin-top: 12px;
      }

      .form-card {
        padding: 30px;
      }

      .form-card h3 {
        margin-bottom: 6px;
        font-weight: 800;
      }

      .form-subtitle {
        color: #94a3b8;
        margin-bottom: 22px;
      }

      .form-control,
      .form-select {
        background: rgba(255, 255, 255, 0.05) !important;
        border: 1px solid rgba(255, 255, 255, 0.08) !important;
        color: #fff !important;
        border-radius: 14px !important;
        min-height: 48px;
      }

      .form-control:focus,
      .form-select:focus {
        box-shadow: none !important;
        border-color: var(--primary) !important;
      }

      .form-label {
        color: #cbd5e1;
        margin-bottom: 8px;
        font-size: 0.95rem;
      }

      .btn-primary {
        background: linear-gradient(135deg, var(--primary), #4f46e5);
        border: none;
        border-radius: 14px;
        min-height: 48px;
        font-weight: 700;
      }

      .btn-primary:hover {
        color: #fff;
      }

      .text-link {
        color: var(--accent);
        text-decoration: none;
        font-weight: 600;
      }

      .error-box {
        color: #fca5a5;
        margin-top: 12px;
        text-align: center;
      }

      .password-toggle {
        border: 1px solid rgba(255, 255, 255, 0.08);
        background: rgba(255, 255, 255, 0.05);
        color: #fff;
        border-radius: 14px;
        padding: 0 14px;
      }

      @media (max-width: 991px) {
        .auth-panel {
          grid-template-columns: 1fr;
        }
        .hero-card {
          padding: 32px;
        }
      }
    </style>
  </head>
  <body>
    <div class="auth-shell">
      <div class="auth-panel">
        <div class="hero-card">
          <div>
            <div class="hero-title">
              Create your <span>CodeVerse</span> account.
            </div>
            <p class="hero-copy">
              Hackathon ke liye register karke teams, submissions aur dashboard
              sab kuch ek hi modern workspace me manage karo.
            </p>
            <div>
              <span class="pill">Participant access</span>
              <span class="pill">Team creation</span>
              <span class="pill">Project submission</span>
            </div>
          </div>
        </div>

        <div class="form-card">
          <h3>Signup</h3>
          <div class="form-subtitle">
            Fill in your details to create a new participant account.
          </div>

          <form action="/register" method="post" enctype="multipart/form-data">
            <div class="row g-3">
              <div class="col-md-6">
                <label class="form-label">First Name</label>
                <input
                  type="text"
                  name="firstName"
                  class="form-control"
                  placeholder="Enter your first name"
                  required
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">Last Name</label>
                <input
                  type="text"
                  name="lastName"
                  class="form-control"
                  placeholder="Enter your last name"
                  required
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">Email</label>
                <input
                  type="email"
                  name="email"
                  class="form-control"
                  placeholder="Enter your email"
                  required
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">Mobile Number</label>
                <input
                  type="tel"
                  name="contactNum"
                  class="form-control"
                  placeholder="Enter 10-digit mobile number"
                  pattern="[0-9]{10}"
                  required
                />
              </div>
              <div class="col-md-12">
                <label class="form-label">Gender</label>
                <div class="d-flex gap-3 flex-wrap">
                  <label class="form-check-label"
                    ><input
                      class="form-check-input me-1"
                      type="radio"
                      name="gender"
                      value="Male"
                      required
                    />
                    Male</label
                  >
                  <label class="form-check-label"
                    ><input
                      class="form-check-input me-1"
                      type="radio"
                      name="gender"
                      value="Female"
                    />
                    Female</label
                  >
                  <label class="form-check-label"
                    ><input
                      class="form-check-input me-1"
                      type="radio"
                      name="gender"
                      value="Other"
                    />
                    Other</label
                  >
                </div>
              </div>
              <div class="col-md-6">
                <label class="form-label">Birth Year</label>
                <input
                  type="number"
                  name="birthYear"
                  class="form-control"
                  placeholder="e.g. 2000"
                  min="1900"
                  max="2025"
                  required
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">Qualification</label>
                <input
                  type="text"
                  name="qualification"
                  class="form-control"
                  placeholder="e.g. MCA, BCA, B.TECH"
                  required
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">City</label>
                <input
                  type="text"
                  name="city"
                  class="form-control"
                  placeholder="Enter your city"
                  required
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">State</label>
                <input
                  type="text"
                  name="state"
                  class="form-control"
                  placeholder="Enter your state"
                  required
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">Country</label>
                <input
                  type="text"
                  name="country"
                  class="form-control"
                  placeholder="Enter your country"
                  required
                />
              </div>
              <div class="col-md-6">
                <label class="form-label">Profile Picture</label>
                <input
                  type="file"
                  name="profilePic"
                  class="form-control"
                  accept="image/*"
                />
              </div>
              <div class="col-12">
                <label class="form-label">Password</label>
                <div class="input-group">
                  <input
                    type="password"
                    id="password"
                    name="password"
                    class="form-control"
                    placeholder="Create a password"
                    required
                  />
                  <button
                    type="button"
                    class="password-toggle"
                    onclick="togglePassword()"
                  >
                    Show
                  </button>
                </div>
              </div>
              <div class="col-12 d-grid mt-2">
                <button type="submit" class="btn btn-primary">
                  Create Account
                </button>
              </div>
            </div>

            <div class="text-center mt-3">
              Already have an account?
              <a href="/login" class="text-link">Login</a>
            </div>
          </form>
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
