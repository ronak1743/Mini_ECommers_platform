import com.ronak.model.Connecter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addtoorder")
public class CartToOrder extends HttpServlet {
    Connecter c=new Connecter();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idx=Integer.parseInt(req.getParameter("id"));

        c.CartToOrder(idx,req.getSession().getAttribute("user").toString());
        c.deleteFromCart(idx);
        resp.sendRedirect(req.getContextPath()+"/showcart");

    }
}
