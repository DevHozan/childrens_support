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
    <div class="container my-4">
        <!-- Header Row -->
        <div class="row g-4">
            <!-- Sidebar -->
            <div class="col-md-4">
                <div class="card p-3">
                    <h5 class="card-title">Emergency Contact Numbers</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Agency</th>
                                <th>Contact</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Police</td>
                                <td>112</td>
                            </tr>
                            <tr>
                                <td>Ambulance</td>
                                <td>912</td>
                            </tr>
                            <tr>
                                <td>Fire</td>
                                <td>118</td>
                            </tr>
                            <tr>
                                <td>Child Helpline (Bang)</td>
                                <td>1098</td>
                            </tr>
                            <tr>
                                <td>Domestic Violence</td>
                                <td>3250</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Main Content -->
            <div class="col-md-8">
<!--                <img src="emergency-response.jpg" alt="Emergency Response" class="img-fluid emergency-header">-->
            </div>
        </div>

        <!-- Risk Assessment Table -->
        <div class="row g-4 mt-4">
            <div class="col-12">
                <div class="card p-3">
                    <h5 class="card-title">Risk Assessment Tool Table</h5>
                    <table class="table table-bordered risk-table">
                        <thead>
                            <tr>
                                <th class="text-center">Check</th>
                                <th>Risk Factor</th>
                                <th>Assessment Criteria</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center table-check"><input type="checkbox"></td>
                                <td>Physical Abuse</td>
                                <td>Observable signs of physical injury or unexplained bruises.</td>
                            </tr>
                            <tr>
                                <td class="text-center table-check"><input type="checkbox"></td>
                                <td>Neglect</td>
                                <td>Lack of adequate food, shelter, clothing, or medical care.</td>
                            </tr>
                            <tr>
                                <td class="text-center table-check"><input type="checkbox"></td>
                                <td>Emotional Abuse</td>
                                <td>Behavioral indicators such as withdrawal, anxiety, or depression.</td>
                            </tr>
                            <tr>
                                <td class="text-center table-check"><input type="checkbox"></td>
                                <td>Sexual Abuse</td>
                                <td>Signs of sexual trauma, inappropriate sexual behavior, or disclosures.</td>
                            </tr>
                            <tr>
                                <td class="text-center table-check"><input type="checkbox"></td>
                                <td>Environmental Risk</td>
                                <td>Exposure to hazardous living conditions, substance abuse, or domestic violence.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
 
<%@ include file="footer.jsp" %>
