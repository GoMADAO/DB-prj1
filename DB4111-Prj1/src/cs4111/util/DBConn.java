package cs4111.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import cs4111.util.DBPoolConn;

public class DBConn {
	Connection conn;
	DBPoolConn poolDbSource;
	Statement stmt;
	
//	public DBCon(){
//		super();
//	}
    //执行插入     
    public void doInsert(String sql) {  
    	
    	try {     
    		poolDbSource = DBPoolConn.getInstance();
    		conn =poolDbSource.getConnection();
    		stmt = conn.createStatement();     
    		int i = stmt.executeUpdate(sql); 
	     } catch(SQLException sqlexception) {     
	         System.err.println("db.executeInset:" + sqlexception.getMessage());     
	     }finally{     
	              
	     }     
	 }     
	 //执行删除     
	 public void doDelete(String sql) {  
		 //Statement stmt;
	     try {     
	    	 poolDbSource = DBPoolConn.getInstance();
	 		 conn =poolDbSource.getConnection();
	         stmt = conn.createStatement();     
	         int i = stmt.executeUpdate(sql);     
	     } catch(SQLException sqlexception) {     
	         System.err.println("db.executeDelete:" + sqlexception.getMessage());     
	     }     
	 }     
	 //执行更新     
	 public void doUpdate(String sql) {   
		 //Statement stmt;
	     try {     
	    	 poolDbSource = DBPoolConn.getInstance();
	 		 conn =poolDbSource.getConnection();
	         stmt = conn.createStatement();     
	         int i = stmt.executeUpdate(sql);     
	     } catch(SQLException sqlexception) {     
	         System.err.println("db.executeUpdate:" + sqlexception.getMessage());     
	     }     
	 }     
	 //查询结果集     
	 public ResultSet doSelect(String sql) {
		 //Statement stmt;
		 ResultSet rs =null;
	     try {  
	//         conn=DriverManager.getConnection(url,user,password);  
	//     	OracleDataSource ods = new OracleDataSource();
	//   	    String dbUser = "mg3534"; // enter your username here
	//   	    String dbPassword = "passw0rd"; // enter your password here
	//   	    ods.setURL("jdbc:oracle:thin:@//w4111c.cs.columbia.edu:1521/ADB2"); 
	//   	    ods.setUser(dbUser);
	//   	    ods.setPassword(dbPassword);
	     	//conn = ods.getConnection();
	    	 poolDbSource = DBPoolConn.getInstance();
	 		 conn =poolDbSource.getConnection();
	     	stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);       
	         rs = stmt.executeQuery(sql);   
	         System.out.println("Return Query Result");  
	     } catch(SQLException sqlexception) {     
	         System.err.println("db.executeQuery: " + sqlexception.getMessage());     
	     }     
	     return rs;     
	 }     
	 /**   
	  *关闭数据库结果集，数据库操作对象，数据库链接   
	    @Function: Close all the statement and conn int this instance and close the parameter ResultSet   
	    @Param: ResultSet   
	    @Exception: SQLException,Exception   
	   **/    
	  public void close(ResultSet rs) throws SQLException, Exception {     
	 
	    if (rs != null) {     
	      rs.close();     
	      rs = null;     
	    }     
	 
	    if (stmt != null) {     
	      stmt.close();     
	      stmt = null;     
	    }     
	 
	    if (conn != null) {     
	      conn.close();     
	      conn = null;     
	    }     
	  }     
	 
	  /**   
	   *关闭数据库操作对象，数据库连接对象   
	   * Close all the statement and conn int this instance   
	   * @throws SQLException   
	   * @throws Exception   
	   */    
	  public void close() throws SQLException, Exception {     
	    if (stmt != null) {     
	      stmt.close();     
	      stmt = null;     
	    }     
	 
	    if (conn != null) {     
	      conn.close();     
	      conn = null;     
	    }     
	  }     
	  //测试类  
	  public static void main(String []args){  
          DBConn db=new DBConn();  
          String s = new String();
          s="Insert into student (student_id,name,enroll_interval,student_type) values('12345','Test',6,1)";
          db.doInsert(s);
          ResultSet rs=db.doSelect("select * from student");  
          try {  
              while(rs.next()){  
                  System.out.println(rs.getString(1));  
                  System.out.println(rs.getInt(3));  
                    
              }  
          } catch (SQLException e) {  
              // TODO Auto-generated catch block  
              e.printStackTrace();  
          }  
          System.out.println("===========================");
          s="delete from student where student_id = '12345'";
          db.doDelete(s);
          rs=db.doSelect("select * from student");  
          try {  
              while(rs.next()){  
                  System.out.println(rs.getString(1));  
                  System.out.println(rs.getInt(3));  
                    
              }  
          } catch (SQLException e) {  
              // TODO Auto-generated catch block  
              e.printStackTrace();  
          }  
       }  
	  
}
