<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Solution | CodeVerse</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .submission-card {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            padding: 40px;
            width: 100%;
            max-width: 600px;
            backdrop-filter: blur(10px);
        }

        .form-control, .form-textarea {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            color: white;
            border-radius: 12px;
            padding: 12px 15px;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.08);
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(99, 102, 241, 0.1);
            color: white;
        }

        .btn-submit {
            background: var(--primary);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 12px;
            font-weight: 700;
            width: 100%;
            margin-top: 20px;
            transition: 0.3s;
        }

        .btn-submit:hover {
            background: #4f46e5;
            box-shadow: 0 10px 20px rgba(99, 102, 241, 0.3);
        }
    </style>
</head>
<body>

<div class="submission-card">
    <div class="text-center mb-4">
        <h2 class="fw-bold">Submit Your <span class="text-primary">Solution</span></h2>
        <p class="text-secondary text-center">Tread carefully - you can only submit once!</p>
    </div>

    <form action="/saveSolution" method="post">
        <input type="hidden" name="hackathonId" value="${hackathonId}">
        
        <div class="mb-3">
            <label class="form-label">Project Title</label>
            <input type="text" name="title" class="form-control" placeholder="The name of your masterpiece" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" rows="4" placeholder="Briefly explain what you built and how it works..." required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Submission Link</label>
            <input type="url" name="submissionLink" class="form-control" placeholder="GitHub, Devpost, or Video link" required>
        </div>

        <button type="submit" class="btn btn-submit">Submit Portoflio</button>
        <div class="text-center mt-3">
            <a href="/participantDashboard" class="text-secondary small text-decoration-none"><i class="fas fa-arrow-left me-1"></i>Back to Dashboard</a>
        </div>
    </form>
</div>

</body>
</html>
