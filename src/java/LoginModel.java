import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * Servlet implementation class LoginModel
 */
public class LoginModel extends HttpServlet {

    private JdbcTemplate jdbcTemplate;

    @Override
    public void init() throws ServletException {
        // Obtain the Spring application context and JdbcTemplate bean
        ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        jdbcTemplate = (JdbcTemplate) context.getBean("jdbcTemplate");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            // Get parameters from the request
            String email = request.getParameter("email").trim();
            String password = request.getParameter("password").trim(); // Assuming you are sending password too

            if (!email.isEmpty() && !password.isEmpty()) {

                // Query to check if the user exists (password comparison directly)
                String sql = "SELECT * FROM users WHERE email = ? AND password_hash = ?";
                List<Map<String, Object>> users = jdbcTemplate.queryForList(sql, new Object[]{email, password});

                // Check if a user was found
                if (!users.isEmpty()) {
                    Map<String, Object> user = users.get(0); // Get the first user
                    String role = (String) user.get("role"); // Assuming "role" is a column in your users table

                    session.setAttribute("role", role);
                    session.setAttribute("id", user.get("user_id"));
                   

//                    if ("admin".equals(role)) {
//                        // Redirect to the dashboard for admin
//                        response.sendRedirect("Dashboard");
//                    } else {
//                        // Redirect for non-admin users
//                        response.sendRedirect(role + "_dashboard.htm");
                    //}

                     response.sendRedirect("CaseModel");
                } else {
                    // If no user is found, set the error message
                    String message = "Invalid credentials";
                    session.setAttribute("message", message);
                    response.sendRedirect("login.htm");
                }

            } else {
                // If the email or password is empty, set the error message
                String message = "All fields are required";
                session.setAttribute("message", message);
                response.sendRedirect("login.htm");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login Model Servlet";
    }
}
