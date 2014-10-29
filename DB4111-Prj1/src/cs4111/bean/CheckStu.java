package cs4111.bean;
import java.sql.ResultSet;
import java.sql.SQLException;

import cs4111.util.DBConn;
import cs4111.bean.Stubean;

public class CheckStu {

	public boolean checkStu(Stubean stu){
		if(!stu.getName().equals("") || stu.getName()!=null){
			ResultSet rs = null;
			DBConn db =new DBConn();
			String sql = new String("SELECT * FROM STUDENT WHERE STUDENT_ID ='"+stu.getName()+"'");
			rs = db.doSelect(sql);
			try {
				if(rs.next()){
					if(stu.getPwd().equals(rs.getString("password")))
						return true;
				}
				rs.close();
				db.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}
	
//	public static void main(String[] args){
//		Stubean s =new Stubean();
//		s.setName("mg3534");
//		s.setPwd("Columbia");
//		//String sql = new String("SELECT * FROM STUDENT WHERE STUDENT_ID ='"+s.getName()+"'");
//		CheckStu c = new CheckStu();
//		
//		System.out.println(c.checkStu(s));
//	}
}
