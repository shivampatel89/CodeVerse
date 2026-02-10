<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Hackathon</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f9;
        }
        .admin-header {
    		background-color: #212529; /* Bootstrap dark / admin black */
    		color: #ffffff;
    		font-weight: 600;
		}
        
        .card {
            border-radius: 10px;
        }
        .form-label {
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="container my-4">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-12">

            <div class="card shadow">
               <div class="card-header admin-header">
    				<h4 class="mb-0">Add Hackathon</h4>
				</div>


                <div class="card-body">
                    <form action="saveHackathon" method="post">

                        <!-- Title -->
                        <div class="mb-3">
                            <label class="form-label">Title</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>

                        <!-- Status & Event Type -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Status</label>
                                <select name="status" class="form-select" required>
                                    <option value="">Select</option>
                                    <option value="Upcoming">Upcoming</option>
                                    <option value="Ongoing">Ongoing</option>
                                    <option value="Completed">Completed</option>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Event Type</label>
                                <select name="event_type" class="form-select" required>
                                    <option value="">Select</option>
                                    <option value="Online">Online</option>
                                    <option value="Offline">Offline</option>
                                    <option value="Hybrid">Hybrid</option>
                                </select>
                            </div>
                        </div>

                        <!-- Payment -->
                        <div class="mb-3">
                            <label class="form-label">Payment</label>
                            <select name="payment" class="form-select" required>
                                <option value="">Select</option>
                                <option value="Free">Free</option>
                                <option value="Paid">Paid</option>
                            </select>
                        </div>

                        <!-- Team Size -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Minimum Team Size</label>
                                <input type="number" name="minTeamSize" class="form-control" min="1" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Maximum Team Size</label>
                                <input type="number" name="maxTeamSize" class="form-control" min="1" required>
                            </div>
                        </div>

                        <!-- Location -->
                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" name="location" class="form-control">
                        </div>

                        <!-- User Type -->
                        <div class="mb-3">
                            <label>User Type</label> <select class="form-control" name="userTypeId" required>
									<option value="">-- Select User Type --</option>
									<c:forEach var="u" items="${allUserType}">
										<option value="${u.userTypeId}">${u.userType}</option>
									</c:forEach>
								</select>
                        </div>

                        <!-- Registration Dates -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Registration Start Date</label>
                                <input type="date" name="registrationStartDate" class="form-control" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Registration End Date</label>
                                <input type="date" name="registrationEndDate" class="form-control" required>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="text-end mt-4">
                            <a href="adminDashboard" class="btn btn-secondary">Cancel</a>
                            <button type="submit" class="btn btn-success">Save Hackathon</button>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
