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

@WebServlet("/AbuseReportModel")
public class AbuseReportModel extends HttpServlet {
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

            // Perform the appropriate action based on the request
            if ("Add".equals(action)) {
                addReport(request, session);
            } else if ("Update".equals(action)) {
                updateReport(request, session);
            } else if ("Delete".equals(action)) {
                deleteReport(request, session);
            }

            // Retrieve and display report records
            List<Map<String, Object>> reportList = getReportRecords();
            request.setAttribute("reportRecords", reportList);

            // Forward to the report management page
            RequestDispatcher dispatcher = request.getRequestDispatcher("abuse.htm");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error_page.htm");
        }
    }

    // Method to handle adding a new abuse report
    private void addReport(HttpServletRequest request, HttpSession session) {
        try {
            String childName = request.getParameter("child_name");
            String dateOfReport = request.getParameter("date_of_report");
            String status = request.getParameter("status");

            String sqlInsert = "INSERT INTO abuse_reports (child_name, date_of_report, status) VALUES (?, ?, ?)";
            jdbcTemplate.update(sqlInsert, childName, dateOfReport, status);
            session.setAttribute("message", "Report added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding report: " + e.getMessage());
        }
    }

    // Method to handle updating an abuse report
    private void updateReport(HttpServletRequest request, HttpSession session) {
        try {
            int reportId = Integer.parseInt(request.getParameter("report_id"));
            String status = request.getParameter("status");

            String sqlUpdate = "UPDATE abuse_reports SET status = ? WHERE report_id = ?";
            jdbcTemplate.update(sqlUpdate, status, reportId);
            session.setAttribute("message", "Report updated successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid report ID. Report update failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating report: " + e.getMessage());
        }
    }

    // Method to handle deleting an abuse report
    private void deleteReport(HttpServletRequest request, HttpSession session) {
        try {
            int reportId = Integer.parseInt(request.getParameter("report_id"));
            String sqlDelete = "DELETE FROM abuse_reports WHERE report_id = ?";
            jdbcTemplate.update(sqlDelete, reportId);
            session.setAttribute("message", "Report deleted successfully.");
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid report ID. Report deletion failed.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting report: " + e.getMessage());
        }
    }

    // Method to retrieve all abuse report records
    private List<Map<String, Object>> getReportRecords() {
        String sql = "SELECT report_id, child_name, date_of_report, status, last_update, created_at FROM abuse_reports";
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
        return "Abuse Report Model Servlet for managing abuse report records";
    }
}
