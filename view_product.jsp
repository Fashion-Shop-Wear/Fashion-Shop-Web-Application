

<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%
ResultSet rs = (ResultSet)getServletContext().getAttribute("data_products");
ResultSet cartRs = (ResultSet)getServletContext().getAttribute("cart_items");
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
    
      <%-- <jsp:include page="./inc/_sidebar.jsp" /> --%>

      <!-- partial -->
      <div class="main-panel" style="width:100vw">
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
              Our Products
            </h3>
          </div>
          <!-- Content here -->

  
<div class="row">

    <% 
    if(rs.next()){ do{ %>
  

   <div class="col-lg-3" style="margin-bottom:10px">
    <div class="card card-primary justify-content-center">

    


    <div class="card-body justify-content-center">
    
        <h5><%=rs.getString("product_name")%>(<%=rs.getString("product_price")%>)</h5>

        <div style="min-height:150px" class="bg-default">
               
        </div>

        <hr>


        <% if(session.getAttribute("customer")!=null) { %>
        <a href="add_cart?add_cart=true&product_id=<%=rs.getString("product_id")%>"><button type="submit" name="store_product" class="btn btn-warning">+<i class="fa fa-shopping-cart"></i></button></a>
        <% }else{%>

        <button type="submit" name="store_product" disabled class="btn btn-warning">+<i class="fa fa-shopping-cart"></i></button>
        

        <%}%>
       
        
         <a href="like_product?like_product=true&product_id=<%=rs.getString("product_id")%>"> <button type="submit" name="store_product" class="btn btn-warning"><i class="fa fa-thumbs-up"></i></button></a>

       
    </div>

    

    </div>

    </div>



    <% }while(rs.next());}
 rs.close();
 %>
    
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
  </body>

</html>












