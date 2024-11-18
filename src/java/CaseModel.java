import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DataAccessException;
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

    // Querying the counts
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




            
            
        Map<String, Object> result = getCaseStatistics(); // Fetch the case statistics
request.setAttribute("results", result); // Set the result map in the request


            List<Map<String, Object>> caseList = getCaseRecords(); // Fetch the list of cases
            request.setAttribute("caseList", caseList); // Set the list in the request
            request.getRequestDispatcher("cases.htm").forward(request, response); // Forward to the correct JSP
            

        } catch (Exception e) {
            session.setAttribute("message", "Error: " + e.getMessage());
            response.sendRedirect("error_page.htm");
        }
    }
    
private Map<String, Object> getCaseStatistics() {
    try {
        // SQL query to calculate the count and sum
        String sql = "SELECT COUNT(id) AS case_count, SUM(case_amount) AS total_amount FROM cases";

        // Execute the query and map the results
        Map<String, Object> result = jdbcTemplate.queryForMap(sql);

        // Return the result directly
        return result;
    } catch (Exception e) {
        // Log the error for debugging purposes (optional)
        e.printStackTrace(); // or use a logger

        // Return an error message in the map
        Map<String, Object> errorResult = new HashMap<>();
        errorResult.put("error", "Error retrieving statistics: " + e.getMessage());
        return errorResult;
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
