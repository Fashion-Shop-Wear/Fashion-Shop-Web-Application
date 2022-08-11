import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;


public class Cart extends HttpServlet{

    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException{

        try{
        if(request.getParameter("add_cart")!=null){
            insertCartItem(request,response); 
            response.sendRedirect("get_products");
            getCartCount(request,response);
            return;
        }

        if(request.getParameter("delete")!=null){
            deleteCartItem(request,response); 
            response.sendRedirect("my_cart");
            getCartCount(request,response);
            return;
        }
        
        getCartItems(request,response);
        getCartCount(request,response);
        }catch(Exception e){

            try{
                PrintWriter out = response.getWriter();
                out.println(e);
                out.close();
            }catch(Exception ex){

            }

        }

        
 
    }

     private void getCartCount(HttpServletRequest request,HttpServletResponse response) throws Exception{
        PrintWriter out = response.getWriter();

        int cartId = 2;
        HttpSession session = request.getSession();
        int customerId = 0;
        if(session.getAttribute("customer_id")!=null){
          customerId = Integer.parseInt(session.getAttribute("customer_id").toString());
        }
        if(session.getAttribute("cart_id")!=null){
            cartId = Integer.parseInt(session.getAttribute("cart_id").toString());
        }
        try{
        Connection con = DB.initializeDatabase();
        Statement cartStatement = con.createStatement();
        ResultSet cartRs = cartStatement.executeQuery("SELECT distinct count(*) as cart_count  FROM cart_items join cart on cart_items.cart_id=cart.cart_id join products on products.product_id = cart_items.product_id where cart.customer_id="+customerId+" and cart.cart_id="+cartId+" and cart.cart_status=0");
        int cart_count = 0;
        if(cartRs.next()){
            cart_count = cartRs.getInt("cart_count");
            session.setAttribute("cart_count",cart_count+"");
        }

       cartStatement.close();
        con.close();

        }catch(Exception e){
            out.println(e);
        }

    }


    private void getCartItems(HttpServletRequest request,HttpServletResponse response) throws Exception{
        PrintWriter out = response.getWriter();

        int cartId = 2;
        HttpSession session = request.getSession();
        int customerId = Integer.parseInt(session.getAttribute("customer_id").toString());

        if(session.getAttribute("cart_id")!=null){
            cartId = Integer.parseInt(session.getAttribute("cart_id").toString());
        }
        try{
        Connection con = DB.initializeDatabase();
        Statement cartStatement = con.createStatement();
        ResultSet cartRs = cartStatement.executeQuery("SELECT distinct * FROM cart_items join cart on cart_items.cart_id=cart.cart_id join products on products.product_id = cart_items.product_id where cart.customer_id="+customerId+" and cart.cart_id="+cartId+" and cart.cart_status=0");
        //request.getSession().put("results",rs);
        getServletContext().setAttribute(
            "cart_items",cartRs
        );
        request.getRequestDispatcher("my_cart.jsp").include(request,response);

       cartStatement.close();
        con.close();

        }catch(Exception e){
            out.println(e);
        }

    }




     private void deleteCartItem(HttpServletRequest request,HttpServletResponse response) throws Exception{
        PrintWriter out = response.getWriter();

        String cartId = request.getParameter("cart_id");
        String productId = request.getParameter("product_id");

        try{
        Connection con = DB.initializeDatabase();
        Statement cartStatement = con.createStatement();
        String query = "DELETE from cart_items where cart_id="+cartId+" and product_id="+productId;
        cartStatement.executeUpdate(query);
        cartStatement.close();
        con.close();
        Message.alertSuccess(request,"Removed Successfully");
        

        }catch(Exception e){
            out.println(e);
        }

    }





    public void insertCartItem(HttpServletRequest request, 
HttpServletResponse response ) throws Exception{

        // Initialize the database
             Connection con = DB.initializeDatabase();
  
            // Create a SQL query to insert data into demo table
            // demo table consists of two columns, so two '?' is used

            PreparedStatement cartCreateSt = con
                   .prepareStatement("insert into  cart(customer_id) values(?)");

            HttpSession session = request.getSession();
            String customerId = session.getAttribute("customer_id").toString();
            Statement checkStmt = con.createStatement();
            int customer_id = Integer.parseInt(customerId);
            int productId = Integer.parseInt(request.getParameter("product_id"));  
           
            ResultSet checkStmtRS = checkStmt.executeQuery("SELECT * from cart Where customer_id = "+customer_id+" and cart_status=0 order by cart_date desc limit 1");

            
            if(!checkStmtRS.next()){
            
            cartCreateSt.setInt(1,customer_id);
            
            // Execute the insert command using executeUpdate()
            // to make changes in database
            cartCreateSt.executeUpdate();
  
            // Close all the connections
            cartCreateSt.close();
            }
            checkStmt.close();

            Statement st = con.createStatement();

            String subQuery = "SELECT cart_id from cart Where customer_id = "+customer_id+" and cart_status=0 order by cart_date desc limit 1";
            

            ResultSet cartIdRs = st.executeQuery(subQuery);
            int cartId = 0;
            if(cartIdRs.next()){
                cartId = cartIdRs.getInt("cart_id");
                session.setAttribute("cart_id",cartId+"");
            }
            cartIdRs.close();

            String cartItemQuery = "insert into  cart_items(cart_id,product_id) values('"+cartId+"',"+productId+")";
            
            st.executeUpdate(cartItemQuery);
            // Close all the connections
            st.close();
            con.close();

            Message.alertSuccess(request,"Item added Successfully");
        
    }




}