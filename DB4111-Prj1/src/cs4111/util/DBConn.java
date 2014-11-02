package cs4111.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import javax.sql.PooledConnection;

import oracle.jdbc.pool.OracleDataSource;
import cs4111.util.DBPoolConn;

public class DBConn {
	/*
	PooledConnection pconn;
	Connection conn;
	DBPoolConn poolDbSource;
	Statement stmt;
    public void doInsert(String sql) {  
    	//Connection con;
    	try {     
    		poolDbSource = DBPoolConn.getInstance();
    		conn =poolDbSource.getConnection();
    		stmt = conn.createStatement();     
    		int i = stmt.executeUpdate(sql); 
    		//con.close();
	     } catch(SQLException sqlexception) {     
	         System.err.println("db.executeInset:" + sqlexception.getMessage());     
	     }finally{     
	              
	     }     
	 }     
	 //执行删除     
	 public void doDelete(String sql) {  
		 //Statement stmt;
		 //Connection con;
	     try {     
	    	 poolDbSource = DBPoolConn.getInstance();
	 		 conn =poolDbSource.getConnection();
	         stmt = conn.createStatement();     
	         int i = stmt.executeUpdate(sql);   
	         //con.close();
	     } catch(SQLException sqlexception) {     
	         System.err.println("db.executeDelete:" + sqlexception.getMessage());     
	     }     
	 }     
	 //执行更新     
	 public void doUpdate(String sql) {   
		 //Statement stmt;
		 //Connection con;
	     try {     
	    	 poolDbSource = DBPoolConn.getInstance();
	 		 conn =poolDbSource.getConnection();
	         stmt = conn.createStatement();     
	         int i = stmt.executeUpdate(sql);  
	         //con.close();
	     } catch(SQLException sqlexception) {     
	         System.err.println("db.executeUpdate:" + sqlexception.getMessage());     
	     }     
	 }     
	 //查询结果集     
	 public ResultSet doSelect(String sql) {
		 //Statement stmt;
		 //Connection con;
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
	         //con.close();
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
	
	/*
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
	/*
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
          
//          s="Insert into student (student_id,name,enroll_interval,student_type) values('12345','Test',6,1)";
//          db.doInsert(s);
          ResultSet rs=db.doSelect("select * from student");  
          try {  
              while(rs.next()){  
                  System.out.println(rs.getString(1));  
                  System.out.println(rs.getInt(3));  
                    
              }  
              rs.close();
          } catch (SQLException e) {  
              // TODO Auto-generated catch block  
              e.printStackTrace();  
          }  
          System.out.println("===========================");
//          s="delete from student where student_id = '12345'";
//          db.doDelete(s);
//          rs=db.doSelect("select * from student");  
//          try {  
//              while(rs.next()){  
//                  System.out.println(rs.getString(1));  
//                  System.out.println(rs.getInt(3));  
//                    
//              }  
//          } catch (SQLException e) {  
//              // TODO Auto-generated catch block  
//              e.printStackTrace();  
//          }  
          
          try {
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       } 

	  
	  */
	
     public static String user;//定义用户名     
     public static String password;//定义密码     
     public static Connection conn;//定义连接     
     public static Statement stmt;//定义STMT     
     public ResultSet rs;//定义结果集     
     //设置CONN     
     //构造函数，默认加裁配置文件为jdbc.driver     
     public DBConn(){     
     	try {   
       	  OracleDataSource ods = new OracleDataSource();
       	  String dbUser = "mg3534"; // enter your username here
       	  String dbPassword = "passw0rd"; // enter your password here
       	  ods.setURL("jdbc:oracle:thin:@//w4111c.cs.columbia.edu:1521/ADB"); 
       	  ods.setUser(dbUser);
       	  ods.setPassword(dbPassword);
       	  conn = ods.getConnection();
//           driver="com.microsoft.jdbc.sqlserver.SQLServerDriver";  
//           url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=qtliu";  
//           user="sa";  
//           password="sa";  
//           Class.forName(driver);     
//           conn = DriverManager.getConnection(url,user,password);  
//           System.out.println("-------连接成功------");     
       } catch(SQLException sqlexception) {     
           System.err.println("db.getconn(): " + sqlexception.getMessage());     
       }     
         //this.conn=this.getConn();  
     }     
     //返回Conn     
     	public  Connection getConn(){
     		try {
				if(conn.isClosed()){
					OracleDataSource ods = new OracleDataSource();
			       	  String dbUser = "mg3534"; // enter your username here
			       	  String dbPassword = "passw0rd"; // enter your password here
			       	  ods.setURL("jdbc:oracle:thin:@//w4111c.cs.columbia.edu:1521/ADB"); 
			       	  ods.setUser(dbUser);
			       	  ods.setPassword(dbPassword);
			       	  conn = ods.getConnection();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
     		return this.conn;     
     	}

     //执行插入     
        public void doInsert(String sql) {     
         try {
        	 
             stmt = conn.createStatement();     
             int i = stmt.executeUpdate(sql);     
         } catch(SQLException sqlexception) {     
             System.err.println("db.executeInset:" + sqlexception.getMessage());     
         }finally{     
                  
         }     
     }     
       
     //执行删除
     public void doDelete(String sql) {     
         try {     
             stmt = conn.createStatement();     
             int i = stmt.executeUpdate(sql);     
         } catch(SQLException sqlexception) {     
             System.err.println("db.executeDelete:" + sqlexception.getMessage());     
         }     
     }     
     //执行更新     
     public void doUpdate(String sql) {     
         try {     
             stmt = conn.createStatement();     
             int i = stmt.executeUpdate(sql);     
         } catch(SQLException sqlexception) {     
             System.err.println("db.executeUpdate:" + sqlexception.getMessage());     
         }     
     }     
     
     public String doFunction(String sql){
    	 String result = null;
    	 try {
			CallableStatement cst = conn.prepareCall(sql);
			cst.registerOutParameter(1, Types.INTEGER);
			cst.execute();
			result = cst.getString(1);
			cst.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		return result;
    	 
     }
     
     //查询结果集     
     public ResultSet doSelect(String sql) {     
         try {  
//             conn=DriverManager.getConnection(url,user,password);  
//         	OracleDataSource ods = new OracleDataSource();
//       	    String dbUser = "mg3534"; // enter your username here
//       	    String dbPassword = "passw0rd"; // enter your password here
//       	    ods.setURL("jdbc:oracle:thin:@//w4111c.cs.columbia.edu:1521/ADB2"); 
//       	    ods.setUser(dbUser);
//       	    ods.setPassword(dbPassword);
         	//conn = ods.getConnection();
         	
         	stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);       
             rs = stmt.executeQuery(sql);   
             System.out.println("取得结果集");  
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
        db.getConn();  
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
    }  
}
