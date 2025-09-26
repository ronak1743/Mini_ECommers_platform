import com.ronak.model.Connecter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addtocart")
public class AddToCart extends HttpServlet {
    Connecter conn=new Connecter();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int itemid=Integer.parseInt(req.getParameter("id"));
        int count=Integer.parseInt(req.getParameter("count"));
        String user=(String)req.getSession().getAttribute("user");
        conn.addtoCart(itemid,count,user);
        resp.sendRedirect(req.getContextPath()+"/index.jsp");
    }
}
