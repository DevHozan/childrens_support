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
        <div class="card total-schools bg-info">Total Schools <br><span>${activeschools}</span></div>
        <div class="card total-students bg-primary">Total Students <br><span>${activeschools}</span></div>
        <div class="card primary-schools bg-secondary">Primary Schools <br><span>${primary}</span></div>
        <div class="card high-schools bg-info">High Schools <br><span>${secondary}</span></div>
    </div>

    <!-- New School Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newSchoolModal">+ New School</button>
${message}
    <!-- School Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>School Name</th>
                    <th>Address</th>
                    <th>Contact Number</th>
                    <th>Principal</th>
                    <th>School level</th>
                    <th>Total Students</th>
                    <th>Created At</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="school" items="${schoolRecords}">
                    <tr>
                        <td>${school.school_id}</td>
                        <td>${school.school_name}</td>
                        <td>${school.address}</td>
                        <td>${school.contact_number}</td>
                        <td>${school.principal_name}</td>
                        <td>${school.level}</td>
                        <td>${school.total_students}</td>
                        <td>${school.created_at}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateSchoolModal" 
                                    onclick="populateUpdateForm(${school.school_id}, '${school.school_name}', '${school.address}', '${school.contact_number}', '${school.principal_name}', ${school.total_students})">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                                                                                                                                                                                      <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("role") != "admin") { %>
      <form action="SchoolModel" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="Delete">
                                <input type="hidden" name="school_id" value="${school.school_id}">
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

<!-- Modal for New School Form -->
<div class="modal fade" id="newSchoolModal" tabindex="-1" role="dialog" aria-labelledby="newSchoolModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newSchoolModalLabel">New School</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="SchoolModel" method="get">
                    <div class="form-group">
                        <label for="schoolName">School Name</label>
                        <input type="text" class="form-control" name="school_name" id="schoolName" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" name="address" id="address" required>
                    </div>
                    <div class="form-group">
                        <label for="contactNumber">Contact Number</label>
                        <input type="tel" class="form-control" name="contact_number" id="contactNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="principalName">Principal Name</label>
                        <input type="text" class="form-control" name="principal_name" id="principalName" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="level">level</label>
                        <select class='form-control' name='level'>
                            <option value='primary'>Primary</option>
                            <option value='secondary'>Secondary</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="totalStudents">Total Students</label>
                        <input type="number" class="form-control" name="total_students" id="totalStudents" required>
                    </div>
                    <input type="hidden" name="action" value="Add">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save School</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update School Form -->
<div class="modal fade" id="updateSchoolModal" tabindex="-1" role="dialog" aria-labelledby="updateSchoolModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateSchoolModalLabel">Update School</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="SchoolModel" method="get">
                    <input type="hidden" name="school_id" id="updateSchoolId">
                    <div class="form-group">
                        <label for="updateSchoolName">School Name</label>
                        <input type="text" class="form-control" name="school_name" id="updateSchoolName" required>
                    </div>
                    <div class="form-group">
                        <label for="updateAddress">Address</label>
                        <input type="text" class="form-control" name="address" id="updateAddress" required>
                    </div>
                    <div class="form-group">
                        <label for="updateContactNumber">Contact Number</label>
                        <input type="tel" class="form-control" name="contact_number" id="updateContactNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="updatePrincipalName">Principal Name</label>
                        <input type="text" class="form-control" name="principal_name" id="updatePrincipalName" required>
                    </div>
                    
                     <div class="form-group">
                        <label for="level">level</label>
                        <select class='form-control' name='level'>
                            <option value='primary'>Primary</option>
                            <option value='secondary'>Secondary</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="updateTotalStudents">Total Students</label>
                        <input type="number" class="form-control" name="total_students" id="updateTotalStudents" required>
                    </div>
                    <input type="hidden" name="action" value="Update">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update School</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function populateUpdateForm(schoolId, schoolName, address, contactNumber, principalName, totalStudents) {
        document.getElementById("updateSchoolId").value = schoolId;
        document.getElementById("updateSchoolName").value = schoolName;
        document.getElementById("updateAddress").value = address;
        document.getElementById("updateContactNumber").value = contactNumber;
        document.getElementById("updatePrincipalName").value = principalName;
        document.getElementById("updateTotalStudents").value = totalStudents;
    }
</script>
