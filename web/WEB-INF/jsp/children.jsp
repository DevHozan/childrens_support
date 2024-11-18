<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main-content">
    <!-- Summary Cards -->
    <div class="summary-cards">
        <div class="card total-children">Total Children <br><span>${totalChildren}</span></div>
        <div class="card boys">Boys <br><span>${boysCount}</span></div>
        <div class="card girls">Girls <br><span>${girlsCount}</span></div>
        <div class="card risk-high">High Risk <br><span>${highRiskCount}</span></div>
    </div>

    <!-- New Child Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newChildModal">+ New Child</button>

    <!-- Children Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Risk Level</th>
                    <th>Status</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="child" items="${childRecords}">
                    <tr>
                        <td>${child.child_id}</td>
                        <td>${child.first_name} ${child.last_name}</td>
                        <td>${child.date_of_birth}</td>
                        <td>${child.gender}</td>
                        <td>${child.address}</td>
                        <td>${child.risk_level}</td>
                        <td>${child.status}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateChildModal" 
                                    onclick="populateUpdateForm(${child.child_id}, '${child.first_name}', '${child.last_name}', '${child.date_of_birth}', '${child.gender}', '${child.address}', '${child.risk_level}', '${child.status}')">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                            <form action="ChildModel" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="Delete">
                                <input type="hidden" name="child_id" value="${child.child_id}">
                                <button class="btn btn-danger btn-sm" type="submit">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal for New Child Form -->
<div class="modal fade" id="newChildModal" tabindex="-1" role="dialog" aria-labelledby="newChildModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newChildModalLabel">New Child</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ChildModel" method="get">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" class="form-control" name="first_name" id="firstName" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" class="form-control" name="last_name" id="lastName" required>
                    </div>
                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth</label>
                        <input type="date" class="form-control" name="date_of_birth" id="dateOfBirth" required>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select class="form-control" name="gender" id="gender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" name="address" id="address">
                    </div>
                    <div class="form-group">
                        <label for="riskLevel">Risk Level</label>
                        <select class="form-control" name="risk_level" id="riskLevel" required>
                            <option value="Low">Low</option>
                            <option value="Moderate">Moderate</option>
                            <option value="High">High</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" name="status" id="status" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <input type="hidden" name="action" value="Add">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Child</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update Child Form -->
<div class="modal fade" id="updateChildModal" tabindex="-1" role="dialog" aria-labelledby="updateChildModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateChildModalLabel">Update Child</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ChildModel" method="get">
                    <input type="hidden" name="child_id" id="updateChildId">
                    <div class="form-group">
                        <label for="updateFirstName">First Name</label>
                        <input type="text" class="form-control" name="first_name" id="updateFirstName" required>
                    </div>
                    <div class="form-group">
                        <label for="updateLastName">Last Name</label>
                        <input type="text" class="form-control" name="last_name" id="updateLastName" required>
                    </div>
                    <div class="form-group">
                        <label for="updateDateOfBirth">Date of Birth</label>
                        <input type="date" class="form-control" name="date_of_birth" id="updateDateOfBirth" required>
                    </div>
                    <div class="form-group">
                        <label for="updateGender">Gender</label>
                        <select class="form-control" name="gender" id="updateGender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="updateAddress">Address</label>
                        <input type="text" class="form-control" name="address" id="updateAddress">
                    </div>
                    <div class="form-group">
                        <label for="updateRiskLevel">Risk Level</label>
                        <select class="form-control" name="risk_level" id="updateRiskLevel" required>
                            <option value="Low">Low</option>
                            <option value="Moderate">Moderate</option>
                            <option value="High">High</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="updateStatus">Status</label>
                        <select class="form-control" name="status" id="updateStatus" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <input type="hidden" name="action" value="Update">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Child</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function populateUpdateForm(id, firstName, lastName, dateOfBirth, gender, address, riskLevel, status) {
        document.getElementById("updateChildId").value = id;
        document.getElementById("updateFirstName").value = firstName;
        document.getElementById("updateLastName").value = lastName;
        document.getElementById("updateDateOfBirth").value = dateOfBirth;
        document.getElementById("updateGender").value = gender;
        document.getElementById("updateAddress").value = address;
        document.getElementById("updateRiskLevel").value = riskLevel;
        document.getElementById("updateStatus").value = status;
    }
</script>

<%@ include file="footer.jsp" %>
