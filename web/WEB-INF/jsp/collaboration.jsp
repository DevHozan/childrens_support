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
            <!-- Main Content -->
            <div class="col-md-10">
                <div class="d-flex justify-content-between align-items-center border-bottom py-3">
                    <h4>Multi-Agency Collaboration</h4>
                    <div>
                        <span>Manager</span>
                        <img src="https://www.lanari.rw/hozana/assets/img/images/hozana.png" alt="Manager" class="rounded-circle ms-2" style="width: 30px; height: 30px;">
                    </div>
                </div>

                <!-- Table -->
                <div class="table-responsive mt-4">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Agency Name</th>
                                <th>Contact Person</th>
                                <th>Role</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Shared Cases</th>
                                <th>Involved Agencies</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Springfield Social Service</td>
                                <td>Contact</td>
                                <td>Social Worker</td>
                                <td>0789658501</td>
                                <td>tyler.anderson@yahoo.com</td>
                                <td>001</td>
                                <td>Social Services, Health Dept.</td>
                                <td>Active</td>
                            </tr>
                            <tr>
                                <td>Springfield Social Service</td>
                                <td>Contact</td>
                                <td>Social Worker</td>
                                <td>0789658501</td>
                                <td>tyler.anderson@yahoo.com</td>
                                <td>001</td>
                                <td>Social Services, Health Dept.</td>
                                <td>Active</td>
                            </tr>
                            <tr>
                                <td>Springfield Social Service</td>
                                <td>Contact</td>
                                <td>Social Worker</td>
                                <td>0789658501</td>
                                <td>tyler.anderson@yahoo.com</td>
                                <td>001</td>
                                <td>Social Services, Health Dept.</td>
                                <td>Active</td>
                            </tr>
                            <tr>
                                <td>Springfield Social Service</td>
                                <td>Contact</td>
                                <td>Social Worker</td>
                                <td>0789658501</td>
                                <td>tyler.anderson@yahoo.com</td>
                                <td>001</td>
                                <td>Social Services, Health Dept.</td>
                                <td>Active</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Communication Log -->
                <div class="mt-5">
                    <h5>Communication Log</h5>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Case ID</th>
                                    <th>Participants</th>
                                    <th>Discussion Point</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2024-01-15</td>
                                    <td>001</td>
                                    <td>Sarah Smith, Dr. Robert Johnson</td>
                                    <td>Initial case assessment, medical evaluation schedule, initial findings discussed.</td>
                                </tr>
                                <tr>
                                    <td>2024-01-15</td>
                                    <td>001</td>
                                    <td>Sarah Smith, Dr. Robert Johnson</td>
                                    <td>Initial case assessment, medical evaluation schedule, initial findings discussed.</td>
                                </tr>
                                <tr>
                                    <td>2024-01-15</td>
                                    <td>001</td>
                                    <td>Sarah Smith, Dr. Robert Johnson</td>
                                    <td>Initial case assessment, medical evaluation schedule, initial findings discussed.</td>
                                </tr>
                                <tr>
                                    <td>2024-01-15</td>
                                    <td>001</td>
                                    <td>Sarah Smith, Dr. Robert Johnson</td>
                                    <td>Initial case assessment, medical evaluation schedule, initial findings discussed.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Team Collaboration Image -->
                <div class="d-flex justify-content-center mt-4">
                    <img src="${pageContext.request.contextPath}/images/collaboration.jpeg" alt="Team Collaboration" class="img-fluid" style="max-width: 400px;">
                </div>
            </div>
</div>
  <%@ include file="footer.jsp" %>
