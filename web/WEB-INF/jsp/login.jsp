<%@include file="header.jsp" %>

<div class="main-content">
        <!-- Welcome Section -->
        <div class="container mt-5">
            <div class="jumbotron ">
                <fieldset class="col-lg-4 m-2">
                    <legend class="text-primary">Login Form</legend>
                    <form action="LoginModel" method="POST">
                        <input type="email" name="email" class="form-control" placeholder="Type your email" required> <br>
                        <input type="password" name="password" class="form-control" placeholder="Type your password" required> <br>
                        <input type="submit" name="login" class="btn btn-primary" value="Login">
                    </form>
                    <p class="text-danger">
                                <% 
               if (session.getAttribute("message") != null) {  // Check if the "message" attribute exists
                   out.print(session.getAttribute("message"));  // Print the message
                   session.removeAttribute("message");  // Remove the message after displaying it
               }
           %>

                    </p>
                </fieldset>
            </div>
        </div>
</div>

    <%@include file="footer.jsp" %>