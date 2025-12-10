import com.ronak.model.Connecter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.Base64;

@WebServlet("/login")
public class LoginUser extends HttpServlet {
    public static String sha256Base64(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(input.getBytes());

            return Base64.getEncoder().encodeToString(hash);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    Connecter c=new Connecter();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newpass=sha256Base64(req.getParameter("pass"));
        if(c.validateUser(req.getParameter("name"),newpass)){
            req.getSession().removeAttribute("unothorize");
            req.getSession().setAttribute("user",req.getParameter("name"));
            resp.sendRedirect(req.getContextPath()+"/");
        }
        else {
            req.getSession().setAttribute("unothorize","Username or password is invalid");
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
        }
    }
}
