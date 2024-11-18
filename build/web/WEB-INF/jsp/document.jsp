<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main-content">
    <!-- Summary Cards -->
    <div class="summary-cards">
        <div class="card total-documents">Total Documents <br><span>300</span></div>
        <div class="card public-documents">Public Documents <br><span>150</span></div>
        <div class="card private-documents">Private Documents <br><span>100</span></div>
        <div class="card restricted-documents">Restricted Documents <br><span>50</span></div>
    </div>

    <!-- New Document Button -->
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newDocumentModal">+ New Document</button>

    <!-- Documents Table -->
    <div class="table-container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Document Type</th>
                    <th>Description</th>
                    <th>Access Level</th>
                    <th>Last Modified</th>
                    <th>Document</th>
                    <th>Edit</th>
                    <th>Delete</th>
                    <th>Share</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="document" items="${documentRecords}">
                    <tr>
                        <td>${document.document_type}</td>
                        <td>${document.description}</td>
                        <td>${document.access_level}</td>
                        <td>${document.last_modified}</td>
                        <td><a href="${document.document}" target="_blank">View Document</a></td>
                        <td>
                            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateDocumentModal" 
                                    onclick="populateUpdateForm(${document.document_id}, '${document.document_type}', '${document.description}', '${document.access_level}', '${document.document}')">
                                <i class="fas fa-pen"></i>
                            </button>
                        </td>
                        <td>
                            <form action="DocumentModel" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="Delete">
                                <input type="hidden" name="document_id" value="${document.document_id}">
                                <button class="btn btn-danger btn-sm" type="submit">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </td>
                        <td><i class="fas fa-share-alt"></i></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal for New Document Form -->
<div class="modal fade" id="newDocumentModal" tabindex="-1" role="dialog" aria-labelledby="newDocumentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newDocumentModalLabel">New Document</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="DocumentModel" method="get" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="documentType">Document Type</label>
                        <input type="text" class="form-control" name="documentType" id="documentType" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" name="description" id="description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="accessLevel">Access Level</label>
                        <select class="form-control" name="accessLevel" id="accessLevel" required>
                            <option value="Public">Public</option>
                            <option value="Private">Private</option>
                            <option value="Restricted">Restricted</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="filePath">Document File</label>
                        <input type="file" class="form-control" name="document" id="filePath" required>
                    </div>
                    <input type="hidden" name="action" value="Add">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Document</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Update Document Form -->
<div class="modal fade" id="updateDocumentModal" tabindex="-1" role="dialog" aria-labelledby="updateDocumentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateDocumentModalLabel">Update Document</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="DocumentModel" method="get" enctype="multipart/form-data">
                    <input type="hidden" name="document_id" id="updateDocumentId">
                    <div class="form-group">
                        <label for="updateDocumentType">Document Type</label>
                        <input type="text" class="form-control" name="documentType" id="updateDocumentType" required>
                    </div>
                    <div class="form-group">
                        <label for="updateDescription">Description</label>
                        <textarea class="form-control" name="description" id="updateDescription" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="updateAccessLevel">Access Level</label>
                        <select class="form-control" name="accessLevel" id="updateAccessLevel" required>
                            <option value="Public">Public</option>
                            <option value="Private">Private</option>
                            <option value="Restricted">Restricted</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="updateFilePath">Document File (Optional)</label>
                        <input type="file" class="form-control" name="document" id="updateFilePath">
                    </div>
                    <input type="hidden" name="action" value="Update">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Document</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function populateUpdateForm(documentId, documentType, description, accessLevel, filePath) {
        document.getElementById("updateDocumentId").value = documentId;
        document.getElementById("updateDocumentType").value = documentType;
        document.getElementById("updateDescription").value = description;
        document.getElementById("updateAccessLevel").value = accessLevel;
        document.getElementById("updateFilePath").value = filePath;
    }
</script>
