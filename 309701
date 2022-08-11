import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import javax.servlet.*;

  
public class Like extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        

        PrintWriter out = response.getWriter();
        try{
        if(request.getParameter("like_product")!=null){
            insertLike(request,response); 
        }
        }catch(Exception e){
            out.println(e);
        }
    }

    protected void doPost(HttpServletRequest request, 
HttpServletResponse response)
        throws ServletException, IOException{

            HttpSession session = request.getSession(true);
            String customerId = "1";
        try {


            // if(request.getParameter("store_product")!=null){
            //     storeProduct(request,response); 
            // }

            if(request.getParameter("store_category")!=null){
                insertCategory(request,response);
            }

            if(request.getParameter("store_customer")!=null){
                insertCustomer(request,response);
            }
  
    
        }
        catch (Exception e) {
            response.getWriter().println(e);
        }
    }




   

     public void insertCategory(HttpServletRequest request, 
HttpServletResponse response ) throws Exception{

        // Initialize the database
             Connection con = DB.initializeDatabase();
  
            // Create a SQL query to insert data into demo table
            // demo table consists of two columns, so two '?' is used
            PreparedStatement st = con
                   .prepareStatement("insert into categories(category_name) values(?)");
  
            // For the first parameter,
            // get the data using request object
            // sets the data to st pointer
            st.setString(1,request.getParameter("category_name"));
            
            // Execute the insert command using executeUpdate()
            // to make changes in database
            st.executeUpdate();
  
            // Close all the connections
            st.close();
            con.close();
  
            // Get a writer pointer 
            // to display the successful result
            PrintWriter out = response.getWriter();
            out.println("<html><body><b>Successfully inserted"
                        + "</b></body></html>");
 
    }


     public void insertCustomer(HttpServletRequest request, 
HttpServletResponse response) throws Exception{

        // Initialize the database
             Connection con = DB.initializeDatabase();
  
            // Create a SQL query to insert data into demo table
            // demo table consists of two columns, so two '?' is used
            PreparedStatement st = con
                   .prepareStatement("insert into  customers(full_name,location,gender) values(?,?,?)");
  
            // For the first parameter,
            // get the data using request object
            // sets the data to st pointer
            st.setString(1,request.getParameter("full_name"));
            st.setString(2,request.getParameter("location"));
            st.setString(3,request.getParameter("gender"));
            
            // Execute the insert command using executeUpdate()
            // to make changes in database
            st.executeUpdate();
  
            // Close all the connections
            st.close();
            con.close();
  
            // Get a writer pointer 
            // to display the successful result
            PrintWriter out = response.getWriter();
            out.println("<html><body><b>Successfully inserted"
                        + "</b></body></html>");
 
    }




    public void insertLike(HttpServletRequest request, 
HttpServletResponse response) throws Exception{

        // Initialize the database
             Connection con = DB.initializeDatabase();
  
            // Create a SQL query to insert data into demo table
            // demo table consists of two columns, so two '?' is used
            PreparedStatement st = con
                   .prepareStatement("insert into  product_likes(product_id) values(?)");
  
            // For the first parameter,
            // get the data using request object
            // sets the data to st pointer
            st.setString(1,request.getParameter("product_id"));
            
            // Execute the insert command using executeUpdate()
            // to make changes in database
            st.executeUpdate();
  
            // Close all the connections
            st.close();
            con.close();
            response.sendRedirect("get_products");
 
    }

}