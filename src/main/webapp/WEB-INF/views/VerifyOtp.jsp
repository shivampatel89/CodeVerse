<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CodeVerse | Verify OTP</title>
  <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <style>
    :root { --bg:#020617; --panel:rgba(15,23,42,.86); --panel-border:rgba(255,255,255,.08); --primary:#6366f1; --accent:#22d3ee; }
    body { font-family:'Outfit',sans-serif; background: radial-gradient(circle at top left, rgba(99,102,241,.18), transparent 35%), radial-gradient(circle at bottom right, rgba(34,211,238,.12), transparent 30%), var(--bg); color:#f8fafc; min-height:100vh; }
    .auth-shell { min-height:100vh; display:flex; align-items:center; justify-content:center; padding:24px; }
    .auth-panel { width:100%; max-width:1100px; display:grid; grid-template-columns:1fr .95fr; gap:24px; }
    .hero-card,.form-card { background:var(--panel); border:1px solid var(--panel-border); border-radius:24px; backdrop-filter:blur(12px); box-shadow:0 24px 60px rgba(0,0,0,.35); }
    .hero-card { padding:44px; display:flex; flex-direction:column; justify-content:space-between; }
    .hero-title { font-size:clamp(2rem,4vw,3.6rem); font-weight:800; line-height:1.05; margin-bottom:16px; }
    .hero-title span { color:var(--primary); }
    .hero-copy { color:#cbd5e1; line-height:1.7; max-width:560px; }
    .pill { display:inline-block; padding:10px 14px; border-radius:999px; border:1px solid rgba(255,255,255,.08); background:rgba(255,255,255,.04); color:#e2e8f0; font-size:.9rem; margin-right:10px; margin-top:12px; }
    .form-card { padding:32px; display:flex; align-items:center; }
    .form-control { background:rgba(255,255,255,.05)!important; border:1px solid rgba(255,255,255,.08)!important; color:#fff!important; border-radius:14px!important; min-height:48px; }
    .form-control:focus { box-shadow:none!important; border-color:var(--primary)!important; }
    .form-label { color:#cbd5e1; margin-bottom:8px; }
    .btn-primary { background:linear-gradient(135deg, var(--primary), #4f46e5); border:none; border-radius:14px; min-height:48px; font-weight:700; }
    .btn-primary:hover { color:#fff; }
    .text-link { color:var(--accent); text-decoration:none; font-weight:600; }
    .error-box { color:#fca5a5; margin-top:12px; text-align:center; }
    @media (max-width: 991px) { .auth-panel { grid-template-columns:1fr; } .hero-card { padding:32px; } }
  </style>
</head>
<body>
  <div class="auth-shell">
    <div class="auth-panel">
      <div class="hero-card">
        <div>
          <div class="hero-title">Verify your <span>OTP</span>.</div>
          <p class="hero-copy">Aapke registered email par bheja gaya OTP enter karke next step par jao.</p>
          <div>
            <span class="pill">Secure code</span>
            <span class="pill">Fast verification</span>
            <span class="pill">Reset access</span>
          </div>
        </div>
      </div>
      <div class="form-card">
        <div class="w-100">
          <h3 class="mb-2 fw-bold">Verify OTP</h3>
          <p class="mb-4 text-secondary">Enter the one-time code sent to your email.</p>
          <form action="/verifyOtp" method="post">
            <input type="hidden" name="email" value="${email}">
            <div class="mb-3">
              <label class="form-label">Enter OTP</label>
              <input type="text" name="otp" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Verify</button>
            <div class="text-center mt-3"><a href="/forgetPassword" class="text-link">← Back</a></div>
          </form>
          <c:if test="${not empty error}"><div class="error-box">${error}</div></c:if>
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