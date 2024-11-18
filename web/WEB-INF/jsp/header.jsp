<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Portal - ChildGuard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5fa;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

      .sidebar {
    background-color: #6a5acd;
    width: 250px;
    min-height: 100vh; /* Ensures it takes full viewport height */
    position: fixed;
    color: #ffffff;
    padding: 20px;
    transition: transform 0.3s ease, width 0.3s ease;
    z-index: 100;
    overflow-y: auto; /* Enables scrolling when content overflows vertically */
    max-height: 100vh; /* Limits the height to the viewport height */
}


        .sidebar .menu-title {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 2rem;
            text-align: center;
        }

        .sidebar .menu-item {
            font-size: 1rem;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 15px;
            display: block;
            border-radius: 5px;
            margin-bottom: 0.5rem;
            transition: background 0.2s ease;
        }

        .sidebar .menu-item:hover {
            background-color: #483d8b;
        }

        .main-content {
            margin-left: 270px;
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        /* Summary Cards */
        .summary-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        .card {
            color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            flex: 1;
            min-width: 180px;
        }

        .total-cases { background-color: #2ca8ff; }
        .male-cases { background-color: #ff6b6b; }
        .female-cases { background-color: #b794f6; }
        .weekly-cases { background-color: #c0c3c9; }

        /* Table Container */
        .table-container {
            overflow-x: auto;
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            white-space: nowrap;
        }

        table th {
            background-color: #f5f5fa;
            font-weight: 600;
        }

        /* Calendar */
        .calendar {
            float: right;
            width: 25%;
            background-color: #ffffff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
        }

        .calendar h4 {
            font-size: 1.25rem;
            margin-bottom: 10px;
        }

        /* Responsive Styles */
        @media (max-width: 992px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 220px;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 250px;
                transform: translateX(-100%);
                position: fixed;
                z-index: 1000;
                height: 100vh;
            }

            .sidebar.open {
                transform: translateX(0);
            }

            .menu-toggle {
                display: block;
                position: absolute;
                top: 20px;
                left: 20px;
                font-size: 1.5rem;
                cursor: pointer;
                color: #333;
                z-index: 1100;
            }

            .main-content {
                margin-left: 0;
                padding-top: 60px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar with links -->
 <!-- Sidebar with links -->
<div class="sidebar">
    <div class="menu-title">ChildGuard</div>
    <a href="#" class="menu-item"><i class="bi bi-house-door"></i> Dashboard</a>
    <a href="CaseModel" class="menu-item"><i class="bi bi-file-earmark-medical"></i> Cases</a>
    <a href="RiskModel" class="menu-item"><i class="bi bi-shield-lock"></i> Risk</a>
    <a href="AbuseReportModel" class="menu-item"><i class="bi bi-flag"></i> Abuse</a>
    <a href="DocumentModel" class="menu-item"><i class="bi bi-journal-text"></i> Documents</a>
    <a href="collaboration.htm" class="menu-item"><i class="bi bi-people"></i> Collaboration</a>
    <a href="guardian.htm" class="menu-item"><i class="bi bi-person-lock"></i> Guardian</a>
    <a href="emergency.htm" class="menu-item"><i class="bi bi-heart-pulse"></i> Emergency</a>
    <a href="education.htm" class="menu-item"><i class="bi bi-book"></i> Education</a>
    <a href="FosterFamilyModel" class="menu-item"><i class="bi bi-house-heart"></i> Foster</a>
    <a href="advocacy.htm" class="menu-item"><i class="bi bi-volume-up"></i> Advocacy Portal</a>
    <a href="SupportRequestsModel" class="menu-item"><i class="bi bi-telephone-inbound"></i> Telehealth</a>
    <a href="LegalSupportModel" class="menu-item"><i class="bi bi-briefcase"></i> Legal Support</a>
    <a href="LogoutModel" class="menu-item"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>


    <!-- Hamburger Menu Button -->
    <div class="menu-toggle">
        <i class="fas fa-bars"></i>
    </div>
