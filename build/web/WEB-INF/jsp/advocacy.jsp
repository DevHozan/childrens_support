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
  <div class="container-fluid main-section">
    <div class="text-center">
      <img src="${pageContext.request.contextPath}/images/advocacy.avif" alt="Child Advocacy Center Logo" style="max-height: 100px;">
      <h1 class="my-3">Child Advocacy Portal</h1>
      <p class="text-muted">A Place of Healing & Hope</p>
    </div>

    <div class="row mt-5">
      <!-- Programs & Services Card -->
      <div class="col-md-3">
        <div class="card text-white">
          <img src="${pageContext.request.contextPath}/images/program.avif" class="card-img" alt="Programs Image">
          <div class="card-img-overlay d-flex justify-content-center align-items-center">
            
          </div>
          <div>
              <h5 class="card-title text-dark">Programs & Services</h5>
              <p class="card-text text-dark">Our programs are designed to further our mission and provide much-needed services for our constituents.</p>
              <a href="#" class="btn btn-danger">Take a look</a>
            </div>
        </div>
      </div>

      <!-- Events Card -->
      <div class="col-md-3">
        <div class="card text-white">
          <img src="${pageContext.request.contextPath}/images/events.avif" class="card-img" alt="Events Image">
          <div class="card-img-overlay d-flex justify-content-center align-items-center">
            
          </div>
          <div>
              <h5 class="card-title text-dark">Events</h5>
              <p class="card-text text-dark">Fundraisers and events help us raise awareness and generate crucial resources to serve our community.</p>
              <a href="#" class="btn btn-danger">Find out more</a>
            </div>
        </div>
      </div>

      <!-- Volunteer Card -->
      <div class="col-md-3">
        <div class="card text-white">
          <img src="${pageContext.request.contextPath}/images/volunteer.avif" class="card-img" alt="Volunteer Image">
          <div class="card-img-overlay d-flex justify-content-center align-items-center">

          </div>
                      <div>
              <h5 class="card-title text-dark">Volunteer</h5>
              <p class="card-text text-dark">Improve your community by joining our cause and make a big difference with a small effort.</p>
              <a href="#" class="btn btn-danger">Read more</a>
            </div>
        </div>
      </div>

      <!-- Prevention Training Card -->
      <div class="col-md-3">
        <div class="card text-white text-dark">
          <img src="${pageContext.request.contextPath}/images/trainn.avif" class="card-img" alt="Prevention Training Image">
          <div class="card-img-overlay d-flex justify-content-center align-items-center">

          </div>
                      <div>
              <h5 class="card-title">Prevention Training</h5>
              <p class="card-text">We offer workshops for parents, residents, and professionals on how to respond to and prevent child abuse.</p>
              <a href="#" class="btn btn-danger">Read more</a>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>


<%@ include file="footer.jsp" %>