<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ChildGuard</title>
    <!-- FontAwesome for additional icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Optional: Bootstrap Icons for modern icon use -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <style>
        /* General Styles */
        body {
           // background: url('${pageContext.request.contextPath}/images/bg.png') no-repeat center center fixed; /* Replace with your background image path */
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            margin-top: -7%;
        }

        .login-card {
            background-color: #4b0082;
            color: #fff;
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-control {
            background: #fff;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #00aaff;
            border: none;
            border-radius: 5px;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0088cc;
        }

        .login-card a {
            color: #00aaff;
            text-decoration: none;
        }

        .login-card a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: #ff6b6b;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>

<body class="bg-dark">
    <div class="text-center">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="ChildGuard Logo" />
    </div>
    <div class="login-container">
        <div class="login-card">
            <h2>Sign in <i class="bi bi-person-circle"></i></h2>
            <form action="LoginModel" method="POST">
                <div class="form-group">
                    <label for="email"><i class="bi bi-envelope-fill"></i> Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="example.email@gmail.com" required>
                </div>
                <div class="form-group mt-3">
                    <label for="password"><i class="bi bi-lock-fill"></i> Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Enter at least 8+ characters" required>
                </div>
                <div class="form-check mt-3">
                    <input type="checkbox" name="remember" id="rememberMe" class="form-check-input">
                    <label for="rememberMe" class="form-check-label">Remember me</label>
                </div>
                <button type="submit" name="login" class="btn btn-primary mt-4">
                    <i class="bi bi-box-arrow-in-right"></i> Sign in
                </button>
                <div class="mt-3 text-center">
                    <p class="mt-2">New to ChildGuard? <a href="signup.htm">Signup now</a></p>
                </div>
                <div class="error-message">
                    <% 
                        if (session.getAttribute("message") != null) {  
                            out.print(session.getAttribute("message"));
                            session.removeAttribute("message");
                        }
                    %>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
