
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="AdminCSS.jsp"></jsp:include>
    <title>Admin Dashboard</title>
    <style>
      .admin-hero {
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 18px;
        padding: 24px;
        margin-bottom: 22px;
        background: linear-gradient(120deg, rgba(67, 97, 238, 0.2), rgba(58, 12, 163, 0.18));
      }

      .admin-hero h2 {
        margin: 0;
        font-weight: 700;
        color: #ffffff;
      }

      .admin-hero p {
        margin: 6px 0 0;
        color: #cbd5e1;
      }

      .kpi-card {
        border-radius: 16px;
        border: 1px solid rgba(255, 255, 255, 0.08);
        background: linear-gradient(180deg, rgba(17, 24, 39, 0.9), rgba(15, 23, 42, 0.95));
        height: 100%;
      }

      .kpi-card .card-body {
        padding: 20px;
      }

      .kpi-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .kpi-label {
        color: #94a3b8;
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 0.7px;
      }

      .kpi-value {
        margin-top: 8px;
        color: #ffffff;
        font-size: 30px;
        font-weight: 800;
        line-height: 1;
      }

      .kpi-icon {
        width: 40px;
        height: 40px;
        border-radius: 10px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
      }

      .kpi-icon.users { background: linear-gradient(135deg, #0284c7, #0ea5e9); }
      .kpi-icon.completed { background: linear-gradient(135deg, #16a34a, #22c55e); }
      .kpi-icon.active { background: linear-gradient(135deg, #7c3aed, #a855f7); }
      .kpi-icon.upcoming { background: linear-gradient(135deg, #ea580c, #f97316); }

      .kpi-foot {
        margin-top: 10px;
        color: #a5b4fc;
        font-size: 12px;
      }

      .admin-note-card {
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 16px;
        background: rgba(15, 23, 42, 0.85);
      }

      .admin-note-card h5 {
        color: #ffffff;
        margin-bottom: 6px;
      }

      .admin-note-card p {
        color: #cbd5e1;
        margin-bottom: 0;
      }
    </style>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
		<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        <jsp:include page="AdminHeader.jsp"></jsp:include>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="admin-hero">
              <h2>Admin Control Center</h2>
            </div>

            <div class="row">
              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card kpi-card">
                  <div class="card-body">
                    <div class="kpi-top">
                      <div class="kpi-label">Active Users</div>
                      <div class="kpi-icon users"><span class="mdi mdi-account-check"></span></div>
                    </div>
                    <div class="kpi-value">${activeUsersCount}</div>
                    <div class="kpi-foot">Users with active account status</div>
                  </div>
                </div>
              </div>

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card kpi-card">
                  <div class="card-body">
                    <div class="kpi-top">
                      <div class="kpi-label">Completed Hackathons</div>
                      <div class="kpi-icon completed"><span class="mdi mdi-flag-checkered"></span></div>
                    </div>
                    <div class="kpi-value">${completedHackathonsCount}</div>
                    <div class="kpi-foot">Status marked as completed</div>
                  </div>
                </div>
              </div>

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card kpi-card">
                  <div class="card-body">
                    <div class="kpi-top">
                      <div class="kpi-label">Active Hackathons</div>
                      <div class="kpi-icon active"><span class="mdi mdi-rocket"></span></div>
                    </div>
                    <div class="kpi-value">${activeHackathonsCount}</div>
                    <div class="kpi-foot">Currently running competitions</div>
                  </div>
                </div>
              </div>

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card kpi-card">
                  <div class="card-body">
                    <div class="kpi-top">
                      <div class="kpi-label">Upcoming Hackathons</div>
                      <div class="kpi-icon upcoming"><span class="mdi mdi-calendar-clock"></span></div>
                    </div>
                    <div class="kpi-value">${upcomingHackathonsCount}</div>
                    <div class="kpi-foot">Upcoming status or future start date</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card admin-note-card">
                  <div class="card-body">
                    <h5>Total Hackathons: ${totalHackathonsCount}</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <jsp:include page="AdminFooter.jsp"></jsp:include>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
  </body>
</html>