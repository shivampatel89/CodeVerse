<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${hackathon.title} | CodeVerse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #6366f1;
            --primary-dark: #4f46e5;
            --dark: #0f172a;
            --darkER: #020617;
            --glass: rgba(255, 255, 255, 0.03);
            --glass-border: rgba(255, 255, 255, 0.1);
        }

        body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--darkER);
            color: #f8fafc;
        }

        .details-header {
            padding: 100px 0 60px;
            background: linear-gradient(180deg, rgba(99, 102, 241, 0.1) 0%, transparent 100%);
        }

        .info-card {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            padding: 30px;
            height: 100%;
        }

        .sticky-sidebar {
            position: sticky;
            top: 100px;
        }

        .hackathon-meta {
            font-size: 1.1rem;
            color: #94a3b8;
        }

        .hackathon-meta i {
            width: 30px;
            color: var(--primary);
        }

        .btn-register {
            background: linear-gradient(45deg, var(--primary), #818cf8);
            color: white;
            border: none;
            padding: 18px;
            border-radius: 16px;
            font-weight: 700;
            font-size: 1.1rem;
            transition: all 0.3s;
            box-shadow: 0 10px 20px rgba(99, 102, 241, 0.3);
        }

        .btn-register:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(99, 102, 241, 0.5);
            color: white;
        }

        .prize-pool-large {
            font-size: 2.5rem;
            font-weight: 800;
            background: linear-gradient(45deg, #10b981, #34d399);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-transparent pt-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/explore">CODE<span class="text-primary">VERSE</span></a>
        <a href="/explore" class="btn btn-outline-light btn-sm rounded-pill px-4"><i class="fas fa-arrow-left me-2"></i>Back to Explore</a>
    </div>
</nav>

<div class="details-header mb-5">
    <div class="container text-center">
        <div class="mb-4">
            <span class="badge bg-primary rounded-pill px-3 py-2">${hackathon.status}</span>
        </div>
        <h1 class="display-4 fw-bold mb-3">${hackathon.title}</h1>
        <p class="lead text-secondary"><i class="fas fa-map-marker-alt me-2 text-primary"></i>${hackathon.location} | <i class="fas fa-laptop-code me-2 text-primary"></i>${hackathon.event_type}</p>
    </div>
</div>

<div class="container pb-5">
    <div class="row g-5">
        <div class="col-lg-8">
            <div class="info-card mb-4">
                <h3 class="fw-bold mb-4">About the Hackathon</h3>
                <p class="text-secondary mb-5" style="line-height: 1.8; white-space: pre-wrap;">${hackathon.description}</p>

                <div class="row g-4 mb-5">
                    <div class="col-md-6 text-center">
                        <div class="p-4 rounded-4" style="background: rgba(16, 185, 129, 0.05); border: 1px solid rgba(16, 185, 129, 0.1);">
                            <p class="mb-1 text-secondary">Total Prize Pool</p>
                            <h2 class="m-0 text-success fw-bold">${hackathon.prizePool}</h2>
                        </div>
                    </div>
                </div>

                <h4 class="fw-bold mb-4">Timeline</h4>
                <div class="ps-3 border-start border-secondary">
                    <div class="mb-4 position-relative">
                        <div class="position-absolute rounded-circle bg-primary" style="width:12px; height:12px; left:-19px; top:8px;"></div>
                        <h6 class="fw-bold m-0">Registration Starts</h6>
                        <p class="text-secondary small">${hackathon.registrationStartDate}</p>
                    </div>
                    <div class="mb-0 position-relative">
                        <div class="position-absolute rounded-circle bg-secondary" style="width:12px; height:12px; left:-19px; top:8px;"></div>
                        <h6 class="fw-bold m-0 text-danger">Registration Ends</h6>
                        <p class="text-secondary small">${hackathon.registrationEndDate}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="sticky-sidebar">
                <div class="info-card">
                    <h4 class="fw-bold mb-4">Registration</h4>
                    <div class="hackathon-meta mb-3">
                        <i class="fas fa-money-bill-wave"></i> Entry Fee: 
                        <span class="text-white fw-bold">
                            <c:choose>
                                <c:when test="${hackathon.fees > 0}">$${hackathon.fees}</c:when>
                                <c:otherwise>FREE</c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                    <div class="hackathon-meta mb-3">
                        <i class="fas fa-user-friends"></i> Team Size: <span class="text-white fw-bold">${hackathon.minTeamSize} - ${hackathon.maxTeamSize} Members</span>
                    </div>
                    <div class="hackathon-meta mb-5">
                        <i class="fas fa-globe"></i> Mode: <span class="text-white fw-bold">${hackathon.event_type}</span>
                    </div>

                    <c:choose>
                        <c:when test="${isRegistered}">
                            <div class="alert alert-success rounded-4 border-0 py-3 mb-0">
                                <i class="fas fa-check-circle me-2"></i> You are registered!
                                <a href="/participantDashboard" class="d-block mt-2 fw-bold text-success text-decoration-none">Go to Dashboard <i class="fas fa-arrow-right ms-1"></i></a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <form action="/registrationForm" method="get">
                                <input type="hidden" name="hackathonId" value="${hackathon.hackathonId}">
                                <button type="submit" class="btn btn-register w-100 mb-3">
                                    Register Now
                                </button>
                            </form>
                            <p class="text-center text-secondary small m-0">Secure checkout via Razorpay</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="py-5 text-center text-secondary border-top border-secondary mt-5">
    <p>&copy; 2026 CodeVerse Platform. All rights reserved.</p>
</footer>

</body>
</html>
