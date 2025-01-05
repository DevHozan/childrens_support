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

              String childrens = "SELECT COUNT(*) FROM children";
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
    
    // Count of active boys
    
String activeBoysSql = "SELECT COUNT(*) FROM children WHERE gender = 'Male'";

// Count of active girls
String activeGirlsSql = "SELECT COUNT(*) FROM children WHERE gender = 'Female'";

// Count of high-risk children
String highRiskChildrenSql = "SELECT COUNT(*) FROM children WHERE risk_level = 'High'";

    // Querying the counts
    int childrencount=jdbcTemplate.queryForObject(childrens, Integer.class);
    int activeBoysCount = jdbcTemplate.queryForObject(activeBoysSql, Integer.class);
int activeGirlsCount = jdbcTemplate.queryForObject(activeGirlsSql, Integer.class);
int highRiskChildrenCount = jdbcTemplate.queryForObject(highRiskChildrenSql, Integer.class);


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
    request.setAttribute("childrencount", childrencount);
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
    
    
    

request.setAttribute("activeBoysCount", activeBoysCount);
request.setAttribute("activeGirlsCount", activeGirlsCount);
request.setAttribute("highRiskChildrenCount", highRiskChildrenCount);

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
             String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String dateOfBirth = request.getParameter("date_of_birth");
            String gender = request.getParameter("gender");
            

            // Validate required fields
            if (address == null || address.isEmpty() || riskLevel == null || riskLevel.isEmpty() || status == null || status.isEmpty()) {
                session.setAttribute("message", "All fields must be filled out for update.");
                return;
            }

            // Update the child's details in the database
            String sqlUpdate = "UPDATE children SET address = ?, risk_level = ?, status = ?, gender = ?, first_name = ?, last_name = ?, date_of_birth = ? WHERE child_id = ?";
jdbcTemplate.update(sqlUpdate, address, riskLevel, status, gender, firstName, lastName, dateOfBirth, childId);

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
