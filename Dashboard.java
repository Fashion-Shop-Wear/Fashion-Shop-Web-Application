import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class Dashboard extends  HttpServlet{
   
    
 Connection conn;

 public void init(){
  try{
  conn = DB.initializeDatabase();
  }catch(Exception e){

  }
 }
   public  void doGet(HttpServletRequest request ,HttpServletResponse response)throws  IOException{

        try{
        
         getLikes(request,response);
         getCarts(request,response);
         getProducts(request,response);
         getCategories(request,response);
         getCustomers(request,response);
         getRevenue(request,response);
        request.getRequestDispatcher("dashboard.jsp").include(request,response);
        
        }catch(Exception e){

            PrintWriter out = response.getWriter();
            out.println(e);

        }

   }


   private void getCategories(HttpServletRequest request,HttpServletResponse response)throws Exception{

           Statement stmt = conn.createStatement();
            String query = "SELECT * from categories join production_lines on categories.production_line_id=production_lines.production_line_id";
            ResultSet recentCategories = stmt.executeQuery(query);

            getServletContext().setAttribute(
                "recent_categories",getNumbers(recentCategories)
            );
   }


   private void getLikes(HttpServletRequest request,HttpServletResponse response)throws Exception{

            Statement stmt = conn.createStatement();
            String query = "SELECT * from product_likes";
            ResultSet likes = stmt.executeQuery(query);

            getServletContext().setAttribute(
                "likes",getNumbers(likes)
            );

           
   }


   int getNumbers(ResultSet rs){

    int counter = 0;

    try{
    if(rs!=null){

      if(rs.next()){
        do{
          counter++;
        }while(rs.next());
        rs.close();
      }
    }
    }catch(Exception e){

    }

    return counter;
}



   private void getProducts(HttpServletRequest request,HttpServletResponse response)throws Exception{

           Statement stmt = conn.createStatement();
            String query = "SELECT * from products  join categories on products.category_id=categories.category_id join production_lines on categories.production_line_id=production_lines.production_line_id";
            ResultSet recentProducts = stmt.executeQuery(query);

            getServletContext().setAttribute(
                "products",getNumbers(recentProducts)
            );
  

   }



     private void getCustomers(HttpServletRequest request,HttpServletResponse response)throws Exception{

         Statement stmt = conn.createStatement();
            String query = "SELECT * from customers";
            ResultSet customersRs = stmt.executeQuery(query);

            getServletContext().setAttribute(
                "customers",getNumbers(customersRs)
            );
  
   }


    

     private void getCarts(HttpServletRequest request,HttpServletResponse response)throws Exception{

           Statement stmt = conn.createStatement();
            String query = "SELECT * from sales";
            ResultSet salesRs = stmt.executeQuery(query);

            getServletContext().setAttribute(
                "sales",getNumbers(salesRs)
            );
  
    }


     private void getRevenue(HttpServletRequest request,HttpServletResponse response)throws Exception{

         Statement stmt = conn.createStatement();
            String query = "SELECT sum(product_price) as revenue from products join cart_items on cart_items.product_id=products.product_id join cart on cart_items.cart_id = cart.cart_id join sales on cart.cart_id=sales.cart_id";
            ResultSet revenueRs = stmt.executeQuery(query);

            String revenue = "";
            if(revenueRs.next()){
                revenue = revenueRs.getString("revenue");
            }

            getServletContext().setAttribute(
                "revenue",revenue
            );
  
   }

   public void destroy(){
    try{
    conn.close();
    }catch(Exception e){

    }
   }

}