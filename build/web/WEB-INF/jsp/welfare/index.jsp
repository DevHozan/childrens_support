<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ChildGuard - Comprehensive Child Welfare Support System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ECVNHBrNpvOmQBjAvKTBoC+GLgoFtcA/rwYqsUjOvl+v3kF3HiyN8G52FRVGVK6T" crossorigin="anonymous">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
            background-color: #f4f7fc;
            color: #333;
        }
        .welcome {
            background-color: #2a3d66;
            color: #fff;
            text-align: center;
            padding: 80px 0;
            position: relative;
        }
        header h1 {
            font-size: 3rem;
            margin-bottom: 0.5rem;
        }
        header p {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        .cta-button {
            background-color: #354a7f;
            color: #fff;
            padding: 12px 24px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .cta-button:hover {
            background-color: #475d88;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #354a7f;
            position: absolute;
            width: 100%;
            top: 0;
            z-index: 100;
        }
        nav a {
            padding: 1rem;
            color: #fff;
            text-decoration: none;
            text-transform: uppercase;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        nav a:hover {
            background-color: #475d88;
        }
        .menu-toggle {
            display: none;
            font-size: 30px;
            color: #fff;
            padding: 15px;
            cursor: pointer;
            background: none;
            border: none;
        }
        .container {
            width: 90%;
            margin: 120px auto 20px;
        }
        .section {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .section h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #2a3d66;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2a3d66;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }
        .button:hover {
            background-color: #354a7f;
        }
        footer {
            text-align: center;
            padding: 1rem;
            background-color: #2a3d66;
            color: #fff;
        }
        .image-gallery img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            object-fit: cover;
        }
        .row {
            display: flex;
            align-items: center;
        }
        .col-content {
            flex: 1;
            padding: 15px;
        }
        .col-image {
            flex: 1;
            padding: 15px;
            text-align: center;
        }
        .col-image img {
            max-width: 100%;
            border-radius: 8px;
        }
        
        
        @media (max-width: 768px) {
            .row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body class="bg-dark">
  

     <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">ChildWelfare</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#case-management">Case Management</a></li>
                    <li class="nav-item"><a class="nav-link" href="#risk-assessment">Risk Assessment</a></li>
                    <li class="nav-item"><a class="nav-link" href="#reporting">Child Abuse Reporting</a></li>
                    <li class="nav-item"><a class="nav-link" href="#collaboration">Multi-Agency Collaboration</a></li>
                    <li class="nav-item"><a class="nav-link" href="#support">Guardian & Caregiver Support</a></li>
                    <li class="nav-item"><a class="nav-link" href="#analytics">Child Welfare Analytics</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
 <section class="welcome">
    <h1>Welcome to ChildGuard</h1>
    <p>Comprehensive Child Welfare Support System</p>
    <a href="login.htm" class="cta-button">Get Started</a>
</section>

<style>
    /* General Styles */
    .welcome {
        text-align: center;
        padding: 60px;
        background-color: #1a2a3a; /* Deep blue background */
        border-radius: 15px;
        box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.1);
        color: #f1f1f1; /* Soft white text */
        transform: translateY(50px);
        animation: slideIn 2s ease-in-out infinite alternate, backgroundColorChange 4s infinite alternate;
    }

    h1 {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        font-size: 3rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        opacity: 0;
        animation: fadeIn 2s ease-in 0.5s forwards, colorChange 4s infinite alternate;
    }

    p {
        font-family: 'Arial', sans-serif;
        font-size: 1.4rem;
        opacity: 0;
        animation: fadeIn 2s ease-in 1s forwards, slideTextUp 4s infinite alternate;
    }

    .cta-button {
        display: inline-block;
        padding: 15px 30px;
        font-size: 1.4rem;
        background-color: #f1f1f1; /* Soft white button background */
        color: #1a2a3a; /* Deep blue text */
        text-decoration: none;
        border-radius: 50px;
        margin-top: 30px;
        opacity: 0;
        transform: translateY(30px);
        animation: fadeInUp 1.5s ease-out 1.5s forwards, pulseButton 4s infinite alternate;
        transition: background-color 0.3s ease;
    }

    /* Animation Keyframes */
    @keyframes fadeIn {
        0% { opacity: 0; }
        100% { opacity: 1; }
    }

    @keyframes fadeInUp {
        0% { opacity: 0; transform: translateY(30px); }
        100% { opacity: 1; transform: translateY(0); }
    }

    @keyframes slideIn {
        0% { transform: translateY(50px); }
        100% { transform: translateY(0); }
    }

    @keyframes slideTextUp {
        0% { transform: translateY(10px); opacity: 0; }
        100% { transform: translateY(0); opacity: 1; }
    }

    @keyframes backgroundColorChange {
        0% { background-color: #1a2a3a; color: #f1f1f1; } /* Deep blue background, soft white text */
        100% { background-color: #004b69; color: #f1f1f1; } /* Darker blue background */
    }

    @keyframes colorChange {
        0% { color: #f1f1f1; }
        100% { color: #f1f1f1; }
    }

    @keyframes pulseButton {
        0% { transform: scale(1); }
        50% { transform: scale(1.05); }
        100% { transform: scale(1); }
    }

    /* Hover Effect */
    .cta-button:hover {
        background-color: #004b69;
        color: #f1f1f1;
    }
</style>


    <div class="container"><section class="section" id="case-management">
    <div class="row">
        <div class="col-content">
            <h2>Comprehensive Case Management</h2>
            <p>The system offers a centralized platform to securely manage and monitor child welfare cases. It enables real-time updates on protection cases, interventions, and outcomes, ensuring timely and effective care.</p>
            <a href="#" class="button">Explore More</a>
        </div>
        <div class="col-image">
            <img src="${pageContext.request.contextPath}/images/case_management.avif" alt="Case Management">
        </div>
    </div>
</section>

<section class="section" id="risk-assessment">
    <div class="row">
        <div class="col-content">
            <h2>Advanced Risk Assessment</h2>
            <p>The system features tools to evaluate risks to children across various environments, including homes, schools, and communities. It uses standardized procedures for reliable assessments.</p>
            <a href="login.htm" class="button">Get Started</a>
        </div>
        <div class="col-image">
            <img src="${pageContext.request.contextPath}/images/risk.avif" alt="Risk Assessment">
        </div>
    </div>
</section>

<section class="section" id="reporting">
    <div class="row">
        <div class="col-content">
            <h2>Secure Child Abuse Reporting</h2>
            <p>The platform provides a secure and confidential channel for reporting incidents of child abuse or neglect. It supports anonymous submissions to ensure user privacy and safety.</p>
            <a href="login.htm" class="button">Report Now</a>
        </div>
        <div class="col-image">
            <img src="${pageContext.request.contextPath}/images/abuse.avif" alt="Child Abuse Reporting">
        </div>
    </div>
</section>

<section class="section" id="collaboration">
    <div class="row">
        <div class="col-content">
            <h2>Integrated Multi-Agency Collaboration</h2>
            <p>The system facilitates seamless communication and collaboration among child welfare agencies, healthcare professionals, and law enforcement, ensuring coordinated and effective interventions.</p>
            <a href="login.htm" class="button">Learn More</a>
        </div>
        <div class="col-image">
            <img src="${pageContext.request.contextPath}/images/collaboration.jpeg" alt="Multi-Agency Collaboration">
        </div>
    </div>
</section>

<section class="section" id="support">
    <div class="row">
        <div class="col-content">
            <h2>Comprehensive Guardian Support</h2>
            <p>The system provides an array of resources, training modules, and support tools for guardians and caregivers to enhance their ability to care for vulnerable children.</p>
            <a href="login.htm" class="button">Get Support</a>
        </div>
        <div class="col-image">
            <img src="${pageContext.request.contextPath}/images/guardian.png" alt="Guardian Support">
        </div>
    </div>
</section>


        <section class="section" id="analytics">
            <div class="row">
                <div class="col-content">
                    <h2>Child Welfare Analytics</h2>
                    <p>Use advanced analytics to track trends, identify high-risk cases, and predict future child welfare needs based on historical data.</p>
                                    <a href="login.htm" class="button">Get Started</a>
                </div>
                <div class="col-image">
                    <img src="${pageContext.request.contextPath}/images/analytics.webp" alt="Child Welfare Analytics">
                </div>
            </div>
        </section>

  <section class="section bg-dark text-light py-5">
    <div class="container">
        <h2 class="text-center mb-5">Gallery of African Children Benefiting from ChildGuard</h2>
        <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner text-center">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/images/bg.png" class="d-block mx-auto img-fluid rounded shadow-lg" alt="Child Image 1" style="max-height: 400px;">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/images/image_5.jpg" class="d-block mx-auto img-fluid rounded shadow-lg" alt="Child Image 2" style="max-height: 400px;">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/images/cause-6.jpg" class="d-block mx-auto img-fluid rounded shadow-lg" alt="Child Image 3" style="max-height: 400px;">
                </div>
            </div>
            <!-- Controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</section>


        
        <footer>
            <p>&copy; 2025 ChildGuard. All Rights Reserved.</p>
        </footer>
    </div>

    <script>
        const menuToggle = document.getElementById('menu-toggle');
        const nav = document.getElementById('navbar');

        menuToggle.addEventListener('click', function() {
            nav.classList.toggle('active');
        });
    </script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6ql65hf1CFh/TyJo6N9TvZV2z0IGlw2ZVV4pqd8ucnEy9aO8i4C" crossorigin="anonymous"></script>
</body>
</html>