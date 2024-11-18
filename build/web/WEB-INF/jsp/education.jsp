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
      <div class="container mt-4">
        <!-- Header Section -->
        <div class="d-flex justify-content-between align-items-center mb-4">
          <h3>Education System</h3>
          <div>
            <span class="mr-2">Manager</span>
         
          </div>
        </div>
        
        <!-- Stats Cards -->
        <div class="row">
          <div class="col-md-4">
            <div class="card card-stats p-3 bg-dark">
              <h5>Total Day Attended</h5>
              <p>300</p>
            </div>
          </div>
          <div class="col-md-4 ">
            <div class="card card-stats p-3 bg-dark">
              <h5>Total Day Absent</h5>
              <p>300</p>
            </div>
          </div>
          <div class="col-md-4 ">
            <div class="card card-stats p-3 bg-dark">
              <h5>Absent by Month</h5>
              <p>300</p>
            </div>
          </div>
        </div>
        
        <!-- Academic Progress Table -->
        <div class="card mt-4 p-3">
          <h5>Academic Progress</h5>
          <table class="table table-bordered mt-3">
            <thead>
              <tr>
                <th>Course Name</th>
                <th>Q1</th>
                <th>Q2</th>
                <th>Q3</th>
                <th>Q4</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Math</td>
                <td>B+</td>
                <td>A-</td>
                <td>B</td>
                <td>B+</td>
              </tr>
              <tr>
                <td>English</td>
                <td>B+</td>
                <td>A-</td>
                <td>B</td>
                <td>B+</td>
              </tr>
              <tr>
                <td>Science</td>
                <td>B+</td>
                <td>A-</td>
                <td>B</td>
                <td>B+</td>
              </tr>
              <tr>
                <td>Social Study</td>
                <td>B+</td>
                <td>A-</td>
                <td>B</td>
                <td>B+</td>
              </tr>
            </tbody>
          </table>
        </div>
        
        <!-- Behavioral Indicators Table -->
        <div class="card mt-4 p-3">
          <h5>Behavioral Indicators</h5>
          <table class="table table-bordered mt-3">
            <thead>
              <tr>
                <th>Date</th>
                <th>Description</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>January 15, 2024</td>
                <td>Disruptive behavior in class, talked back to teacher.</td>
              </tr>
              <tr>
                <td>January 16, 2024</td>
                <td>Disruptive behavior in class, talked back to teacher.</td>
              </tr>
              <tr>
                <td>January 17, 2024</td>
                <td>Disruptive behavior in class, talked back to teacher.</td>
              </tr>
            </tbody>
          </table>
        </div>
        
        <!-- Image Section -->
        <div class="d-flex justify-content-center mt-4">
          <img src="child-photo.jpg" alt="Child" class="img-fluid rounded" style="max-width: 400px;">
        </div>
      </div>
    </div>
  </div>
<%@ include file="footer.jsp" %>
