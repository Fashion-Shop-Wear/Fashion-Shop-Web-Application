<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<%
ResultSet recentAdmin = (ResultSet)getServletContext().getAttribute("recent_admins");
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
              Administrators
            </h3>
          </div>
          <!-- Content here -->

<div class="row">
    <div class="col-lg-5">
    <div class="card card-primary">

    <div class="card-header">

    <h5>New Administrators<h5>

    </div>


    <div class="card-body">

    <form method="post" action="handle_admin_register" class="form justify-content-center">

        <div class="form-group">
        <label>Full Name</label>
        <input type="text" name="full_name" required class="form-control" placeholder="Full Name...">
        </div>

        <div class="form-group">
        <label>Email</label>
        <input type="text" name="email" required class="form-control" placeholder="Email...">
        </div>

       

         <div class="form-group">
        <label>Role</label>
        <select name="role_id" class="input-select form-control"> 
            <option value="F">Admin<option>
            
        </select>
        </div>


        <div class="form-group">
        <label>Password</label>
        <input type="password" name="password2" required class="form-control" placeholder="Create Password...">
        </div>

        <div class="form-group">
        <label>Re-enter Password</label>
        <input type="password" name="password" required class="form-control" placeholder="Confirm Password...">
        </div>

        <button type="submit" name="register" class="btn btn-primary form-control">Register</button>
    </form>
    </div>

    

    </div>

    </div>
      





    


    <% if(recentAdmin!=null){ %>
    <div class="col-lg-7">
    <div class="card card-primary">

    <div class="card-header">

    <h5>Recent Administrators<h5>





  </div>

    <div class="card-body">


    <table class="table table-responsive">
    <tr>
        <th>Category Name</th>
        <th>Production Line</th>
        <th>Category Date</th>
        <th>Action</th>
    <tr>

    <%if(recentAdmin.next()){ do{ %>
    <tr>
        <td><%=recentAdmin.getString("user_full_name")%></td>
        <td><%=recentAdmin.getString("email")%></td>
        <td><%=recentAdmin.getString("created_at")%></td>
         <td><a href="delete_admin?delete=true&admin_id=<%=recentAdmin.getString("user_id")%>"><button class="btn btn-danger">Delete</button></a></td>
   
        
        
    <tr> 

    <% }while(recentAdmin.next());} %>


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