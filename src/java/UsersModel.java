import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.context.support.WebApplicationContextUtils;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.util.List;
import java.util.Map;

@WebServlet("/UsersModel")
public class UsersModel extends HttpServlet {
    private JdbcTemplate jdbcTemplate;

    @Override
    public void init() throws ServletException {
        // Initialize JdbcTemplate from Spring context
        ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        jdbcTemplate = (JdbcTemplate) context.getBean("jdbcTemplate");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");

            if ("Add".equals(action)) {
                addUser(request, session);
            } else if ("Update".equals(action)) {
                updateUser(request, session);
            } else if ("Delete".equals(action)) {
                deleteUser(request, session);
            }

            // Retrieve and display user records
            List<Map<String, Object>> userList = getUserRecords();
            request.setAttribute("userRecords", userList);

            // Forward to the user management page
            RequestDispatcher dispatcher = request.getRequestDispatcher("users.htm");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error_page.htm");
        }
    }

    // Method to handle adding a user
    private void addUser(HttpServletRequest request, HttpSession session) {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            // Hash password for security purposes (you should implement password hashing)
            String passwordHash = password;  // Replace with real password hashing

            String sqlInsert = "INSERT INTO users (username, password_hash, role, email, phone) VALUES (?, ?, ?, ?, ?)";
            jdbcTemplate.update(sqlInsert, username, passwordHash, role, email, phone);
            session.setAttribute("message", "User added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding user: " + e.getMessage());
        }
    }

    // Method to handle updating a user's details
    private void updateUser(HttpServletRequest request, HttpSession session) {
        try {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            String role = request.getParameter("role");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            String sqlUpdate = "UPDATE users SET role = ?, email = ?, phone = ? WHERE user_id = ?";
            jdbcTemplate.update(sqlUpdate, role, email, phone, userId);
            session.setAttribute("message", "User updated successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid user ID. User update failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating user: " + e.getMessage());
        }
    }

    // Method to handle deleting a user
    private void deleteUser(HttpServletRequest request, HttpSession session) {
        try {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            String sqlDelete = "DELETE FROM users WHERE user_id = ?";
            jdbcTemplate.update(sqlDelete, userId);
            session.setAttribute("message", "User deleted successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid user ID. User deletion failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting user: " + e.getMessage());
        }
    }

    // Method to retrieve all user records
    private List<Map<String, Object>> getUserRecords() {
        String sql = "SELECT user_id, username, role, email, phone, created_at FROM users";
        return jdbcTemplate.queryForList(sql);
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
        return "User Model Servlet for managing user records";
    }
}
