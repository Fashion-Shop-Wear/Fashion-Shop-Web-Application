<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<%
ResultSet categories = (ResultSet)getServletContext().getAttribute("recent_categories");
String revenue = getServletContext().getAttribute("revenue").toString();
ResultSet sales = (ResultSet)getServletContext().getAttribute("sales");
ResultSet customers = (ResultSet)getServletContext().getAttribute("customers");
ResultSet products = (ResultSet)getServletContext().getAttribute("products");
ResultSet likes = (ResultSet)getServletContext().getAttribute("likes");
ResultSet femaleSales = (ResultSet)getServletContext().getAttribute("female_sales");
ResultSet maleSales = (ResultSet)getServletContext().getAttribute("male_sales");
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
             Statistics
            </h3>
          </div>
          <!-- Content here -->


<div class="row">

<%

float longTermTotal = 0;
float shortTermTotal = 0;
float midTermTotal = 0;

%>


<% if(femaleSales!=null){ %>
    <div class="col-lg-6">
    <div class="card card-primary">

    <div class="card-header">

    <h5>Female Sales<h5>

    </div>

    <div class="card-body">

    <div>
    <button class="btn btn-success print-btn float-right">Print <i class="fa fa-print"> </i></button>
    </div>

    <table class="table">
    <tr>
        <th>Production Line</th>
        <th>Product Cash</th>
        <th>Sale Date</th>
    <tr>
    <% float femaleTotal = 0; %>
    <%if(femaleSales.next()){ do{ %>

    <tr>
        <td><%=femaleSales.getString("production_line_name")%></td>
        <td><%=femaleSales.getString("product_price")%></td>
        <td><%=femaleSales.getString("sale_date")%></td>
    <tr>

    <%
    int production_line_id = Integer.parseInt(femaleSales.getString("production_line_id"));
    switch(production_line_id){
        case(1):longTermTotal+=femaleSales.getFloat("product_price");break;
        case(2):midTermTotal+=femaleSales.getFloat("product_price");break;
        case(3):shortTermTotal+=femaleSales.getFloat("product_price");break;
    }

     femaleTotal += femaleSales.getFloat("product_price");


    %>

    <% }while(femaleSales.next());} %>

    <tr>
    <th>Total Female Sales</th>  <th><%=femaleTotal%></th>
    <tr>
    </table>

    </div>

    

    </div>

    </div>

<% }else out.println("null"); %>
    

<% if(maleSales!=null){ %>
    <div class="col-lg-6">
    <div class="card card-primary">

    <div class="card-header">

    <div>
    <h5>Male Sales<h5>
    </div>

    </div>

    <div class="card-body">

    <div>
    <button class="btn btn-success print-btn float-right">Print <i class="fa fa-print"> </i></button>
    </div>
    <table class="table">
    <tr>
        <th>Production Line</th>
        <th>Product Cash</th>
        <th>Sale Date</th>
    <tr>
    <% float maleTotal = 0;  %>
    <%if(maleSales.next()){ do{ %>
    <tr>
        <td><%=maleSales.getString("production_line_name")%></td>
        <td><%=maleSales.getString("product_price")%></td>
        <td><%=maleSales.getString("sale_date")%></td>
    <tr>


    <%
    int production_line_id = Integer.parseInt(femaleSales.getString("production_line_id"));
    switch(production_line_id){
        case(1):longTermTotal+=maleSales.getFloat("product_price");break;
        case(2):midTermTotal+=maleSales.getFloat("product_price");break;
        case(3):shortTermTotal+=maleSales.getFloat("product_price");break;
    }

    maleTotal +=maleSales.getFloat("product_price");

    %>

    <% }while(maleSales.next());} %>

    <tr>
    <th>Total Male Sales</th>  <th><%=maleTotal%></th>
    <tr>
    </table>

    </div>


    </div>

    </div>

<% } %>




</div>


<br>
<div class="row">

<div class="col-md-4">

    <div class="card" style="min-height:200px">

    <div class="card-body">

    <h1>(UGX)<%=longTermTotal %></h1>
    <p>Long Term Total Sales</p>

    </div>
    </div>

</div>



<div class="col-md-4">

    <div class="card" style="min-height:200px">

    <div class="card-body">

    <h1>(UGX)<%=midTermTotal %></h1>
    <p>Mid Term Total Sales</p>

    </div>
    </div>

</div>


<div class="col-md-4">

    <div class="card" style="min-height:200px">

    <div class="card-body">

    <h1>(UGX)<%=shortTermTotal %></h1>
    <p>Short Term Total Sales</p>

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


$(()=>{
   $(".print-btn").on("click",ev=>{
    window.print();
   });
});
  

  </script>

  

  </body>

</html>
