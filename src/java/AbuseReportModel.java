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
import org.springframework.dao.DataAccessException;

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
            if (request.getAttribute("message") != null) {
    request.removeAttribute("message");
}
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

              
        String activeUserssql = "SELECT COUNT(*) FROM users WHERE status = 'active'";
    String activeCountSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'active'";
    String closedCountSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'closed'";
    String abuseReportsCountSql = "SELECT COUNT(*) FROM abuse_reports";
    String fosterFamiliesCountSql = "SELECT COUNT(*) FROM fosterfamilies";
    String investigationsCountSql = "SELECT COUNT(*) FROM investigations";
    String totalCasesSql = "SELECT COUNT(*) FROM cases";
    String totalSupportRequestsSql = "SELECT COUNT(*) FROM support_requests";
    
    // Adding queries for Male and Female gender
    String activeUsersMaleSql = "SELECT COUNT(*) FROM users WHERE status = 'active' AND gender = 'Male'";
    String activeUsersFemaleSql = "SELECT COUNT(*) FROM users WHERE status = 'active' AND gender = 'Female'";
    
    String activeCasesMaleSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'active' AND gender = 'Male'";
    String activeCasesFemaleSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'active' AND gender = 'Female'";
    
    String closedCasesMaleSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'closed' AND gender = 'Male'";
    String closedCasesFemaleSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'closed' AND gender = 'Female'";
    
    String closedReportsSql = "SELECT COUNT(*) FROM abuse_reports WHERE status = 'closed'";
    String openedReportsSql = "SELECT COUNT(*) FROM abuse_reports WHERE status = 'open'";
    String pendingReportsSql = "SELECT COUNT(*) FROM abuse_reports WHERE status = 'pending'";

    // Querying the counts
    int closedReports=jdbcTemplate.queryForObject(closedReportsSql, Integer.class);
    int openedReports=jdbcTemplate.queryForObject(openedReportsSql, Integer.class);
    int pendingReports= jdbcTemplate.queryForObject(pendingReportsSql, Integer.class); 
    
    int activeUsersCount = jdbcTemplate.queryForObject(activeUserssql, Integer.class);
    int activeCasesCount = jdbcTemplate.queryForObject(activeCountSql, Integer.class);
    int closedCasesCount = jdbcTemplate.queryForObject(closedCountSql, Integer.class);
    int abuseReportsCount = jdbcTemplate.queryForObject(abuseReportsCountSql, Integer.class);
    int fosterFamiliesCount = jdbcTemplate.queryForObject(fosterFamiliesCountSql, Integer.class);
    int investigationsCount = jdbcTemplate.queryForObject(investigationsCountSql, Integer.class);
    int totalCases = jdbcTemplate.queryForObject(totalCasesSql, Integer.class);
    int totalSupportRequests = jdbcTemplate.queryForObject(totalSupportRequestsSql, Integer.class);

    // Querying Male and Female specific counts
    int activeUsersMaleCount = jdbcTemplate.queryForObject(activeUsersMaleSql, Integer.class);
    int activeUsersFemaleCount = jdbcTemplate.queryForObject(activeUsersFemaleSql, Integer.class);
    
    int activeCasesMaleCount = jdbcTemplate.queryForObject(activeCasesMaleSql, Integer.class);
    int activeCasesFemaleCount = jdbcTemplate.queryForObject(activeCasesFemaleSql, Integer.class);
    
    int closedCasesMaleCount = jdbcTemplate.queryForObject(closedCasesMaleSql, Integer.class);
    int closedCasesFemaleCount = jdbcTemplate.queryForObject(closedCasesFemaleSql, Integer.class);

    // Setting attributes to be passed to the JSP
    request.setAttribute("closedReports", closedReports);
    request.setAttribute("openedReports", openedReports);
    request.setAttribute("pendingReports", pendingReports);
    request.setAttribute("activeUsersCount", activeUsersCount);
    request.setAttribute("activeCasesCount", activeCasesCount);
    request.setAttribute("closedCasesCount", closedCasesCount);
    request.setAttribute("abuseReportsCount", abuseReportsCount);
    request.setAttribute("fosterFamiliesCount", fosterFamiliesCount);
    request.setAttribute("investigationsCount", investigationsCount);
    request.setAttribute("totalCases", totalCases);
    request.setAttribute("totalSupportRequests", totalSupportRequests);
    
    // Adding Male and Female specific counts to the JSP
    request.setAttribute("activeUsersMaleCount", activeUsersMaleCount);
    request.setAttribute("activeUsersFemaleCount", activeUsersFemaleCount);
    
    request.setAttribute("activeCasesMaleCount", activeCasesMaleCount);
    request.setAttribute("activeCasesFemaleCount", activeCasesFemaleCount);
    
    request.setAttribute("closedCasesMaleCount", closedCasesMaleCount);
    request.setAttribute("closedCasesFemaleCount", closedCasesFemaleCount);
   // Queries for active users and cases for the current week
