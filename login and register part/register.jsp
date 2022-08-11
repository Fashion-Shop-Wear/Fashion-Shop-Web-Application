

<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="./inc/_assets.jsp" />
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
    
      <%-- <jsp:include page="./inc/_sidebar.jsp" /> --%>


<%-- Contents --%>  
<div class="row justify-content-center" style="width:100vw">



<div class="col-lg-4" style="margin:auto" >

<div class="card bg-primary" style="min-height:300px;">

<div class="card-body ">

<div class="heading">

<h1 class="text-center"><i class="fa fa-shopping-cart"></i><h1>
</div>
<div class="heading">

<h3 class="text-center">Create an Account With Us<h3>
</div>
<form method="post" action="handle_register" class="form justify-content-center">

        <div class="form-group">
        <label>Full Name</label>
        <input type="text" name="full_name" required class="form-control" placeholder="Full Name...">
        </div>

        <div class="form-group">
        <label>Email</label>
        <input type="text" name="email" required class="form-control" placeholder="Email...">
        </div>

        <div class="form-group">
        <label>Location</label>
        <input type="text" name="location" required class="form-control" placeholder="Location...">
        </div>

         <div class="form-group">
        <label>Gender</label>
        <select name="gender" class="input-select form-control"> 
            <option value="F">Female<option>
            <option value="M">Male<option>
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

    <div>
    <hr/>
    <p class="text-center">Have an account ? <a href="login">Sign In</a></p>

     <hr/>
    <p class="text-center">Are you Admin ? <a href="login">Sign In</a></p>


    </div>

    

</div>



</div>

   
</div>
</div>

<!-- Content Ends -->








       
       
       
       
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
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












