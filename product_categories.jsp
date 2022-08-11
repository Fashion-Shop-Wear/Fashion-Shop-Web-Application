<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<%
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
              Product Category Creation
            </h3>
          </div>
          <!-- Content here -->



<div class="row">
    <div class="col-lg-5">
    <div class="card card-primary">

    <div class="card-header">

    <h5>Product Line Items<h5>

    </div>


    <div class="card-body">

    <form method="post" action="create_category" class="form">

        <div class="form-group">
        <label>Category Name</label>
        <input type="text" name="category_name" required class="form-control" placeholder="Category Name...">
        </div>

        <div class="form-group">
        <label>Production Line</label>
        <select name="production_line_id" class="input-select form-control"> 
            <option value="1">Long Term Production Line<option>
            <option value="2">Midterm Term Production Line<option>
            <option value="3">Short Term Production Line<option>
            </select>
        </div>

         
        <button type="submit" name="create_category" class="btn btn-primary">Save Category Now</button>
    </form>

    </div>

    

    </div>

    </div>
      





    


    <% if(recentCategories!=null){ %>
    <div class="col-lg-7">
    <div class="card card-primary">

    <div class="card-header">

    <h5>Recent Categories<h5>

    </div>

    <div class="card-body">


    <table class="table table-responsive">
    <tr>
        <th>Category Name</th>
        <th>Production Line</th>
        <th>Category Date</th>
        <th>Action</th>
    <tr>

    <%if(recentCategories.next()){ do{ %>
    <tr>
        <td><%=recentCategories.getString("category_name")%></td>
        <td><%=recentCategories.getString("production_line_name")%></td>
        <td><%=recentCategories.getString("category_date")%></td>
        <td><a href="delete_category?delete_category=true&category_id=<%=recentCategories.getString("category_id")%>"><button class="btn btn-danger">Delete</button></a></td>
    <tr>

    <% }while(recentCategories.next());} %>


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