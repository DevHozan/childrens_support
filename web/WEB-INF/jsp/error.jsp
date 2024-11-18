<%-- 
    Document   : error.jsp
    Created on : Nov 14, 2024, 10:31:32 PM
    Author     : Hozana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
                 <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("id") == null) {
        // Redirect to the login page if not logged in
        response.sendRedirect("login.htm");
        return; // Stop further processing of the current page
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8d7da;
                color: #721c24;
            }
            .error-container {
                text-align: center;
                padding: 20px;
                border: 1px solid #f5c6cb;
                background-color: #f8d7da;
                border-radius: 5px;
                max-width: 500px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .error-container h1 {
                font-size: 24px;
                margin-bottom: 10px;
            }
            .error-container p {
                font-size: 18px;
                margin-top: 0;
            }
        </style>
    </head>
    <body>
        <div class="error-container">
            <h1>An Error Occurred</h1>
            <%
             
                String errorMessage = (session != null) ? (String) session.getAttribute("message") : null;

                if (errorMessage != null) {
            %>
                <p><%= errorMessage %></p>
                <%
                    session.removeAttribute("message"); // Clear the error message after displaying it
                %>
            <% } else { %>
                <p>Unknown error. Please try again or contact support.</p>
            <% } %>
        </div>
    </body>
</html>
