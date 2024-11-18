<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                 <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("id") == null) {
        // Redirect to the login page if not logged in
        response.sendRedirect("login.htm");
        return; // Stop further processing of the current page
    }
%>

<div class="main-content">
    <!-- Summary Cards -->
    <div class="summary-cards">
        <div class="card total-cases">
            Total Investigations <br><span>${investigationCount}</span>
        </div>
        <div class="card weekly-cases">
            This Week <br><span>${weeklyInvestigations}</span>
        </div>
    </div>

    <!-- New Investigation Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newInvestigationModal">+ New Investigation</button>

    <!-- Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Investigation Type</th>
                    <th>Date</th>
                    <th>Outcome</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="investigation" items="${investigationList}">
                    <tr>
                        <td>${investigation.id}</td>
                        <td>${investigation.investigation_type}</td>
                        <td>${investigation.date}</td>
                        <td>${investigation.outcome}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateInvestigationModal"
                                onclick="populateUpdateForm('${investigation.id}', '${investigation.investigation_type}', '${investigation.date}', '${investigation.outcome}');">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                                                                                                                                                          <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("role") != "admin") { %>
      <form action="RiskModel" method="get" onsubmit="return confirm('Are you sure you want to delete this investigation?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${investigation.id}">
                                <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                            </form>
        <%
        
    }
%>
                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal for New Investigation Form -->
<div class="modal fade" id="newInvestigationModal" tabindex="-1" role="dialog" aria-labelledby="newInvestigationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newInvestigationModalLabel">New Investigation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="RiskModel" method="get">
                    <input type="hidden" name="action" value="insert">
                    <div class="form-group">
                        <label for="investigationType">Investigation Type</label>
                        <input type="text" class="form-control" id="investigationType" name="investigationType" required>
                    </div>
                    <div class="form-group">
                        <label for="investigationDate">Date</label>
                        <input type="date" class="form-control" name="date" id="investigationDate" required>
                    </div>
                    <div class="form-group">
                        <label for="outcome">Outcome</label>
                        <textarea class="form-control" name="outcome" id="outcome"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Investigation</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update Investigation Form -->
<div class="modal fade" id="updateInvestigationModal" tabindex="-1" role="dialog" aria-labelledby="updateInvestigationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateInvestigationModalLabel">Update Investigation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="RiskModel" method="get">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" id="updateId">
                    <div class="form-group">
                        <label for="updateInvestigationType">Investigation Type</label>
                        <input type="text" class="form-control" name="investigationType" id="updateInvestigationType" required>
                    </div>
                    <div class="form-group">
                        <label for="updateInvestigationDate">Date</label>
                        <input type="date" class="form-control" name="date" id="updateInvestigationDate" required>
                    </div>
                    <div class="form-group">
                        <label for="updateOutcome">Outcome</label>
                        <textarea class="form-control" name="outcome" id="updateOutcome"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Investigation</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
function populateUpdateForm(id, investigationType, date, outcome) {
    document.getElementById('updateId').value = id || '';
    document.getElementById('updateInvestigationType').value = investigationType || '';
    document.getElementById('updateInvestigationDate').value = date || '';
    document.getElementById('updateOutcome').value = outcome || '';
}
</script>

<%@ include file="footer.jsp" %>
