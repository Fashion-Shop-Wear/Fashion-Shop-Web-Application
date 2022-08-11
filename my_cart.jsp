
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<%
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

    <div class="col-lg-8">

    <div class="card">

    <div class="card-header">

    <h4>My Cart Items</h4>

    </div>

    <div>

    <div class="card-body">

    <table class="table table-striped table-hover">

    <thead>

    <tr>

    <th>Product Count</th>
    <th>Product Name</th>
    <th>Product Quantity</th>
    <th>Product Cost</th>
    <th>Remove</th>

    </tr>

   </thead>


   <tbody>


    <% 
    int count =0; 
    String cartId = "";
    float totalBill = 0;
    
    %>
    <% if(cartRs.next()){ do{%>
    <% count++; %>

    <% cartId = cartRs.getString("cart_id"); %>
    <tr>
    <th><%=count%></th>
    <th><%=cartRs.getString("product_name")%></th>
    <th><%=cartRs.getString("product_quantity")%></th>
    <th><%=cartRs.getString("product_price")%></th>
    <th><a href="delete_cart_item?delete=true&cart_id=<%=cartRs.getString("cart_id")%>&product_id=<%=cartRs.getString("product_id")%>"> <button class="btn btn-danger">Remove</button></a></th>
    <% 
    totalBill+=Float.parseFloat(cartRs.getString("product_price").toString());
    %>
    </tr>

    

    <% }while(cartRs.next()); cartRs.close();} %>

   <tbody>

   <tfoot>

    <tr>

    <th>Product Count</th>
    <th>Product Name</th>
    <th>Product Quantity</th>
    <th>Product Cost</th>
    <th>Remove</th>

    </tr>

   </tfoot>

    


    </table>

    </div>

    </div>



    </div>

    </div>





    <%-- checkout --%>




    <div class="col-lg-4">

    <div class="card">

    <div class="card-header">

    <h4>Checkout</h4>

    </div>

    <div>

    <div class="card-body">

    <table class="table  table-hover">

    <thead>

    <tr>

    <th>Item Count</th>
    <th>Total</th>
    
    <th>Checkout</th>

    </tr>

   </thead>

    <tr>
    <th><%=count%></th>
    <th><%=totalBill%></th>
    <% if(count>0) {%>
    <th><a href="checkout?checkout=true&cart_id=<%=cartId%>"> <button class="btn btn-success">Checkout</button></a></th>
    <%}else{%>
      <th><a href="get_items"><button class="btn btn-success">Back to Shop</button></a></th>
    
    <% } %>
    </tr>



   <tbody>

   <tfoot>

    <tr>

    <th>Item Count</th>
    <th>Total</th>
    
    <th>Checkout</th>

    </tr>

   </tfoot>

    </table>

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
  </body>

</html>












