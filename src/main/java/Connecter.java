import java.sql.*;

public class Connecter {
    Database db=new Database();
    final private String url=db.getUrl();
    final private String user=db.getUser();
    final private String pass=db.getPass();
    public Connecter() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void createUser(String Username,String pass){
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        try {
            Connection c=DriverManager.getConnection(url,user,this.pass);
            PreparedStatement ps=c.prepareStatement(sql);
            ps.setString(1,Username);
            ps.setString(2,pass);
            ps.execute();
            System.out.println("Created user");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected boolean validateUser(String Username,String pass){
        String sql = "select password from users where username=?";
        try {
            Connection c=DriverManager.getConnection(url,user,this.pass);
            PreparedStatement ps=c.prepareStatement(sql);
            ps.setString(1,Username);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                String dbpass=rs.getString("password");
                if(dbpass.equals(pass)){
                    System.out.println("Login ok");
                    return true;
                }
                else {
                    System.out.println("pass wrong");
                    return false;
                }
            }
            else{
                System.out.println("No user");
                return  false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
