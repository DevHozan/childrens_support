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
    <!-- Summary Cards (This part can remain or be modified based on the data you want to display) -->
    <div class="summary-cards">
        <div class="card total-cases">Total Support Requests <br><span>${totalRequests}</span></div>
        <div class="card male-cases">Male Support Requests <br><span>${maleRequests}</span></div>
        <div class="card female-cases">Female Support Requests <br><span>${femaleRequests}</span></div>
        <div class="card weekly-cases">This Week <br><span>${weekRequests}</span></div>
    </div>

    <!-- New Support Request Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newSupportRequestModal">+ New Support Request</button>
 
 <c:if test="${not empty message}">
<!--    <div class="text-info">${message}</div>-->
</c:if>

    <!-- Support Request Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Case ID</th>
                    <th>Case Type</th>
                    <th>Child Name</th>
                    <th>Date of Birth</th>
                    <th>Court Name</th>
                    <th>Judge Name</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="request" items="${legalSupportRecords}">
                    <tr>
                        <td>${request.case_id}</td>
                        <td>${request.case_type}</td>
                        <td>${request.child_name}</td>
                        <td>${request.date_of_birth}</td>
                        <td>${request.court_name}</td>
                        <td>${request.judge_name}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateSupportRequestModal" 
                                    onclick="populateUpdateForm(${request.case_id}, '${request.case_type}', '${request.child_name}', '${request.date_of_birth}', '${request.court_name}', '${request.judge_name}')">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                            
                                                                                                                                                          <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("role") != "admin") { %>
       <form action="LegalSupportModel" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="Delete">
                                <input type="hidden" name="case_id" value="${request.case_id}">
                                <button class="btn btn-danger btn-sm" type="submit">
                                    <i class="fas fa-trash"></i>
                                </button>
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

<!-- Modal for New Support Request Form -->
<div class="modal fade" id="newSupportRequestModal" tabindex="-1" role="dialog" aria-labelledby="newSupportRequestModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newSupportRequestModalLabel">New Support Request</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="LegalSupportModel" method="GET">
                    <div class="form-group">
                        <label for="caseType">Case Type</label>
                        <input type="text" class="form-control" name="case_type" id="caseType" required>
                    </div>
                    <div class="form-group">
                        <label for="childName">Child Name</label>
                        <input type="text" class="form-control" name="child_name" id="childName" required>
                    </div>
                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth</label>
                        <input type="date" class="form-control" name="date_of_birth" id="dateOfBirth" required>
                    </div>
                    <div class="form-group">
                        <label for="courtName">Court Name</label>
                        <input type="text" class="form-control" name="court_name" id="courtName" required>
                    </div>
                    <div class="form-group">
                        <label for="judgeName">Judge Name</label>
                        <input type="text" class="form-control" name="judge_name" id="judgeName" required>
                    </div>
                    <input type="hidden" name="action" value="Add">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Support Request</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update Support Request Form -->
<div class="modal fade" id="updateSupportRequestModal" tabindex="-1" role="dialog" aria-labelledby="updateSupportRequestModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateSupportRequestModalLabel">Update Support Request</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="LegalSupportModel" method="GET">
                    <input type="hidden" name="case_id" id="updateCaseId">
                    <div class="form-group">
                        <label for="updateCaseType">Case Type</label>
                        <input type="text" class="form-control" name="case_type" id="updateCaseType" required>
                    </div>
                    <div class="form-group">
                        <label for="updateChildName">Child Name</label>
                        <input type="text" class="form-control" name="child_name" id="updateChildName" required>
                    </div>
                    <div class="form-group">
                        <label for="updateDateOfBirth">Date of Birth</label>
                        <input type="date" class="form-control" name="date_of_birth" id="updateDateOfBirth" required>
                    </div>
                    <div class="form-group">
                        <label for="updateCourtName">Court Name</label>
                        <input type="text" class="form-control" name="court_name" id="updateCourtName" required>
                    </div>
                    <div class="form-group">
                        <label for="updateJudgeName">Judge Name</label>
                        <input type="text" class="form-control" name="judge_name" id="updateJudgeName" required>
                    </div>
                    <input type="hidden" name="action" value="Update">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Function to populate the update form with existing data
    function populateUpdateForm(caseId, caseType, childName, dateOfBirth, courtName, judgeName) {
        document.getElementById('updateCaseId').value = caseId;
        document.getElementById('updateCaseType').value = caseType;
        document.getElementById('updateChildName').value = childName;
        document.getElementById('updateDateOfBirth').value = dateOfBirth;
        document.getElementById('updateCourtName').value = courtName;
        document.getElementById('updateJudgeName').value = judgeName;
    }
</script>

<%@ include file="footer.jsp" %>
