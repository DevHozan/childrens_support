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

@WebServlet("/ChildrenModel")
public class ChildModel extends HttpServlet {
    private JdbcTemplate jdbcTemplate;

    // Initializes the JdbcTemplate from the Spring application context
    @Override
    public void init() throws ServletException {
        ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        jdbcTemplate = (JdbcTemplate) context.getBean("jdbcTemplate");
    }

    // Processes requests from both GET and POST methods
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");

            // Based on the action parameter, call the respective method
            if ("Add".equals(action)) {
                addChild(request, session);
            } else if ("Update".equals(action)) {
                updateChild(request, session);
            } else if ("Delete".equals(action)) {
                deleteChild(request, session);
            }

            // Retrieve and display child records
            List<Map<String, Object>> childList = getChildRecords();
            request.setAttribute("childRecords", childList);

            // Forward to the children management page (children.htm)
            RequestDispatcher dispatcher = request.getRequestDispatcher("children.htm");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error_page.jsp");
        }
    }

    // Method to handle adding a child
    private void addChild(HttpServletRequest request, HttpSession session) {
        try {
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String dateOfBirth = request.getParameter("date_of_birth");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String riskLevel = request.getParameter("risk_level");
            String status = request.getParameter("status");

            // Basic validation to ensure all fields are filled
            if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty() ||
                dateOfBirth == null || dateOfBirth.isEmpty() || gender == null || gender.isEmpty() ||
                riskLevel == null || riskLevel.isEmpty() || status == null || status.isEmpty()) {
                session.setAttribute("message", "All fields must be filled out.");
                return;
            }

            // Insert the new child record into the database
            String sqlInsert = "INSERT INTO children (first_name, last_name, date_of_birth, gender, address, risk_level, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sqlInsert, firstName, lastName, dateOfBirth, gender, address, riskLevel, status);
            session.setAttribute("message", "Child added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding child: " + e.getMessage());
        }
    }

    // Method to handle updating a child's details
    private void updateChild(HttpServletRequest request, HttpSession session) {
        try {
            int childId = Integer.parseInt(request.getParameter("child_id"));
            String address = request.getParameter("address");
            String riskLevel = request.getParameter("risk_level");
            String status = request.getParameter("status");

            // Validate required fields
            if (address == null || address.isEmpty() || riskLevel == null || riskLevel.isEmpty() || status == null || status.isEmpty()) {
                session.setAttribute("message", "All fields must be filled out for update.");
                return;
            }

            // Update the child's details in the database
            String sqlUpdate = "UPDATE children SET address = ?, risk_level = ?, status = ? WHERE child_id = ?";
            jdbcTemplate.update(sqlUpdate, address, riskLevel, status, childId);
            session.setAttribute("message", "Child updated successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid child ID. Update failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating child: " + e.getMessage());
        }
    }

    // Method to handle deleting a child
    private void deleteChild(HttpServletRequest request, HttpSession session) {
        try {
            int childId = Integer.parseInt(request.getParameter("child_id"));
            String sqlDelete = "DELETE FROM children WHERE child_id = ?";
            jdbcTemplate.update(sqlDelete, childId);
            session.setAttribute("message", "Child deleted successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid child ID. Deletion failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting child: " + e.getMessage());
        }
    }

    // Method to retrieve all child records
    private List<Map<String, Object>> getChildRecords() {
        // Query to fetch all child records
        String sql = "SELECT child_id, first_name, last_name, date_of_birth, gender, address, risk_level, status FROM children";
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
        return "Child Model Servlet for managing children records";
    }
}
