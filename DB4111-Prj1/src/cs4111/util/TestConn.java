package cs4111.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import oracle.jdbc.pool.OracleDataSource;

public class TestConn {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String dbUser = "mg3534"; // enter your username here
        String dbPassword = "passw0rd"; // enter your password here
        System.out.println();
        try {
                OracleDataSource ods = new oracle.jdbc.pool.OracleDataSource();
                ods.setURL("jdbc:oracle:thin:@//w4111c.cs.columbia.edu:1521/ADB");
                ods.setUser(dbUser);
                ods.setPassword(dbPassword);

                Connection conn = ods.getConnection();

                String query = new String();
                Statement s = conn.createStatement();

                query = "select * from student";
// test
                 ResultSet r = s.executeQuery(query);
                 while(r.next()){
                   System.out.println("Today's Date: "+r.getString(1)+" ");
                 }
                r.close();
                s.close();


                conn.close();

        }
        catch (Exception e) {
                //system.out.println("The database could not be accessed.<br>");
                //out.println("More information is available as follows:<br>");
                e.printStackTrace();
        }
	}

}
