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

@WebServlet("/RiskModel")
public class RiskModel extends HttpServlet {
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
                addInvestigation(request, session);
            } else if ("update".equals(action)) {
                updateInvestigation(request, session);
            } else if ("delete".equals(action)) {
                deleteInvestigation(request, session);
            }

            List<Map<String, Object>> investigationList = getInvestigationRecords(); // Fetch the list of investigations
            request.setAttribute("investigationList", investigationList); // Set the list in the request
            request.getRequestDispatcher("risk.htm").forward(request, response); // Forward to the correct JSP

        } catch (Exception e) {
            session.setAttribute("message", "Error: " + e.getMessage());
            response.sendRedirect("error_page.htm");
        }
    }

    private void addInvestigation(HttpServletRequest request, HttpSession session) {
        try {
            String investigationType = request.getParameter("investigationType");
            String date = request.getParameter("date");
            String outcome = request.getParameter("outcome");

            String sqlInsert = "INSERT INTO investigations (investigation_type, date, outcome) " +
                    "VALUES (?, ?, ?)";
            jdbcTemplate.update(sqlInsert, investigationType, date, outcome);
            session.setAttribute("message", "Investigation record added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding investigation: " + e.getMessage());
        }
    }

    private void updateInvestigation(HttpServletRequest request, HttpSession session) {
        try {
            int investigationId = Integer.parseInt(request.getParameter("id"));
            String investigationType = request.getParameter("investigationType");
            String date = request.getParameter("date");
            String outcome = request.getParameter("outcome");

            String sqlUpdate = "UPDATE investigations SET investigation_type = ?, date = ?, outcome = ? WHERE id = ?";
            jdbcTemplate.update(sqlUpdate, investigationType, date, outcome, investigationId);
            session.setAttribute("message", "Investigation updated successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating investigation: " + e.getMessage());
        }
    }

    private void deleteInvestigation(HttpServletRequest request, HttpSession session) {
        try {
            int investigationId = Integer.parseInt(request.getParameter("id"));
            String sqlDelete = "DELETE FROM investigations WHERE id = ?";
            jdbcTemplate.update(sqlDelete, investigationId);
            session.setAttribute("message", "Investigation deleted successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting investigation: " + e.getMessage());
        }
    }

    private List<Map<String, Object>> getInvestigationRecords() {
        String sqlSelect = "SELECT * FROM investigations";
        return jdbcTemplate.queryForList(sqlSelect);
    }

    @Override
    public String getServletInfo() {
        return "Risk Model Servlet for managing investigation records";
    }
}
