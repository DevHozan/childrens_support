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
            <div class="card total-cases">Total Cases <br><span>300</span></div>
            <div class="card male-cases">Male Cases <br><span>200</span></div>
            <div class="card female-cases">Female Cases <br><span>100</span></div>
            <div class="card weekly-cases">This Week <br><span>25</span></div>
        </div>

    <!-- New User Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newUserModal">+ New User</button>

    <!-- User Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Created At</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userRecords}">
                    <tr>
                        <td>${user.user_id}</td>
                        <td>${user.username}</td>
                        <td>${user.role}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>${user.created_at}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateUserModal" 
                                    onclick="populateUpdateForm(${user.user_id}, '${user.username}', '${user.role}', '${user.email}', '${user.phone}')">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                                                                                                                                                                                                                                              <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("role") != "admin") { %>
      <form action="UsersModel" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="Delete">
                                <input type="hidden" name="user_id" value="${user.user_id}">
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

<!-- Modal for New User Form -->
<div class="modal fade" id="newUserModal" tabindex="-1" role="dialog" aria-labelledby="newUserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newUserModalLabel">New User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="UsersModel" method="GET">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" name="username" id="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="password" id="password" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <input type="text" class="form-control" name="role" id="role" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" class="form-control" name="phone" id="phone" required>
                    </div>
                    <input type="hidden" name="action" value="Add">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update User Form -->
<div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="updateUserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateUserModalLabel">Update User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="UsersModel" method="get">
                    <input type="hidden" name="user_id" id="updateUserId">
                    <div class="form-group">
                        <label for="updateUsername">Username</label>
                        <input type="text" class="form-control" name="username" id="updateUsername" required>
                    </div>
                    <div class="form-group">
                        <label for="updateRole">Role</label>
                        <input type="text" class="form-control" name="role" id="updateRole" required>
                    </div>
                    <div class="form-group">
                        <label for="updateEmail">Email</label>
                        <input type="email" class="form-control" name="email" id="updateEmail" required>
                    </div>
                    <div class="form-group">
                        <label for="updatePhone">Phone</label>
                        <input type="tel" class="form-control" name="phone" id="updatePhone" required>
                    </div>
                    <input type="hidden" name="action" value="Update">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function populateUpdateForm(userId, username, role, email, phone) {
        document.getElementById("updateUserId").value = userId;
        document.getElementById("updateUsername").value = username;
        document.getElementById("updateRole").value = role;
        document.getElementById("updateEmail").value = email;
        document.getElementById("updatePhone").value = phone;
    }
</script>