String activeUsersWeekSql = "SELECT COUNT(*) FROM users WHERE status = 'active' AND WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String activeCountWeekSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'active' AND WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String closedCountWeekSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'closed' AND WEEK(updated_at, 1) = WEEK(CURDATE(), 1)";
String abuseReportsCountWeekSql = "SELECT COUNT(*) FROM abuse_reports WHERE WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String fosterFamiliesCountWeekSql = "SELECT COUNT(*) FROM fosterfamilies WHERE WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String investigationsCountWeekSql = "SELECT COUNT(*) FROM investigations WHERE WEEK(date, 1) = WEEK(CURDATE(), 1)";
String totalCasesWeekSql = "SELECT COUNT(*) FROM cases WHERE WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String totalSupportRequestsWeekSql = "SELECT COUNT(*) FROM support_requests WHERE WEEK(created_at, 1) = WEEK(CURDATE(), 1)";

// Queries for gender-based statistics within the current week
String activeUsersMaleWeekSql = "SELECT COUNT(*) FROM users WHERE status = 'active' AND gender = 'Male' AND WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String activeUsersFemaleWeekSql = "SELECT COUNT(*) FROM users WHERE status = 'active' AND gender = 'Female' AND WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String activeCasesMaleWeekSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'active' AND gender = 'Male' AND WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String activeCasesFemaleWeekSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'active' AND gender = 'Female' AND WEEK(created_at, 1) = WEEK(CURDATE(), 1)";
String closedCasesMaleWeekSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'closed' AND gender = 'Male' AND WEEK(updated_at, 1) = WEEK(CURDATE(), 1)";
String closedCasesFemaleWeekSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'closed' AND gender = 'Female' AND WEEK(updated_at, 1) = WEEK(CURDATE(), 1)";

// Execute the queries with error handling

    int activeUsersWeekCount = jdbcTemplate.queryForObject(activeUsersWeekSql, Integer.class);
    int activeCasesWeekCount = jdbcTemplate.queryForObject(activeCountWeekSql, Integer.class);
    int closedCasesWeekCount = jdbcTemplate.queryForObject(closedCountWeekSql, Integer.class);
    int abuseReportsWeekCount = jdbcTemplate.queryForObject(abuseReportsCountWeekSql, Integer.class);
    int fosterFamiliesWeekCount = jdbcTemplate.queryForObject(fosterFamiliesCountWeekSql, Integer.class);
    int investigationsWeekCount = jdbcTemplate.queryForObject(investigationsCountWeekSql, Integer.class);
    int totalCasesWeek = jdbcTemplate.queryForObject(totalCasesWeekSql, Integer.class);
    int totalSupportRequestsWeek = jdbcTemplate.queryForObject(totalSupportRequestsWeekSql, Integer.class);

    // Male and Female specific counts within the week
    int activeUsersMaleWeekCount = jdbcTemplate.queryForObject(activeUsersMaleWeekSql, Integer.class);
    int activeUsersFemaleWeekCount = jdbcTemplate.queryForObject(activeUsersFemaleWeekSql, Integer.class);
    int activeCasesMaleWeekCount = jdbcTemplate.queryForObject(activeCasesMaleWeekSql, Integer.class);
    int activeCasesFemaleWeekCount = jdbcTemplate.queryForObject(activeCasesFemaleWeekSql, Integer.class);
    int closedCasesMaleWeekCount = jdbcTemplate.queryForObject(closedCasesMaleWeekSql, Integer.class);
    int closedCasesFemaleWeekCount = jdbcTemplate.queryForObject(closedCasesFemaleWeekSql, Integer.class);

    // Setting the results as request attributes
    request.setAttribute("activeUsersWeekCount", activeUsersWeekCount);
    request.setAttribute("activeCasesWeekCount", activeCasesWeekCount);
    request.setAttribute("closedCasesWeekCount", closedCasesWeekCount);
    request.setAttribute("abuseReportsWeekCount", abuseReportsWeekCount);
    request.setAttribute("fosterFamiliesWeekCount", fosterFamiliesWeekCount);
    request.setAttribute("investigationsWeekCount", investigationsWeekCount);
    request.setAttribute("totalCasesWeek", totalCasesWeek);
    request.setAttribute("totalSupportRequestsWeek", totalSupportRequestsWeek);

    // Adding Male and Female specific counts to the JSP
    request.setAttribute("activeUsersMaleWeekCount", activeUsersMaleWeekCount);
    request.setAttribute("activeUsersFemaleWeekCount", activeUsersFemaleWeekCount);
    request.setAttribute("activeCasesMaleWeekCount", activeCasesMaleWeekCount);
    request.setAttribute("activeCasesFemaleWeekCount", activeCasesFemaleWeekCount);
    request.setAttribute("closedCasesMaleWeekCount", closedCasesMaleWeekCount);
    request.setAttribute("closedCasesFemaleWeekCount", closedCasesFemaleWeekCount);




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
