package cs4111;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import oracle.jdbc.*;
import oracle.jdbc.pool.*;

public class OracleServlet extends HttpServlet {

        public void doGet (HttpServletRequest request,
                        HttpServletResponse response)
        throws ServletException, IOException {

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                //dsfdsfs

                String dbUser = "mg3534"; // enter your username here
                String dbPassword = "passw0rd"; // enter your password here

                try {
                        OracleDataSource ods = new oracle.jdbc.pool.OracleDataSource();
                        ods.setURL("jdbc:oracle:thin:@//w4111c.cs.columbia.edu:1521/ADB");
                        ods.setUser(dbUser);
                        ods.setPassword(dbPassword);

                        Connection conn = ods.getConnection();

                        String query = new String();
                        Statement s = conn.createStatement();

                        query = "select course_id from reg_for where student_id = 'mg3534'";

                         ResultSet r = s.executeQuery(query);
                         while(r.next()){
                           out.println("course_id: "+r.getString("course_id")+" ");
                         }
                        r.close();
                        s.close();


                        conn.close();

                }
                catch (Exception e) {
                        out.println("The database could not be accessed.<br>");
                        out.println("More information is available as follows:<br>");
                        e.printStackTrace(out);
                }

        }  // end doGet method

}  // end DatabaseServlet class

