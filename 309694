<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<%
String categories = getServletContext().getAttribute("recent_categories").toString();
String revenue = getServletContext().getAttribute("revenue").toString();
String sales = getServletContext().getAttribute("sales").toString();
String customers = getServletContext().getAttribute("customers").toString();
String  products = getServletContext().getAttribute("products").toString();
String  likes = getServletContext().getAttribute("likes").toString();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="./inc/_assets.jsp" />
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <jsp:include page="./inc/_header.jsp" />
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
    
      <jsp:include page="./inc/_sidebar.jsp" />

      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
             Dashboard
            </h3>
          </div>
          <!-- Content here -->


<div class="row grid-margin">
    <div class="col-12">
      <div class="card card-statistics">
        <div class="card-body">
          <div class="d-flex flex-column flex-md-row align-items-center justify-content-between">
              <div class="statistics-item">
                <p>
                  <i class="icon-sm fa fa-user mr-2"></i>
                  New Customers
                </p>
                <h2><%=customers%></h2>
                <label class="badge badge-outline-success badge-pill">2.7% increase</label>
              </div>
              <div class="statistics-item">
                <p>
                  <i class="icon-sm fas fa-hourglass-half mr-2"></i>
                  Revenue
                </p>
                <h2><%=revenue%></h2>
                <label class="badge badge-outline-danger badge-pill">30% decrease</label>
              </div>
              <div class="statistics-item">
                <p>
                  <i class="icon-sm fas fa-cloud-download-alt mr-2"></i>
                  Production Lines
                </p>
                <h2>3</h2>
                <label class="badge badge-outline-success badge-pill">12% increase</label>
              </div>
              <div class="statistics-item">
                <p>
                  <i class="icon-sm fas fa-check-circle mr-2"></i>
                  Categories
                </p>
               <h2><%=categories%></h2>
                <label class="badge badge-outline-success badge-pill">57% increase</label>
              </div>
              <div class="statistics-item">
                <p>
                  <i class="icon-sm fas fa-chart-line mr-2"></i>
                  Sales
                </p>
               <h2><%=sales%></h2>
                <label class="badge badge-outline-success badge-pill">10% increase</label>
              </div>
              <div class="statistics-item">
                <p>
                  <i class="icon-sm fas fa-circle-notch mr-2"></i>
                  Product Lkes
                </p>
                <h2><%=likes%></h2>
                <label class="badge badge-outline-danger badge-pill">16% decrease</label>
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>




          <!-- Content Ends -->
       
       
       
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <jsp:include page="./inc/_footer.jsp"/>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <jsp:include page="./inc/_scripts.jsp"/>

  <script>


  (function(){


    let longTermInput = document.querySelector(".long-term");
    let midTermInput = document.querySelector(".mid-term");
    let shortTermInput = document.querySelector(".short-term");

   
    longTermInput.addEventListener("input",(ev)=>{
       let value = ev.target.value;


        if(value<0){
            ev.target.value = 0;
            value = 0;
        }

       midTermInput.value = 2*value; 
       shortTermInput.value = 5*2*value; 
    });

  })();


  </script>
  </body>

</html>
