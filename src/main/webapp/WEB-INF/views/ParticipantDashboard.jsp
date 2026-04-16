<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Dashboard | CodeVerse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #6366f1;
            --darkER: #020617;
            --glass: rgba(255, 255, 255, 0.03);
            --glass-border: rgba(255, 255, 255, 0.1);
        }

        body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--darkER);
            color: #f8fafc;
        }

        .dashboard-header {
            padding: 60px 0;
            background: linear-gradient(90deg, rgba(99, 102, 241, 0.1), transparent);
        }

        .stat-card {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            padding: 25px;
            text-align: center;
        }

        .info-card {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            color: #f8fafc;
        }

        .info-card h4 {
            color: var(--primary) !important;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .table-glass {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            overflow: hidden;
            color: #f8fafc;
        }

        .table-glass th {
            border-bottom: 1px solid var(--glass-border);
            padding: 15px;
            background: rgba(255, 255, 255, 0.05);
            color: #f8fafc !important; /* Ensure visibility */
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }

        .table-glass td {
            padding: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .btn-glass {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            color: white;
            padding: 8px 15px;
            border-radius: 10px;
            font-size: 0.9rem;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-glass:hover {
            background: var(--primary);
            color: white;
        }

        .modal-content {
            background: #1e293b;
            color: white;
            border: 1px solid var(--glass-border);
            border-radius: 20px;
        }

        .team-meta-label {
            color: #93c5fd;
            font-weight: 600;
        }

        .team-meta-value {
            color: #facc15;
            font-weight: 700;
        }

        .team-member-name {
            color: #67e8f9;
            font-weight: 600;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-transparent pt-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/explore">CODE<span class="text-primary">VERSE</span></a>
        <div class="ms-auto d-flex align-items-center">
            <span class="me-3 d-none d-md-block">Hello, ${sessionScope.user.firstName}</span>
            <a href="/logout" class="btn btn-outline-danger btn-sm rounded-pill px-4">Logout</a>
        </div>
    </div>
</nav>

<div class="dashboard-header">
    <div class="container">
        <h1 class="fw-bold">Participant <span class="text-primary">Dashboard</span></h1>
        <p class="text-secondary">Manage your registrations, teams, and submissions.</p>
    </div>
</div>

<div class="container py-5">
    <div class="row g-4 mb-5">
        <div class="col-md-4">
            <div class="stat-card">
                <i class="fas fa-trophy mb-3 text-primary fa-2x"></i>
                <h5 class="text-secondary">Active Hackathons</h5>
                <h2 class="fw-bold">${totalHackathons}</h2>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <i class="fas fa-user-check mb-3 text-success fa-2x"></i>
                <h5 class="text-secondary">My Registrations</h5>
                <h2 class="fw-bold">${myRegistrationsCount}</h2>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <i class="fas fa-paper-plane mb-3 text-info fa-2x"></i>
                <h5 class="text-secondary">Submissions</h5>
                <h2 class="fw-bold">${mySubmissionsCount}</h2>
            </div>
        </div>
    </div>

    <!-- Alert for Messages -->
    <c:if test="${not empty param.msg}">
        <div class="alert alert-success bg-success text-white border-0 rounded-4 mb-4">
            <i class="fas fa-check-circle me-2"></i> ${param.msg}
            <c:if test="${not empty param.inviteCode}">
                Your Invite Code: <strong>${param.inviteCode}</strong>
            </c:if>
        </div>
    </c:if>

    <div class="row">
        <div class="col-12">
            <div class="info-card p-0 overflow-hidden">
                <div class="p-4 d-flex justify-content-between align-items-center">
                    <h4 class="fw-bold m-0">My Hackathons</h4>
                    <a href="/explore" class="btn btn-primary rounded-pill px-4 btn-sm">Join More</a>
                </div>
                <!-- This table would be populated dynamically in a real app -->
                <div class="table-responsive">
                    <table class="table table-glass m-0">
                        <thead>
                            <tr>
                                <th>Hackathon</th>
                                <th>Status</th>
                                <th>Problem Statement</th>
                                <th>PPT Solution</th>
                                <th>Payment</th>
                                <th>Team</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="reg" items="${userRegistrations}">
                                <tr>
                                    <td>
                                        <div class="fw-bold">${hackathonMap[reg.hackathonId].title}</div>
                                        <div class="small text-secondary">Registered on ${reg.registrationDate}</div>
                                    </td>
                                    <td>
                                        <span class="badge bg-info text-dark">${hackathonMap[reg.hackathonId].status}</span>
                                    </td>
                                    <td>
                                        <span class="text-secondary small">${reg.problemStatement}</span>
                                    </td>
                                    <td>
                                        <a href="${reg.pptLink}" target="_blank" class="btn btn-glass btn-sm"><i class="fas fa-external-link-alt me-1"></i>View PPT</a>
                                    </td>
                                    <td><span class="badge ${reg.paymentStatus == 'Success' ? 'bg-success' : 'bg-warning'}">${reg.paymentStatus}</span></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty reg.teamId}">
                                                <div class="fw-bold text-info">${teamMap[reg.teamId.toString()].teamName}</div>
                                                <div class="small"><span class="team-meta-label">Code:</span> <span class="team-meta-value">${teamMap[reg.teamId.toString()].inviteCode}</span></div>
                                                <c:if test="${not empty teamMembersMap[reg.teamId.toString()]}">
                                                    <div class="small mt-2">
                                                        <span class="team-meta-label">Joined Members:</span>
                                                        <c:forEach var="member" items="${teamMembersMap[reg.teamId.toString()]}" varStatus="st">
                                                            <span class="team-member-name">
                                                                ${member.firstName} ${member.lastName}
                                                                <c:if test="${not st.last}">, </c:if>
                                                            </span>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-secondary small">Individual</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${submittedMap[reg.hackathonId.toString()]}">
                                                <span class="badge bg-success"><i class="fas fa-check me-1"></i>Already Submitted</span>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/submitSolution?hackathonId=${reg.hackathonId}" class="btn btn-glass btn-sm text-info"><i class="fas fa-upload me-1"></i>Submit</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty userRegistrations}">
                                <tr>
                                    <td colspan="7" class="text-center text-secondary py-5">
                                        <p>Browse the <a href="/explore">Explore Page</a> to find and join hackathons!</p>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Team Modal -->
<div class="modal fade" id="teamModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-secondary">
                <h5 class="modal-title">Team Management</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-4">
                <ul class="nav nav-pills mb-4 justify-content-center" id="teamTabs">
                    <li class="nav-item">
                        <button class="nav-link active rounded-pill px-4" data-bs-toggle="pill" data-bs-target="#createTeam">Create Team</button>
                    </li>
                    <li class="nav-item ms-2">
                        <button class="nav-link rounded-pill px-4" data-bs-toggle="pill" data-bs-target="#joinTeam">Join Team</button>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="createTeam">
                        <form action="/createTeam" method="post">
                            <input type="hidden" name="hackathonId" value="1"> <!-- Dynamic ID -->
                            <div class="mb-3">
                                <label class="form-label">Team Name</label>
                                <input type="text" name="teamName" class="form-control bg-dark text-white border-secondary" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 rounded-3">Create Team</button>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="joinTeam">
                        <form action="/joinTeam" method="post">
                            <div class="mb-3">
                                <label class="form-label">Invite Code</label>
                                <input type="text" name="inviteCode" class="form-control bg-dark text-white border-secondary" placeholder="XXXX-XXXX" required>
                            </div>
                            <button type="submit" class="btn btn-outline-info w-100 rounded-3">Join Team</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="py-5 text-center text-secondary border-top border-secondary mt-5">
    <p>&copy; 2026 CodeVerse Platform. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
