import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.context.support.WebApplicationContextUtils;
import javax.servlet.RequestDispatcher;
import org.springframework.dao.DataAccessException;

@WebServlet("/DocumentModel")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class DocumentModel extends HttpServlet {
    private JdbcTemplate jdbcTemplate;
    private static final String UPLOAD_DIRECTORY = "documents";

    @Override
    public void init() throws ServletException {
        ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        jdbcTemplate = (JdbcTemplate) context.getBean("jdbcTemplate");
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String action = request.getParameter("action");
            if (action == null || action.trim().isEmpty()) {
                request.setAttribute("message", "No action specified.");
            } else if ("Add".equalsIgnoreCase(action)) {
                addDocument(request);
            } else if ("Update".equalsIgnoreCase(action)) {
                updateDocument(request);
            } else if ("Delete".equalsIgnoreCase(action)) {
                deleteDocument(request);
            } else {
                request.setAttribute("message", "Unknown action.");
            }

          

            // SQL queries to get document counts
String totalDocumentsSql = "SELECT COUNT(*) FROM documents";
String publicDocumentsSql = "SELECT COUNT(*) FROM documents WHERE access_level = 'public'";
String privateDocumentsSql = "SELECT COUNT(*) FROM documents WHERE access_level = 'private'";
String restrictedDocumentsSql = "SELECT COUNT(*) FROM documents WHERE access_level = 'restricted'";

// Fetch counts using jdbcTemplate
int totalDocuments = jdbcTemplate.queryForObject(totalDocumentsSql, Integer.class);
int publicDocuments = jdbcTemplate.queryForObject(publicDocumentsSql, Integer.class);
int privateDocuments = jdbcTemplate.queryForObject(privateDocumentsSql, Integer.class);
int restrictedDocuments = jdbcTemplate.queryForObject(restrictedDocumentsSql, Integer.class);

// Set attributes to be passed to the JSP
request.setAttribute("totalDocuments", totalDocuments);
request.setAttribute("publicDocuments", publicDocuments);
request.setAttribute("privateDocuments", privateDocuments);
request.setAttribute("restrictedDocuments", restrictedDocuments);

            List<Map<String, Object>> documentList = getDocumentRecords();
            request.setAttribute("documentRecords", documentList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("documents.htm");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            log("Error processing request", e);
            response.sendRedirect("error_page.htm");
        }
    }

    private void addDocument(HttpServletRequest request) throws Exception {
        String documentType = request.getParameter("documentType");
        String description = request.getParameter("description");
        String accessLevel = request.getParameter("accessLevel");
        String lastModified = request.getParameter("lastModified");

        Part filePart = request.getPart("document");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uniqueFileName = System.currentTimeMillis() + "_" + fileName;

        Path uploadDir = Paths.get(getServletContext().getRealPath(""), UPLOAD_DIRECTORY);
        if (!Files.exists(uploadDir)) Files.createDirectories(uploadDir);

        Path filePath = uploadDir.resolve(uniqueFileName);
        Files.copy(filePart.getInputStream(), filePath);

        String sqlInsert = "INSERT INTO documents (document_type, description, access_level, last_modified, document) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sqlInsert, documentType, description, accessLevel, lastModified, UPLOAD_DIRECTORY + "/" + uniqueFileName);

        request.setAttribute("message", "Document added successfully.");
    }

    private void updateDocument(HttpServletRequest request) throws Exception {
        int documentId = Integer.parseInt(request.getParameter("document_id"));
        String description = request.getParameter("description");
        String accessLevel = request.getParameter("accessLevel");
        String lastModified = request.getParameter("lastModified");

        String sqlUpdate = "UPDATE documents SET description = ?, access_level = ?, last_modified = ? WHERE document_id = ?";
        jdbcTemplate.update(sqlUpdate, description, accessLevel, lastModified, documentId);

        request.setAttribute("message", "Document updated successfully.");
    }

    private void deleteDocument(HttpServletRequest request) throws Exception {
        int documentId = Integer.parseInt(request.getParameter("document_id"));
        String sqlSelect = "SELECT document FROM documents WHERE document_id = ?";
        String filePath = jdbcTemplate.queryForObject(sqlSelect, new Object[]{documentId}, String.class);

        Path fullPath = Paths.get(getServletContext().getRealPath(""), filePath);
        Files.deleteIfExists(fullPath);

        String sqlDelete = "DELETE FROM documents WHERE document_id = ?";
        jdbcTemplate.update(sqlDelete, documentId);

        request.setAttribute("message", "Document deleted successfully.");
    }

    private List<Map<String, Object>> getDocumentRecords() {
        String sql = "SELECT document_id, document_type, description, access_level, last_modified, document FROM documents";
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
        return "DocumentModel Servlet for managing document records.";
    }
}
