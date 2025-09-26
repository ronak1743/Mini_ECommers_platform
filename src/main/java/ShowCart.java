import com.ronak.model.Carditem;
import com.ronak.model.Connecter;
import com.ronak.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/showcart")
public class ShowCart extends HttpServlet {
     Connecter connecter = new Connecter();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user=(String) req.getSession().getAttribute("user");
        ArrayList<Carditem>list=connecter.showCart(user);
        req.setAttribute("cartlist",list);
        for(Carditem c:list){
            System.out.println(c.getItemid()+" "+c.getQuantity()+" "+c.getUser());
        }
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }
}
