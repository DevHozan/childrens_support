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
        Total Cases <br><span class="text-dark">${totalCases}</span>
    </div>
    <div class="card male-cases">
        Male Cases <br><span>${activeCasesMaleCount}</span>
    </div>
    <div class="card female-cases">
        Female Cases <br><span>${activeCasesFemaleCount}</span>
    </div>
    <div class="card weekly-cases">
        This Week <br><span>${totalCasesWeek}</span>
    </div>
</div>


    <!-- New Case Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newCaseModal">+ New Case</button>

    <!-- Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Case Sn</th>
                    <th>Child Name</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Case Status</th>
                    <th>Case Start Date</th>
                    <th>Case End Date</th>
                    <th>Assigned Worker</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cases" items="${caseList}">
                    <tr>
                        <td>${cases.id}</td>
                        <td>${cases.child_name}</td>
                        <td>${cases.date_of_birth}</td>
                        <td>${cases.gender}</td>
                        <td>${cases.case_status}</td>
                        <td>${cases.case_start_date}</td>
                        <td>${cases.case_end_date}</td>
                        <td>${cases.assigned_worker}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateCaseModal"
                                onclick="populateUpdateForm('${cases.id}', '${cases.child_name}', '${cases.date_of_birth}', '${cases.gender}', '${cases.case_status}', '${cases.case_start_date}', '${cases.case_end_date}', '${cases.assigned_worker}');">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                            
                                                                         <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("role") != "admin") { %>
        
                                  <form action="CaseModel" method="get" onsubmit="return confirm('Are you sure you want to delete this case?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${cases.id}">
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

<!-- Modal for New Case Form -->
<div class="modal fade" id="newCaseModal" tabindex="-1" role="dialog" aria-labelledby="newCaseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newCaseModalLabel">New Case</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="CaseModel" method="get">
                    <input type="hidden" name="action" value="insert">
                    <div class="form-group">
                        <label for="childName">Child Name</label>
                        <input type="text" class="form-control" id="childName" name="childName" required>
                    </div>
                    <div class="form-group">
                        <label for="dob">Date of Birth</label>
                        <input type="date" class="form-control" name="dateOfBirth" id="dob" required>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select class="form-control" name="gender" id="gender" required>
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="caseStatus">Case Status</label>
                        <select name="caseStatus" id="caseStatus" class="form-control">
                            <option>Open</option>
                            <option>Closed</option>
                            <option>Pending</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="caseStartDate">Case Start Date</label>
                        <input type="date" class="form-control" name="caseStartDate" id="caseStartDate" required>
                    </div>
                    <div class="form-group">
                        <label for="caseEndDate">Case End Date</label>
                        <input type="date" class="form-control" name="caseEndDate" id="caseEndDate">
                    </div>
                    <div class="form-group">
                        <label for="assignedWorker">Assigned Worker</label>
                        <input type="text" class="form-control" name="assignedWorker" id="assignedWorker">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Case</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update Case Form -->
<div class="modal fade" id="updateCaseModal" tabindex="-1" role="dialog" aria-labelledby="updateCaseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateCaseModalLabel">Update Case</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="CaseModel" method="get">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" id="updateId">
                    <div class="form-group">
                        <label for="updateChildName">Child Name</label>
                        <input type="text" class="form-control" name="childName" id="updateChildName" required>
                    </div>
                    <div class="form-group">
                        <label for="updateDob">Date of Birth</label>
                        <input type="date" class="form-control" name="dateOfBirth" id="updateDob" required>
                    </div>
                    <div class="form-group">
                        <label for="updateGender">Gender</label>
                        <select class="form-control" name="gender" id="updateGender" required>
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="updateCaseStatus">Case Status</label>
                        <select class="form-control" name="caseStatus" id="updateCaseStatus" required>
                            <option>Open</option>
                            <option>Closed</option>
                            <option>Pending</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="updateCaseStartDate">Case Start Date</label>
                        <input type="date" class="form-control" name="caseStartDate" id="updateCaseStartDate" required>
                    </div>
                    <div class="form-group">
                        <label for="updateCaseEndDate">Case End Date</label>
                        <input type="date" class="form-control" name="caseEndDate" id="updateCaseEndDate">
                    </div>
                    <div class="form-group">
                        <label for="updateAssignedWorker">Assigned Worker</label>
                        <input type="text" class="form-control" name="assignedWorker" id="updateAssignedWorker">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Case</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
function populateUpdateForm(id, childName, dob, gender, caseStatus, caseStartDate, caseEndDate, assignedWorker) {
    document.getElementById('updateId').value = id || '';
    document.getElementById('updateChildName').value = childName || '';
    document.getElementById('updateDob').value = dob || '';
    document.getElementById('updateGender').value = gender || '';
    document.getElementById('updateCaseStatus').value = caseStatus || '';
    document.getElementById('updateCaseStartDate').value = caseStartDate || '';
    document.getElementById('updateCaseEndDate').value = caseEndDate || '';
    document.getElementById('updateAssignedWorker').value = assignedWorker || '';
}
</script>

<%@ include file="footer.jsp" %>
