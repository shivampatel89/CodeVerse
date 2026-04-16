<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CodeVerse Login</title>
  <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg: #020617;
      --panel: rgba(15, 23, 42, 0.86);
      --panel-border: rgba(255, 255, 255, 0.08);
      --primary: #6366f1;
      --accent: #22d3ee;
    }

    body {
      font-family: 'Outfit', sans-serif;
      background:
        radial-gradient(circle at top left, rgba(99, 102, 241, 0.18), transparent 35%),
        radial-gradient(circle at bottom right, rgba(34, 211, 238, 0.12), transparent 30%),
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
      max-width: 1100px;
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      gap: 24px;
      align-items: stretch;
    }

    .hero-card, .form-card {
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

    .hero-card::after {
      content: "";
      position: absolute;
      inset: auto -40px -40px auto;
      width: 180px;
      height: 180px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(99, 102, 241, 0.35), transparent 70%);
      pointer-events: none;
    }

    .brand {
      font-size: 1rem;
      letter-spacing: 0.16em;
      text-transform: uppercase;
      color: #cbd5e1;
      margin-bottom: 18px;
    }

    .hero-title {
      font-size: clamp(2.2rem, 4vw, 4rem);
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

    .hero-badges {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
      margin-top: 26px;
    }

    .pill {
      padding: 10px 14px;
      border-radius: 999px;
      border: 1px solid rgba(255,255,255,0.08);
      background: rgba(255,255,255,0.04);
      color: #e2e8f0;
      font-size: 0.9rem;
    }

    .form-card {
      padding: 34px;
      display: flex;
      align-items: center;
    }

    .form-inner {
      width: 100%;
    }

    .auth-heading {
      font-size: 1.8rem;
      font-weight: 700;
      margin-bottom: 8px;
    }

    .auth-subtext {
      color: #94a3b8;
      margin-bottom: 28px;
    }

    .form-group {
      margin-bottom: 18px;
    }

    .form-group label {
      color: #cbd5e1;
      margin-bottom: 8px;
      font-size: 0.95rem;
    }

    .form-control {
      background: rgba(255,255,255,0.05) !important;
      border: 1px solid rgba(255,255,255,0.08) !important;
      color: #fff !important;
      border-radius: 14px !important;
      min-height: 48px;
    }

    .form-control:focus {
      box-shadow: none !important;
      border-color: var(--primary) !important;
    }

    .btn-login {
      background: linear-gradient(135deg, var(--primary), #4f46e5);
      border: none;
      border-radius: 14px;
      min-height: 48px;
      font-weight: 700;
      width: 100%;
    }

    .btn-login:hover {
      color: white;
    }

    .auth-links {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
      margin: 18px 0 22px;
      flex-wrap: wrap;
      color: #cbd5e1;
    }

    .auth-links a {
      color: var(--accent);
      text-decoration: none;
      font-weight: 600;
    }

    .signup-link {
      margin-top: 18px;
      color: #cbd5e1;
    }

    .signup-link a {
      color: var(--accent);
      font-weight: 700;
      text-decoration: none;
    }

    .error-box {
      margin-top: 14px;
      color: #fca5a5;
      font-size: 0.95rem;
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
          <div class="brand">CodeVerse</div>
          <div class="hero-title">Welcome back to the <span>hackathon hub</span>.</div>
          <p class="hero-copy">Sign in to manage your hackathons, teams, submissions, and progress from one streamlined, distraction-free workspace.</p>
          <div class="hero-badges">
            <span class="pill">Team management</span>
            <span class="pill">Submissions</span>
            <span class="pill">Live dashboard</span>
          </div>
        </div>
      </div>

      <div class="form-card">
        <div class="form-inner">
          <div class="auth-heading">Login</div>
          <div class="auth-subtext">Use your email and password to continue.</div>

          <form action="/authenticate" method="post">
            <div class="form-group">
              <label>Username or email *</label>
              <input type="text" name="email" class="form-control" required>
            </div>
            <div class="form-group">
              <label>Password *</label>
              <input type="password" name="password" class="form-control" required>
            </div>

            <div class="auth-links">
              <label class="mb-0"><input type="checkbox" class="me-2">Remember me</label>
              <a href="forgetPassword">Forgot password</a>
            </div>

            <button type="submit" class="btn btn-primary btn-login">Login</button>

            <div class="signup-link text-center">
              Don't have an account? <a href="signup">Sign Up</a>
            </div>

            <c:if test="${not empty error}">
              <div class="error-box text-center">${error}</div>
            </c:if>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
  <script src="../../assets/js/off-canvas.js"></script>
  <script src="../../assets/js/hoverable-collapse.js"></script>
  <script src="../../assets/js/misc.js"></script>
  <script src="../../assets/js/settings.js"></script>
  <script src="../../assets/js/todolist.js"></script>
</body>
</html>