
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

@WebServlet("/SupportRequestsModel")
public class SupportRequestsModel extends HttpServlet {
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
                addSupportRequest(request, session);
            } else if ("Update".equals(action)) {
                updateSupportRequest(request, session);
            } else if ("Delete".equals(action)) {
                deleteSupportRequest(request, session);
            }

            // Retrieve and display support requests
            List<Map<String, Object>> supportRequestList = getSupportRequestRecords();
            request.setAttribute("supportRequestRecords", supportRequestList);

            // Forward to the support request management page
            RequestDispatcher dispatcher = request.getRequestDispatcher("support_requests.htm");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error_page.htm");
        }
    }

    // Method to handle adding a support request
    private void addSupportRequest(HttpServletRequest request, HttpSession session) {
        try {
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String dateOfBirth = request.getParameter("date_of_birth");
            String phoneNumber = request.getParameter("phone_number");
            String emailAddress = request.getParameter("email_address");
            String preferredCommunication = request.getParameter("preferred_communication");
            String location = request.getParameter("location");
            String medicalHistory = request.getParameter("medical_history");
            String description = request.getParameter("description");

            String sqlInsert = "INSERT INTO support_requests (first_name, last_name, date_of_birth, phone_number, email_address, " +
                               "preferred_communication, location, medical_history, description) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sqlInsert, firstName, lastName, dateOfBirth, phoneNumber, emailAddress, preferredCommunication,
                                location, medicalHistory, description);
            session.setAttribute("message", "Support request added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding support request: " + e.getMessage());
        }
    }

    // Method to handle updating a support request
    private void updateSupportRequest(HttpServletRequest request, HttpSession session) {
        try {
            int requestId = Integer.parseInt(request.getParameter("request_id"));
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String dateOfBirth = request.getParameter("date_of_birth");
            String phoneNumber = request.getParameter("phone_number");
            String emailAddress = request.getParameter("email_address");
            String preferredCommunication = request.getParameter("preferred_communication");
            String location = request.getParameter("location");
            String medicalHistory = request.getParameter("medical_history");
            String description = request.getParameter("description");

            String sqlUpdate = "UPDATE support_requests SET first_name = ?, last_name = ?, date_of_birth = ?, phone_number = ?, " +
                               "email_address = ?, preferred_communication = ?, location = ?, medical_history = ?, description = ? " +
                               "WHERE id = ?";
            jdbcTemplate.update(sqlUpdate, firstName, lastName, dateOfBirth, phoneNumber, emailAddress, preferredCommunication,
                                location, medicalHistory, description, requestId);
            session.setAttribute("message", "Support request updated successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid request ID. Support request update failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating support request: " + e.getMessage());
        }
    }

    // Method to handle deleting a support request
    private void deleteSupportRequest(HttpServletRequest request, HttpSession session) {
        try {
            int requestId = Integer.parseInt(request.getParameter("request_id"));
            String sqlDelete = "DELETE FROM support_requests WHERE id = ?";
            jdbcTemplate.update(sqlDelete, requestId);
            session.setAttribute("message", "Support request deleted successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid request ID. Support request deletion failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting support request: " + e.getMessage());
        }
    }

    // Method to retrieve all support request records
    private List<Map<String, Object>> getSupportRequestRecords() {
        String sql = "SELECT id, first_name, last_name, email_address, phone_number, preferred_communication,location,medical_history,description, created_at FROM support_requests";
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
        return "Support Request Model Servlet for managing support request records";
    }
}
