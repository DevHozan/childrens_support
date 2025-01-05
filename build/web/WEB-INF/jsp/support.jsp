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
        <div class="card total-cases">Total Support Requests <br><span>${totalSupportRequests}</span></div>
        <div class="card male-cases">Open Support Requests <br><span>${RequestopenedCount}</span></div>
        <div class="card female-cases">Closed Support Requests <br><span>${RequestclosedCount}</span></div>
        <div class="card weekly-cases">This Week <br><span>${SupportCountWeek}</span></div>
    </div>

    <!-- New Support Request Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newSupportRequestModal">+ New Support Request</button>
    
<!--   <c:if test="${not empty message}">
    <div class="text-info">${message}</div>
</c:if>
-->


    <!-- Support Request Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Date of Birth</th>
                    <th>Phone Number</th>
                    <th>Email Address</th>
                    <th>Preferred Communication</th>
                    <th>Location</th>
                    <th>Medical History</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Created At</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="request" items="${supportRequestRecords}">
                    <tr>
                        <td>${request.id}</td>
                        <td>${request.first_name}</td>
                        <td>${request.last_name}</td>
                        <td>${request.date_of_birth}</td>
                        <td>${request.phone_number}</td>
                        <td>${request.email_address}</td>
                        <td>${request.preferred_communication}</td>
                        <td>${request.location}</td>
                        <td>${request.medical_history}</td>
                        <td>${request.description}</td>
                        <td>${request.status}</td>
                        <td>${request.created_at}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateSupportRequestModal" 
                                    onclick="populateUpdateForm(${request.id}, '${request.first_name}', '${request.last_name}', '${request.date_of_birth}', '${request.phone_number}', '${request.email_address}', '${request.preferred_communication}', '${request.location}', '${request.medical_history}', '${request.description}')">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                                                                                                                                                                                                                  <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("role") != "admin") { %>
      <form action="SupportRequestsModel" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="Delete">
                                <input type="hidden" name="id" value="${request.id}">
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
                <form action="SupportRequestsModel" method="GET">
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
                        <label for="phoneNumber">Phone Number</label>
                        <input type="tel" class="form-control" name="phone_number" id="phoneNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="emailAddress">Email Address</label>
                        <input type="email" class="form-control" name="email_address" id="emailAddress" required>
                    </div>
                    <div class="form-group">
                        <label for="preferredCommunication">Preferred Communication</label>
                        <input type="text" class="form-control" name="preferred_communication" id="preferredCommunication" required>
                    </div>
                    <div class="form-group">
                        <label for="location">Location</label>
                        <input type="text" class="form-control" name="location" id="location" required>
                    </div>
                    <div class="form-group">
                        <label for="medicalHistory">Medical History</label>
                        <textarea class="form-control" name="medical_history" id="medicalHistory"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" name="description" id="description" required></textarea>
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
                <form action="SupportRequestsModel" method="GET">
                    <input type="hidden" name="id" id="updateRequestId">
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
                        <label for="updatePhoneNumber">Phone Number</label>
                        <input type="tel" class="form-control" name="phone_number" id="updatePhoneNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="updateEmailAddress">Email Address</label>
                        <input type="email" class="form-control" name="email_address" id="updateEmailAddress" required>
                    </div>
                    <div class="form-group">
                        <label for="updatePreferredCommunication">Preferred Communication</label>
                        <input type="text" class="form-control" name="preferred_communication" id="updatePreferredCommunication" required>
                    </div>
                    <div class="form-group">
                        <label for="updateLocation">Location</label>
                        <input type="text" class="form-control" name="location" id="updateLocation" required>
                    </div>
                    <div class="form-group">
                        <label for="updateMedicalHistory">Medical History</label>
                        <textarea class="form-control" name="medical_history" id="updateMedicalHistory"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="updateDescription">Description</label>
                        <textarea class="form-control" name="description" id="updateDescription" required></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="status">status</label>
                        <select name="status" id="status" class="form-control">
                            <option>Open</option>
                            <option>Closed</option>
                            <option>Pending</option>
                        </select>
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
    function populateUpdateForm(id, firstName, lastName, dateOfBirth, phoneNumber, emailAddress, preferredCommunication, location, medicalHistory, description) {
        document.getElementById('updateRequestId').value = id;
        document.getElementById('updateFirstName').value = firstName;
        document.getElementById('updateLastName').value = lastName;
        document.getElementById('updateDateOfBirth').value = dateOfBirth;
        document.getElementById('updatePhoneNumber').value = phoneNumber;
        document.getElementById('updateEmailAddress').value = emailAddress;
        document.getElementById('updatePreferredCommunication').value = preferredCommunication;
        document.getElementById('updateLocation').value = location;
        document.getElementById('updateMedicalHistory').value = medicalHistory;
        document.getElementById('updateDescription').value = description;
    }
</script>

<%@ include file="footer.jsp" %>
