
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<%
ResultSet recentProducts = (ResultSet)getServletContext().getAttribute("recent_products");
ResultSet recentCategories = (ResultSet)getServletContext().getAttribute("recent_categories");

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
              Product Creation
            </h3>
          </div>
          <!-- Content here -->











<div class="row">
    <div class="col-lg-4">
    <div class="card card-primary">

    <div class="card-header">

    <h5>Create a product<h5>

    </div>


    <div class="card-body">

    <form method="post" action="add_product" class="form">

        <div class="form-group">
        <label>Product Name</label>
        <input type="text" name="product_name" required class="form-control" placeholder="Product Name...">
        </div>

        <div class="form-group">
        <label>Product Price</label>
        <input type="number" name="product_price" required class="form-control" placeholder="Product price...">
        </div>


        <div class="form-group">
        <label>Product Category</label>
        <select class="form-control" name="product_category">
         <%if(recentCategories.next()){ do{ %>


         <option value="<%=recentCategories.getString("category_id")%>">
        <%=recentCategories.getString("category_name")%>
        <option>
    

    <% }while(recentCategories.next());} %>

        

        

        </select>

        </div>
        
        <button type="submit" name="create_product" class="btn btn-primary">Add Product</button>
    </form>

    </div>

    

    </div>

    </div>
      





    
    <% if(recentProducts!=null){ %>
    <div class="col-lg-8">
    <div class="card card-primary">

    <div class="card-header">

    <h5>Recently Added Products<h5>

    </div>

    <div class="card-body">


    <table class="table">
    <tr>
        <th>Product Name</th>
        <th>Product Price</th>
        <th>Create Date</th>
        <th>Action</th>
    <tr>

    <%if(recentProducts.next()){ do{ %>
    <tr>
        <td><%=recentProducts.getString("product_name")%></td>
        <td><%=recentProducts.getString("product_price")%></td>
        <td><%=recentProducts.getString("created_at")%></td>
        <td><a href="delete_product?delete_product=true&product_id=<%=recentProducts.getString("product_id")%>"><button class="btn btn-danger">Delete</button></a></td>
   
    <tr>

    <% }while(recentProducts.next());} %>


    </table>

    </div>

    

    </div>

    </div>

<% } %>





















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