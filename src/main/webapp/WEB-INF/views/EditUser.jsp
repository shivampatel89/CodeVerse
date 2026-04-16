<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User | Codverse Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #0f172a;
            color: #fff;
        }
        .edit-card {
            background: #111827;
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 18px;
        }
        .form-control, .form-select {
            background: #0b1220;
            border: 1px solid rgba(255,255,255,0.12);
            color: #fff;
        }
        .form-control:focus, .form-select:focus {
            background: #0b1220;
            color: #fff;
            border-color: #3b82f6;
            box-shadow: none;
        }
        .form-label {
            color: #cbd5e1;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card edit-card p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="mb-0">Edit User</h3>
                    <a href="listUser" class="btn btn-outline-light btn-sm">Back</a>
                </div>

                <form action="updateUser" method="post">
                    <input type="hidden" name="userId" value="${user.userId}">
                    <input type="hidden" name="password" value="${user.password}">
                    <input type="hidden" name="role" value="${user.role}">
                    <input type="hidden" name="createdAt" value="${user.createdAt}">
                    <input type="hidden" name="profilePicURL" value="${user.profilePicURL}">
                    <input type="hidden" name="otp" value="${user.otp}">

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">First Name</label>
                            <input type="text" name="firstName" class="form-control" value="${user.firstName}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Last Name</label>
                            <input type="text" name="lastName" class="form-control" value="${user.lastName}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" value="${user.email}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <input type="text" name="gender" class="form-control" value="${user.gender}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Birth Year</label>
                            <input type="number" name="birthYear" class="form-control" value="${user.birthYear}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Contact No</label>
                            <input type="text" name="contactNum" class="form-control" value="${user.contactNum}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Qualification</label>
                            <input type="text" name="qualification" class="form-control" value="${userDetail.qualification}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Country</label>
                            <input type="text" name="country" class="form-control" value="${userDetail.country}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">State</label>
                            <input type="text" name="state" class="form-control" value="${userDetail.state}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">City</label>
                            <input type="text" name="city" class="form-control" value="${userDetail.city}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Status</label>
                            <select name="active" class="form-select">
                                <option value="true" <c:if test="${user.active}">selected</c:if>>Active</option>
                                <option value="false" <c:if test="${not user.active}">selected</c:if>>Inactive</option>
                            </select>
                        </div>
                    </div>

                    <div class="mt-4 d-flex justify-content-end gap-2">
                        <a href="listUser" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-primary">Update User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>