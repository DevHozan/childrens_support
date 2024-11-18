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

@WebServlet("/LegalSupportModel")
public class LegalSupportModel extends HttpServlet {
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
                addLegalSupportCase(request, session);
            } else if ("Update".equals(action)) {
                updateLegalSupportCase(request, session);
            } else if ("Delete".equals(action)) {
                deleteLegalSupportCase(request, session);
            }

            // Retrieve and display legal support records
            List<Map<String, Object>> legalSupportList = getLegalSupportRecords();
            request.setAttribute("legalSupportRecords", legalSupportList);

            // Forward to the legal support management page
            RequestDispatcher dispatcher = request.getRequestDispatcher("legalSupport.htm");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error_page.htm");
        }
    }

    // Method to handle adding a legal support case
    private void addLegalSupportCase(HttpServletRequest request, HttpSession session) {
        try {
            String caseType = request.getParameter("case_type");
            String childName = request.getParameter("child_name");
            String dateOfBirth = request.getParameter("date_of_birth");
            String courtName = request.getParameter("court_name");
            String judgeName = request.getParameter("judge_name");

            String sqlInsert = "INSERT INTO legal_support (case_type, child_name, date_of_birth, court_name, judge_name) VALUES (?, ?, ?, ?, ?)";
            jdbcTemplate.update(sqlInsert, caseType, childName, dateOfBirth, courtName, judgeName);
            session.setAttribute("message", "Legal support case added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding legal support case: " + e.getMessage());
        }
    }

    // Method to handle updating a legal support case
    private void updateLegalSupportCase(HttpServletRequest request, HttpSession session) {
        try {
            int caseId = Integer.parseInt(request.getParameter("case_id"));
            String caseType = request.getParameter("case_type");
            String childName = request.getParameter("child_name");
            String dateOfBirth = request.getParameter("date_of_birth");
            String courtName = request.getParameter("court_name");
            String judgeName = request.getParameter("judge_name");

            String sqlUpdate = "UPDATE legal_support SET case_type = ?, child_name = ?, date_of_birth = ?, court_name = ?, judge_name = ? WHERE case_id = ?";
            jdbcTemplate.update(sqlUpdate, caseType, childName, dateOfBirth, courtName, judgeName, caseId);
            session.setAttribute("message", "Legal support case updated successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid case ID. Update failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating legal support case: " + e.getMessage());
        }
    }

    // Method to handle deleting a legal support case
    private void deleteLegalSupportCase(HttpServletRequest request, HttpSession session) {
        try {
            int caseId = Integer.parseInt(request.getParameter("case_id"));
            String sqlDelete = "DELETE FROM legal_support WHERE case_id = ?";
            jdbcTemplate.update(sqlDelete, caseId);
            session.setAttribute("message", "Legal support case deleted successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid case ID. Deletion failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting legal support case: " + e.getMessage());
        }
    }

    // Method to retrieve all legal support records
    private List<Map<String, Object>> getLegalSupportRecords() {
        String sql = "SELECT case_id, case_type, child_name, date_of_birth, court_name, judge_name, created_at FROM legal_support";
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
        return "Legal Support Model Servlet for managing legal support cases";
    }
}
