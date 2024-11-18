<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main-content">

  <!-- Main Content -->
  <div class="container-fluid main-section">
    <div class="text-center">
      <img src="${pageContext.request.contextPath}/images/s1.png" alt="Child Advocacy Center Logo" style="max-height: 100px;">
      <h1 class="my-3">Child Advocacy Portal</h1>
      <p class="text-muted">A Place of Healing & Hope</p>
    </div>

    <div class="row mt-5">
      <!-- Programs & Services Card -->
      <div class="col-md-3">
        <div class="card text-white">
          <img src="${pageContext.request.contextPath}/images/s2.png" class="card-img" alt="Programs Image">
          <div class="card-img-overlay d-flex justify-content-center align-items-center">
            <div>
              <h5 class="card-title">Programs & Services</h5>
              <p class="card-text">Our programs are designed to further our mission and provide much-needed services for our constituents.</p>
              <a href="#" class="btn btn-danger">Take a look</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Events Card -->
      <div class="col-md-3">
        <div class="card text-white">
          <img src="${pageContext.request.contextPath}/images/s3.png" class="card-img" alt="Events Image">
          <div class="card-img-overlay d-flex justify-content-center align-items-center">
            <div>
              <h5 class="card-title">Events</h5>
              <p class="card-text">Fundraisers and events help us raise awareness and generate crucial resources to serve our community.</p>
              <a href="#" class="btn btn-danger">Find out more</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Volunteer Card -->
      <div class="col-md-3">
        <div class="card text-white">
          <img src="${pageContext.request.contextPath}/images/s4.png" class="card-img" alt="Volunteer Image">
          <div class="card-img-overlay d-flex justify-content-center align-items-center">
            <div>
              <h5 class="card-title">Volunteer</h5>
              <p class="card-text">Improve your community by joining our cause and make a big difference with a small effort.</p>
              <a href="#" class="btn btn-danger">Read more</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Prevention Training Card -->
      <div class="col-md-3">
        <div class="card text-white">
          <img src="${pageContext.request.contextPath}/images/s3.png" class="card-img" alt="Prevention Training Image">
          <div class="card-img-overlay d-flex justify-content-center align-items-center">
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
</div>


<%@ include file="footer.jsp" %>