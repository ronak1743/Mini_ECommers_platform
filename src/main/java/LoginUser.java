import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/login")
public class LoginUser extends HttpServlet {
    Connecter c=new Connecter();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(c.validateUser(req.getParameter("name"),req.getParameter("pass"))){
            req.getSession().setAttribute("user",req.getParameter("name"));
            resp.sendRedirect(req.getContextPath()+"/");
        }
        else {
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
        }
    }
}
