<!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: #f4f6f9;
        }
        .header {
            background: #fff;
            padding: 12px 20px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .sidebar {
        	height:100vh;
            min-height: calc(100vh - 120px);
            background: linear-gradient(180deg, #667eea, #764ba2);
            color: #fff;
            /* padding-top: 15px; */
            position:fixed;
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
            padding: 12px 15px;
            display: block;
            /* border-radius: 6px;
            margin-bottom: 5px; */
        }
        .sidebar a:hover {
            background: rgba(255,255,255,0.2);
        }
        .sidebar .brand {
            font-size: 22px;
            font-weight: bold;
            padding: 10px 15px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.3);
            margin-bottom: 15px;
        }
        .content {
        	margin-left:240px;
            padding: 25px;
          /*   min-height: calc(100vh - 120px); */
        }
        .footer {
            background: #fff;
            text-align: center;
            padding: 10px;
            font-size: 14px;
            box-shadow: 0 -2px 6px rgba(0,0,0,0.1);
        }
        @media (max-width: 768px) {
            .sidebar {
                min-height: auto;
            }
        }
    </style>