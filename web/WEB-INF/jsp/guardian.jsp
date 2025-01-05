
  

<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                 <%
    // Check if the session attribute 'id' exists
    if (session.getAttribute("id") == null) {
        // Redirect to the login page if not logged in
        response.sendRedirect("login.htm");
        return; // Stop further processing of the current page
    }
%>

  <style>
        .card img {
            height: 150px;
            object-fit: cover;
        }
        .card-title {
            font-size: 1.1rem;
        }
        .btn-custom {
            background-color: #0069D9;
            color: white;
        }
    </style>

<div class="main-content">
            <!-- Main Content -->
            <div class="col-md-10">
                <div class="d-flex justify-content-between align-items-center border-bottom py-3">
                    <h4>Guardian and Caregiver Support</h4>
                    <div>
                        <span>Manager</span>
                        <img src="${pageContext.request.contextPath}/images/4.png" alt="Manager" class="rounded-circle ms-2" style="width: 30px; height: 30px;">
                    </div>
                </div>

                <!-- Cards Section -->
                <div class="row mt-4">
                    <!-- Card 1 -->
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                          <img src="${pageContext.request.contextPath}/images/traini.jpg" alt="Training Modules" class="card-img-top">
                                 <div class="card-body">
                                <h5 class="card-title text-dark">Training Modules</h5>
                                <p class="card-text text-dark">Interactive modules covering various parenting skills, child development, and communication strategies.</p>
                                <a href="#" class="btn btn-link">Learn more</a>
                                <button class="btn btn-custom float-end">Get It</button>
                            </div>
                        </div>
                    </div>
                    <!-- Card 2 -->
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <img src="${pageContext.request.contextPath}/images/consel.jpg" alt="Counseling Services" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title text-dark">Counseling Services</h5>
                                <p class="card-text text-dark">Family therapy and support groups are available for guardians needing guidance or advice.</p>
                                <a href="#" class="btn btn-link">Learn more</a>
                                <button class="btn btn-custom float-end">Get It</button>
                            </div>
                        </div>
                    </div>
                    <!-- Card 3 -->
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <img src="${pageContext.request.contextPath}/images/lib.png" alt="Resource Library" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title text-dark">Resource Library</h5>
                                <p class="card-text text-dark">Curated collection of articles, guides, and books on parenting and child development.</p>
                                <a href="#" class="btn btn-link">Learn more</a>
                                <button class="btn btn-custom float-end">Get It</button>
                            </div>
                        </div>
                    </div>
                    <!-- Card 4 -->
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <img src="${pageContext.request.contextPath}/images/work.jpg" alt="Events and Workshops" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title text-dark">Events and Workshops</h5>
                                <p class="card-text text-dark">Announcements and calendars of upcoming events, workshops, webinars, and parenting classes.</p>
                                <a href="#" class="btn btn-link">Learn more</a>
                                <button class="btn btn-custom float-end">Get It</button>
                            </div>
                        </div>
                    </div>
                    <!-- Card 5 -->
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <img src="${pageContext.request.contextPath}/images/feed.png" alt="Feedback and Support" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title text-dark">Feedback and Support</h5>
                                <p class="card-text text-dark">Mechanisms for users to provide input, suggestions, and testimonials about their experiences.</p>
                                <a href="#" class="btn btn-link">Learn more</a>
                                <button class="btn btn-custom float-end">Get It</button>
                            </div>
                        </div>
                    </div>
                    <!-- Card 6 -->
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm">
                            <img src="${pageContext.request.contextPath}/images/community.jpg" alt="Community Forum" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title text-dark">Community Forum</h5>
                                <p class="card-text text-dark">Moderated online forum for guardians to connect, share experiences, and seek advice.</p>
                                <a href="#" class="btn btn-link">Learn more</a>
                                <button class="btn btn-custom float-end">Get It</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="footer.jsp" %>