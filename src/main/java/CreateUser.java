import com.ronak.model.Connecter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/createuser")
public class CreateUser extends HttpServlet {
    Connecter c=new Connecter();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!c.isExist(req.getParameter("name"))) {
            c.createUser(req.getParameter("name"), req.getParameter("pass"));
            req.getSession().setAttribute("user", req.getParameter("name"));
            resp.sendRedirect(req.getContextPath() + "/");
        }
        else{
            req.getSession().setAttribute("taken",true);
            resp.sendRedirect(req.getContextPath()+"/signup.jsp");
        }
    }
}
