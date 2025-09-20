import com.ronak.model.Connecter;
import com.ronak.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet("/show")
public class ShowOrders extends HttpServlet {
    Connecter c=new Connecter();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user=(String) req.getSession().getAttribute("user");
        ArrayList<Order>list=c.getOrders(user);
        req.setAttribute("orders",list);
        for(Order o:list){
            System.out.println(o.getUser()+" "+o.getItemname()+" "+o.getPrice()+" "+o.getQuantity()+" "+o.getAmount());
        }
        req.getRequestDispatcher("order.jsp").forward(req, resp);
    }
}
