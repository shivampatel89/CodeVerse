<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
/* ===== BODY ===== */
body {
    margin: 0;
    background: #f4f6f9;
}

/* ===== HEADER ===== */
.header {
    height: 60px;
    background: #fff;
    padding: 0 20px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/* ☰ MENU BUTTON */
.menu-btn {
    font-size: 28px;
    cursor: pointer;
    display: none;
}

/* ===== SIDEBAR ===== */
.sidebar {
    position: fixed;
    top: 60px;
    left: 0;
    width: 230px;
    height: calc(100vh - 60px);
    background: linear-gradient(180deg, #667eea, #764ba2);
    color: #fff;
    padding: 15px;
    transition: 0.3s;
}

.sidebar .brand {
    font-size: 22px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 20px;
}

.sidebar a {
    display: block;
    padding: 10px;
    color: #fff;
    text-decoration: none;
    border-radius: 6px;
    margin-bottom: 6px;
}

.sidebar a:hover {
    background: rgba(255,255,255,0.2);
}

/* ===== CONTENT ===== */
.content {
    margin-top: 60px;
    margin-left: 230px;
    padding: 25px;
}

/* ===== FOOTER ===== */
.footer {
    margin-left: 230px;
    background:#f4f6f9;
    text-align: center;
    padding: 10px;
    font-size: 14px;
    /* box-shadow: 0 -2px 6px rgba(0,0,0,0.1); */
}

/* ===== MOBILE VIEW ===== */
@media (max-width: 768px) {

    .menu-btn {
        display: block; /* ☰ yahin se dikhega */
    }

    .sidebar {
        transform: translateX(-100%);
    }

    .sidebar.show {
        transform: translateX(0);
    }

    .content,
    .footer {
        margin-left: 0;
    }
}
</style>