import com.ronak.model.Carditem;
import com.ronak.model.Connecter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/add-all-to-order")
public class OrderAllFromCart extends HttpServlet {
    Connecter c=new Connecter();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user=(String) req.getSession().getAttribute("user");
        ArrayList<Carditem> list=c.showCart(user);

        for(Carditem c1:list){
            int idx=c1.getOid();
            c.CartToOrder(idx,req.getSession().getAttribute("user").toString());
            c.deleteFromCart(idx);
        }
        resp.sendRedirect(req.getContextPath()+"/showcart");

    }
}
