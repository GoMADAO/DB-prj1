package cs4111.util;

import java.sql.SQLException;
import java.sql.Connection;
import javax.sql.PooledConnection;
import oracle.jdbc.pool.OracleConnectionPoolDataSource;

public class DBPoolConn {
	private static DBPoolConn instance;  
    private OracleConnectionPoolDataSource ocpds;  
    private DBPoolConn() throws SQLException{  
        ocpds = new OracleConnectionPoolDataSource();  
        ocpds.setURL("jdbc:oracle:thin:@//w4111c.cs.columbia.edu:1521/ADB");  
        ocpds.setUser("mg3534");   
        ocpds.setPassword("passw0rd");  
    }     
    /**    
     * 返回唯一实例.如果是第一次调用此方法,则创建实例    
     *    
     * @return PoolDbSource 唯一实例    
      * @throws SQLException  
     */      
     static synchronized public DBPoolConn getInstance()    
     {      
         if (instance == null)      
         {      
              synchronized (DBPoolConn.class) // 加锁     
              {    
                  if(instance == null) // 第二次检查     
                  {    
                      try   
                      {  
                          instance = new DBPoolConn();  
                      }   
                      catch (SQLException e)  
                      {  
                         System.out.print("=================================");   
                         System.out.print("链接数据库失败！");   
                         System.out.print("=================================");   
                         System.out.print("错误信息：");  
                         e.printStackTrace();  
                         return null;  
                      }     
                  }    
              }    
         }        
         return instance;      
     }      
     /** 
      * 取得数据库连接 
      * @return 
      */  
     public Connection getConnection()  
     {  
         PooledConnection pc; // 数据库连接池连接  
         Connection conn; // 数据库连接对象  
         try   
         {  
             pc = ocpds.getPooledConnection(); // 从连接池获取连接  
             conn = pc.getConnection();  
         }  
         catch (SQLException e)  
         {  
             System.out.print("=================================");   
             System.out.print("获得数据库连接失败！");   
             System.out.print("=================================");   
             System.out.print("错误信息：");  
             e.printStackTrace();  
             return null;  
         }  
         return conn;  
     }         
}  

