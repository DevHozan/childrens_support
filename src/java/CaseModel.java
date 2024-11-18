import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebServlet("/CaseModel")
public class CaseModel extends HttpServlet {
    private JdbcTemplate jdbcTemplate;

    @Override
    public void init() throws ServletException {
        ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        jdbcTemplate = (JdbcTemplate) context.getBean("jdbcTemplate");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        try {
            if ("insert".equals(action)) {
                addCase(request, session);
            } else if ("update".equals(action)) {
                updateCase(request, session);
            } else if ("delete".equals(action)) {
                deleteCase(request, session);
            }

            List<Map<String, Object>> caseList = getCaseRecords(); // Fetch the list of cases
            request.setAttribute("caseList", caseList); // Set the list in the request
            request.getRequestDispatcher("cases.htm").forward(request, response); // Forward to the correct JSP

        } catch (Exception e) {
            session.setAttribute("message", "Error: " + e.getMessage());
            response.sendRedirect("error_page.htm");
        }
    }

    private void addCase(HttpServletRequest request, HttpSession session) {
        try {
            String childName = request.getParameter("childName");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String caseStatus = request.getParameter("caseStatus");
            String caseStartDate = request.getParameter("caseStartDate");
            String assignedWorker = request.getParameter("assignedWorker");

            String sqlInsert = "INSERT INTO cases (child_name, date_of_birth, gender, case_status, case_start_date, assigned_worker) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sqlInsert, childName, dateOfBirth, gender, caseStatus, caseStartDate, assignedWorker);
            session.setAttribute("message", "Case record added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding case: " + e.getMessage());
        }
    }

    private void updateCase(HttpServletRequest request, HttpSession session) {
        try {
            int caseId = Integer.parseInt(request.getParameter("id"));
            String childName = request.getParameter("childName");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String caseStatus = request.getParameter("caseStatus");
            String caseStartDate = request.getParameter("caseStartDate");
            String caseEndDate = request.getParameter("caseEndDate");
            String assignedWorker = request.getParameter("assignedWorker");

            String sqlUpdate = "UPDATE cases SET child_name = ?, date_of_birth = ?, gender = ?, case_status = ?, " +
                    "case_start_date = ?, case_end_date = ?, assigned_worker = ? WHERE id = ?";
            jdbcTemplate.update(sqlUpdate, childName, dateOfBirth, gender, caseStatus, caseStartDate, caseEndDate, assignedWorker, caseId);
            session.setAttribute("message", "Case updated successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating case: " + e.getMessage());
        }
    }

    private void deleteCase(HttpServletRequest request, HttpSession session) {
        try {
            int caseId = Integer.parseInt(request.getParameter("id"));
            String sqlDelete = "DELETE FROM cases WHERE id = ?";
            jdbcTemplate.update(sqlDelete, caseId);
            session.setAttribute("message", "Case deleted successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting case: " + e.getMessage());
        }
    }

    private List<Map<String, Object>> getCaseRecords() {
        String sqlSelect = "SELECT * FROM cases";
        return jdbcTemplate.queryForList(sqlSelect);
    }

    @Override
    public String getServletInfo() {
        return "Child Model Servlet for managing children records";
    }
}
