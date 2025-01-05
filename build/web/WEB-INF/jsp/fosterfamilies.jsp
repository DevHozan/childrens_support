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
    <div class="card total-foster-families bg-primary">Total Foster Families <br><span>${fosterFamiliesCount}</span></div>
    <div class="card male-foster-families bg-info">Total Capacity <br><span>${fostercapacitysum}</span></div>
    <div class="card female-foster-families bg-success">Total placements <br><span>${fosterplacementssum}</span></div>
    <div class="card weekly-foster-families bg-secondary">This Week's Foster Families <br><span>${fosterFamiliesWeekCount}</span></div>
</div>


    <!-- New Foster Family Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newFosterFamilyModal">+ New Foster Family</button>

 <c:if test="${not empty message}">
<!--    <div class="text-info">${message}</div>-->
</c:if>

    <!-- Foster Family Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Family Name</th>
                    <th>Contact Number</th>
                    <th>Address</th>
                    <th>Capacity</th>
                    <th>Current Placements</th>
                    <th>Background Check Status</th>
                    <th>Training Completed</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="fosterFamily" items="${fosterFamilyRecords}">
                    <tr>
                        <td>${fosterFamily.id}</td>
                        <td>${fosterFamily.family_name}</td>
                        <td>${fosterFamily.contact_number}</td>
                        <td>${fosterFamily.address}</td>
                        <td>${fosterFamily.capacity}</td>
                        <td>${fosterFamily.current_placements}</td>
                        <td>${fosterFamily.background_check_status}</td>
                        <td>${fosterFamily.training_completed == 1 ? 'Yes' : 'No'}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateFosterFamilyModal"
                                    onclick="populateUpdateForm(${fosterFamily.id}, '${fosterFamily.family_name}', '${fosterFamily.contact_number}', 
                                    '${fosterFamily.address}', ${fosterFamily.capacity}, ${fosterFamily.current_placements}, 
                                    '${fosterFamily.background_check_status}', ${fosterFamily.training_completed})">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                                                                                                     <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("role") != "admin") { %>
        <form action="FosterFamilyModel" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="Delete">
                                <input type="hidden" name="id" value="${fosterFamily.id}">
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

<!-- Modal for New Foster Family Form -->
<div class="modal fade" id="newFosterFamilyModal" tabindex="-1" role="dialog" aria-labelledby="newFosterFamilyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newFosterFamilyModalLabel">New Foster Family</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="FosterFamilyModel" method="get">
                    <div class="form-group">
                        <label for="familyName">Family Name</label>
                        <input type="text" class="form-control" name="family_name" id="familyName" required>
                    </div>
                    <div class="form-group">
                        <label for="contactNumber">Contact Number</label>
                        <input type="text" class="form-control" name="contact_number" id="contactNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" name="address" id="address" required>
                    </div>
                    <div class="form-group">
                        <label for="capacity">Capacity</label>
                        <input type="number" class="form-control" name="capacity" id="capacity" required>
                    </div>
                    <div class="form-group">
                        <label for="currentPlacements">Current Placements</label>
                        <input type="number" class="form-control" name="current_placements" id="currentPlacements" required>
                    </div>
                    <div class="form-group">
                        <label for="backgroundCheckStatus">Background Check Status</label>
                        <input type="text" class="form-control" name="background_check_status" id="backgroundCheckStatus" required>
                    </div>
                    <div class="form-group">
                        <label for="trainingCompleted">Training Completed</label>
                        <select class="form-control" name="training_completed" id="trainingCompleted" required>
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    <input type="hidden" name="action" value="Add">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Foster Family</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update Foster Family Form -->
<div class="modal fade" id="updateFosterFamilyModal" tabindex="-1" role="dialog" aria-labelledby="updateFosterFamilyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateFosterFamilyModalLabel">Update Foster Family</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="FosterFamilyModel" method="get">
                    <input type="hidden" name="id" id="updateFosterFamilyId">
                    <div class="form-group">
                        <label for="updateFamilyName">Family Name</label>
                        <input type="text" class="form-control" name="family_name" id="updateFamilyName" required>
                    </div>
                    <div class="form-group">
                        <label for="updateContactNumber">Contact Number</label>
                        <input type="text" class="form-control" name="contact_number" id="updateContactNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="updateAddress">Address</label>
                        <input type="text" class="form-control" name="address" id="updateAddress" required>
                    </div>
                    <div class="form-group">
                        <label for="updateCapacity">Capacity</label>
                        <input type="number" class="form-control" name="capacity" id="updateCapacity" required>
                    </div>
                    <div class="form-group">
                        <label for="updateCurrentPlacements">Current Placements</label>
                        <input type="number" class="form-control" name="current_placements" id="updateCurrentPlacements" required>
                    </div>
                    <div class="form-group">
                        <label for="updateBackgroundCheckStatus">Background Check Status</label>
                        <input type="text" class="form-control" name="background_check_status" id="updateBackgroundCheckStatus" required>
                    </div>
                    <div class="form-group">
                        <label for="updateTrainingCompleted">Training Completed</label>
                        <select class="form-control" name="training_completed" id="updateTrainingCompleted" required>
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    <input type="hidden" name="action" value="Update">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Foster Family</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
function populateUpdateForm(id, familyName, contactNumber, address, capacity, currentPlacements, backgroundCheckStatus, trainingCompleted) {
    document.getElementById("updateFosterFamilyId").value = id;
    document.getElementById("updateFamilyName").value = familyName;
    document.getElementById("updateContactNumber").value = contactNumber;
    document.getElementById("updateAddress").value = address;
    document.getElementById("updateCapacity").value = capacity;
    document.getElementById("updateCurrentPlacements").value = currentPlacements;
    document.getElementById("updateBackgroundCheckStatus").value = backgroundCheckStatus;
    document.getElementById("updateTrainingCompleted").value = trainingCompleted;
}
</script>

<%@ include file="footer.jsp" %>
