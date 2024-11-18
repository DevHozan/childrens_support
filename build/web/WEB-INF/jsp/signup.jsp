<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChildGuard Registration</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('${pageContext.request.contextPath}/images/bg.png') no-repeat center center/cover;
        }
        .form-container {
            background: #2c084e;
            padding: 20px 30px;
            border-radius: 10px;
            color: white;
            max-width: 400px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .form-container img {
            max-width: 50px;
            margin-bottom: 10px;
        }
        .form-container h2 {
            margin-bottom: 20px;
            font-size: 1.8rem;
        }
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        label {
            font-size: 0.9rem;
            margin-bottom: 5px;
            display: block;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            margin-top: 5px;
        }
        .form-footer {
            margin-top: 20px;
        }
        .btn {
            padding: 10px 15px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-primary {
            background-color: #5e35b1;
            color: white;
            margin-right: 10px;
        }
        .btn-primary:hover {
            background-color: #45287c;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .footer-links {
            margin-top: 15px;
            font-size: 0.9rem;
        }
        .footer-links a {
            color: #ddd;
            text-decoration: none;
        }
        .footer-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
    <div class="form-container">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="ChildGuard Logo">
        <h2>Sign Up</h2>
        <form action="UsersModel" method="GET">
            <div class="form-group">
                <label for="username"><i class="bi bi-person"></i> Username</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label for="password"><i class="bi bi-lock"></i> Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group">
                <label for="role"><i class="bi bi-person-badge"></i> Role</label>
                <input type="text" class="form-control" name="role" id="role" placeholder="Enter your role" required>
            </div>
            <div class="form-group">
                <label for="email"><i class="bi bi-envelope"></i> Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="phone"><i class="bi bi-telephone"></i> Phone</label>
                <input type="tel" class="form-control" name="phone" id="phone" placeholder="Enter your phone number" required>
            </div>
            <input type="hidden" name="action" value="Add">
            <div class="form-footer">
                <button type="reset" class="btn btn-secondary"><i class="bi bi-arrow-counterclockwise"></i> Reset</button>
                <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Save User</button>
            </div>
        </form>
        <div class="footer-links">
            <a href="login.htm"><i class="bi bi-box-arrow-in-right"></i> Sign in</a>
        </div>
    </div>
</body>
</html>
