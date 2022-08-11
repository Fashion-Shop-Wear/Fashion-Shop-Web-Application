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









          <jsp:include page="dashboard.jsp"/>




























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
  </body>

</html>









 <% out.println(rs.getString("product_name")); %>
    <% out.println(rs.getString("product_id")); %>
    <a href="like_product?like_product=true&product_id=<%=rs.getString("product_id")%>"><button>like</button></a>
    <a href="add_cart?add_cart=true&product_id=<%=rs.getString("product_id")%>"><button>add to cart</button></a>
 