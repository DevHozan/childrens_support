<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main-content">
    <!-- Summary Cards -->
    <div class="summary-cards">
        <div class="card total-reports">Total Reports <br><span>${totalReports}</span></div>
        <div class="card resolved-reports">Resolved <br><span>${resolvedReports}</span></div>
        <div class="card pending-reports">Pending <br><span>${pendingReports}</span></div>
        <div class="card weekly-reports">This Week <br><span>${weeklyReports}</span></div>
    </div>

    <!-- New Report Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newReportModal">+ New Report</button>

    <!-- Abuse Reports Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Report ID</th>
                    <th>Child Name</th>
                    <th>Date of Report</th>
                    <th>Status</th>
                    <th>Last Update</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="report" items="${reportRecords}">
                    <tr>
                        <td>${report.report_id}</td>
                        <td>${report.child_name}</td>
                        <td>${report.date_of_report}</td>
                        <td>${report.status}</td>
                        <td>${report.last_update}</td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateReportModal" 
                                    onclick="populateUpdateForm(${report.report_id}, '${report.child_name}', '${report.date_of_report}', '${report.status}')">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                            <form action="AbuseReportModel" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="Delete">
                                <input type="hidden" name="report_id" value="${report.report_id}">
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

<!-- Modal for New Report -->
<div class="modal fade" id="newReportModal" tabindex="-1" role="dialog" aria-labelledby="newReportModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newReportModalLabel">New Abuse Report</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="AbuseReportModel" method="get">
                    <div class="form-group">
                        <label for="childName">Child Name</label>
                        <input type="text" class="form-control" name="child_name" id="childName" required>
                    </div>
                    <div class="form-group">
                        <label for="dateOfReport">Date of Report</label>
                        <input type="date" class="form-control" name="date_of_report" id="dateOfReport" required>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <input type="text" class="form-control" name="status" id="status" required>
                    </div>
                    <input type="hidden" name="action" value="Add">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update Report -->
<div class="modal fade" id="updateReportModal" tabindex="-1" role="dialog" aria-labelledby="updateReportModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateReportModalLabel">Update Report</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="AbuseReportModel" method="post">
                    <input type="hidden" name="report_id" id="updateReportId">
                    <div class="form-group">
                        <label for="updateChildName">Child Name</label>
                        <input type="text" class="form-control" name="child_name" id="updateChildName" required>
                    </div>
                    <div class="form-group">
                        <label for="updateDateOfReport">Date of Report</label>
                        <input type="date" class="form-control" name="date_of_report" id="updateDateOfReport" required>
                    </div>
                    <div class="form-group">
                        <label for="updateStatus">Status</label>
                        <input type="text" class="form-control" name="status" id="updateStatus" required>
                    </div>
                    <input type="hidden" name="action" value="Update">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function populateUpdateForm(reportId, childName, dateOfReport, status) {
        document.getElementById("updateReportId").value = reportId;
        document.getElementById("updateChildName").value = childName;
        document.getElementById("updateDateOfReport").value = dateOfReport;
        document.getElementById("updateStatus").value = status;
    }
</script>
