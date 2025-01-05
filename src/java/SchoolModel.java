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

@WebServlet("/SchoolModel")
public class SchoolModel extends HttpServlet {
    private JdbcTemplate jdbcTemplate;

    @Override
    public void init() throws ServletException {
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

            if ("Add".equals(action)) {
                addSchool(request, session);
            } else if ("Update".equals(action)) {
                updateSchool(request, session);
            } else if ("Delete".equals(action)) {
                deleteSchool(request, session);
            }
            
     
    String activeUserssql = "SELECT COUNT(*) FROM users WHERE status = 'active'";
    String activeCountSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'active'";
    String closedCountSql = "SELECT COUNT(*) FROM cases WHERE case_status = 'closed'";
    
    String activeschoolssql = "SELECT COUNT(*) FROM schools";
    String primarySql = "SELECT COUNT(*) FROM schools WHERE level='primary'";
    String secondarySql = "SELECT COUNT(*) FROM schools WHERE level='secondary'";
    
    String totalstudentsSql = "SELECT SUM(total_students) FROM schools";
        
    
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
    
  

    int activeschools = jdbcTemplate.queryForObject(activeschoolssql, Integer.class);
    int primary = jdbcTemplate.queryForObject(primarySql, Integer.class);
    int secondary = jdbcTemplate.queryForObject(secondarySql, Integer.class);
    int totalstudents = jdbcTemplate.queryForObject(totalstudentsSql, Integer.class);
    
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
     request.setAttribute("activeschools", activeschools);
    request.setAttribute("primary", primary);
    request.setAttribute("secondary", secondary);
    request.setAttribute("atotalstudents", totalstudents);
    
    
    
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





            // Retrieve and display school records
            List<Map<String, Object>> schoolList = getSchoolRecords();
            request.setAttribute("schoolRecords", schoolList);

            // Forward to the school management page
            RequestDispatcher dispatcher = request.getRequestDispatcher("schools.htm");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error_page.htm");
        }
    }

    // Method to handle adding a school
    private void addSchool(HttpServletRequest request, HttpSession session) {
        try {
            String schoolName = request.getParameter("school_name");
            String address = request.getParameter("address");
            String contactNumber = request.getParameter("contact_number");
            String principalName = request.getParameter("principal_name");
            String level = request.getParameter("level");
            int totalStudents = Integer.parseInt(request.getParameter("total_students"));
            String notes = request.getParameter("notes");
            String website = request.getParameter("website");

            String sqlInsert = "INSERT INTO schools (school_name, address, contact_number, principal_name,level, total_students, notes, website) VALUES (?,?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sqlInsert, schoolName, address, contactNumber, principalName,level, totalStudents, notes, website);
            session.setAttribute("message", "School added successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error adding school: " + e.getMessage());
        }
    }

    // Method to handle updating a school's details
    private void updateSchool(HttpServletRequest request, HttpSession session) {
        try {
            int schoolId = Integer.parseInt(request.getParameter("school_id"));
            String schoolName = request.getParameter("school_name");
            String address = request.getParameter("address");
            String contactNumber = request.getParameter("contact_number");
            String principalName = request.getParameter("principal_name");
            String level = request.getParameter("level");
            int totalStudents = Integer.parseInt(request.getParameter("total_students"));
            String notes = request.getParameter("notes");
            String website = request.getParameter("website");

            String sqlUpdate = "UPDATE schools SET school_name = ?, address = ?, contact_number = ?, principal_name = ?,level=?, total_students = ?, notes = ?, website = ? WHERE school_id = ?";
            jdbcTemplate.update(sqlUpdate, schoolName, address, contactNumber, principalName,level, totalStudents, notes, website, schoolId);
            session.setAttribute("message", "School updated successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error updating school: " + e.getMessage());
        }
    }

    // Method to handle deleting a school
    private void deleteSchool(HttpServletRequest request, HttpSession session) {
        try {
            int schoolId = Integer.parseInt(request.getParameter("school_id"));
            String sqlDelete = "DELETE FROM schools WHERE school_id = ?";
            jdbcTemplate.update(sqlDelete, schoolId);
            session.setAttribute("message", "School deleted successfully.");
        } catch (Exception e) {
            session.setAttribute("message", "Error deleting school: " + e.getMessage());
        }
    }

    // Method to retrieve all school records
    private List<Map<String, Object>> getSchoolRecords() {
        String sql = "SELECT school_id, school_name, address, contact_number, principal_name,level, total_students, created_at, updated_at, notes, website FROM schools";
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
        return "School Model Servlet for managing school records";
    }
}
