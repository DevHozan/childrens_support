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
            HttpSession session = request.getSession();
            String action = request.getParameter("action");

            if ("Add".equals(action)) {
                addSchool(request, session);
            } else if ("Update".equals(action)) {
                updateSchool(request, session);
            } else if ("Delete".equals(action)) {
                deleteSchool(request, session);
            }

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
            int totalStudents = Integer.parseInt(request.getParameter("total_students"));
            String notes = request.getParameter("notes");
            String website = request.getParameter("website");

            String sqlInsert = "INSERT INTO schools (school_name, address, contact_number, principal_name, total_students, notes, website) VALUES (?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sqlInsert, schoolName, address, contactNumber, principalName, totalStudents, notes, website);
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
            int totalStudents = Integer.parseInt(request.getParameter("total_students"));
            String notes = request.getParameter("notes");
            String website = request.getParameter("website");

            String sqlUpdate = "UPDATE schools SET school_name = ?, address = ?, contact_number = ?, principal_name = ?, total_students = ?, notes = ?, website = ? WHERE school_id = ?";
            jdbcTemplate.update(sqlUpdate, schoolName, address, contactNumber, principalName, totalStudents, notes, website, schoolId);
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
        String sql = "SELECT school_id, school_name, address, contact_number, principal_name, total_students, created_at, updated_at, notes, website FROM schools";
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
