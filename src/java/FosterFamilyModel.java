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

@WebServlet("/FosterFamilyModel")
public class FosterFamilyModel extends HttpServlet {
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

            // Handle Add, Update, and Delete actions
            if ("Add".equals(action)) {
                addFosterFamily(request, session);
            } else if ("Update".equals(action)) {
                updateFosterFamily(request, session);
            } else if ("Delete".equals(action)) {
                deleteFosterFamily(request, session);
            }

            // Retrieve and display foster family records
            List<Map<String, Object>> fosterFamilyList = getFosterFamilyRecords();
            if (fosterFamilyList.isEmpty()) {
                session.setAttribute("message", "No foster family records found.");
            } else {
                request.setAttribute("fosterFamilyRecords", fosterFamilyList);
            }

            // Forward to the foster family management page
            RequestDispatcher dispatcher = request.getRequestDispatcher("foster_families.htm");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error_page.htm");
        }
    }

    // Method to handle adding a foster family
    private void addFosterFamily(HttpServletRequest request, HttpSession session) {
        try {
            String familyName = request.getParameter("family_name");
            String contactNumber = request.getParameter("contact_number");
            String address = request.getParameter("address");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            int currentPlacements = Integer.parseInt(request.getParameter("current_placements"));
            String backgroundCheckStatus = request.getParameter("background_check_status");
            boolean trainingCompleted = "on".equals(request.getParameter("training_completed"));

            String sqlInsert = "INSERT INTO fosterfamilies (family_name, contact_number, address, capacity, current_placements, background_check_status, training_completed) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sqlInsert, familyName, contactNumber, address, capacity, currentPlacements, backgroundCheckStatus, trainingCompleted);
            session.setAttribute("message", "Foster family added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding foster family: " + e.getMessage());
        }
    }

    // Method to handle updating a foster family's details
    private void updateFosterFamily(HttpServletRequest request, HttpSession session) {
        try {
            int familyId = Integer.parseInt(request.getParameter("id"));
            String familyName = request.getParameter("family_name");
            String contactNumber = request.getParameter("contact_number");
            String address = request.getParameter("address");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            int currentPlacements = Integer.parseInt(request.getParameter("current_placements"));
            String backgroundCheckStatus = request.getParameter("background_check_status");
            boolean trainingCompleted = "on".equals(request.getParameter("training_completed"));

            String sqlUpdate = "UPDATE fosterfamilies SET family_name = ?, contact_number = ?, address = ?, capacity = ?, current_placements = ?, background_check_status = ?, training_completed = ? WHERE id = ?";
            jdbcTemplate.update(sqlUpdate, familyName, contactNumber, address, capacity, currentPlacements, backgroundCheckStatus, trainingCompleted, familyId);
            session.setAttribute("message", "Foster family updated successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid family ID. Update failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating foster family: " + e.getMessage());
        }
    }

    // Method to handle deleting a foster family
    private void deleteFosterFamily(HttpServletRequest request, HttpSession session) {
        try {
            int familyId = Integer.parseInt(request.getParameter("id"));
            String sqlDelete = "DELETE FROM fosterfamilies WHERE id = ?";
            jdbcTemplate.update(sqlDelete, familyId);
            session.setAttribute("message", "Foster family deleted successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid family ID. Deletion failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting foster family: " + e.getMessage());
        }
    }

    // Method to retrieve all foster family records
    private List<Map<String, Object>> getFosterFamilyRecords() {
        String sql = "SELECT id, family_name, contact_number, address, capacity, current_placements, background_check_status, training_completed FROM fosterfamilies";
        List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
        return result;
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
        return "Foster Families Model Servlet for managing foster family records";
    }
}
