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

  
public class Checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        

        PrintWriter out = response.getWriter();
        try{
        if(request.getParameter("checkout")!=null){
           doCheckout(request,response); 
        }

       
        }catch(Exception e){
            out.println(e);
        }
    }
    
    public void doCheckout(HttpServletRequest request, 
HttpServletResponse response ) throws Exception{

            Connection con = DB.initializeDatabase();
  
            Statement st = con.createStatement();
            
            String cartId = request.getParameter("cart_id");

            st.executeUpdate(
                "Update cart set cart_status=1 where cart_id="+cartId 
            );

            st.executeUpdate(
                "Insert INTO  sales(cart_id) values("+cartId+")"
            );
  
            st.close();
            con.close();
            Message.alertSuccess(request,"Transaction Completed Successfully");
            response.sendRedirect("get_products");
           
    }


}