package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import cs4111.model.DayTask;
import cs4111.util.DBConn;

public class DayTaskBean {
	public DBConn conn;
	
	public DayTaskBean(){
		conn = new DBConn();
	}
	public void closeDBconn(){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public DayTask getDayTask(Integer planid, String day){
		String strday = "1";
		if(day.equals("tomorrow")){
			strday="0";
		}
		DayTask dt = new DayTask();
		ResultSet rs =null;
		String sql = new String("select * from day_task t left join dict d"
				+ " on d.dic_id = t.status"
				+ " where d.type = 'task_status' and t.task_date > sysdate -"+ strday
				+ " and t.plan_id = " +planid);
		conn.getConn();
		rs= conn.doSelect(sql);
		try {
			if(rs.next()){
				
				dt.setPlanid(Integer.parseInt(rs.getString("plan_id")));
				dt.setTaskid(Integer.parseInt(rs.getString("task_id")));
				dt.setStatus(rs.getString("value"));
				dt.setWeight(Integer.parseInt(rs.getString("weight")));
				dt.setSpend(Integer.parseInt(rs.getString("spent_time")));
				dt.setDate(rs.getDate("task_date"));
				dt.setContent(rs.getString("task_content"));
				rs.close();
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dt;
	}
	
	public void upDayTask(DayTask dt){
		String status="61";
		if(dt.getStatus().equalsIgnoreCase("finished")){
			status = "60";
		}
		String sql = "Update day_task set weight =" + dt.getWeight()
				+" ,task_content = '" +dt.getContent() 
				+"' ,spent_time = " + dt.getSpend()
				+" ,status = " +status + " where task_id = "+ dt.getTaskid();
		conn.getConn();
		System.out.println(sql);
		conn.doUpdate(sql);
	}
	public void insupNextDayTask(DayTask dt){
		String sql;
		
		if (dt.getTaskid()==null){
			sql = "insert into day_task (PLAN_ID,WEIGHT,TASK_CONTENT,STATUS) values ("
					+ dt.getPlanid() + ", "+ dt.getWeight() + ", '" + dt.getContent() +"', "
							+ "61 )";
		}else{
			String status="61";
			if(dt.getStatus().equalsIgnoreCase("finished")){
				status = "60";
			}
			sql = "update day_task set weight ="+dt.getWeight() + ", task_content ='" 
					+ dt.getContent() + "', status = "+status +" where task_id =" +dt.getTaskid();
		}
		conn.getConn();
		conn.doUpdate(sql);
		System.out.println("new function:"+sql);
		
	}
	
	
	public static void main(String[] args){
		DayTaskBean dtb = new DayTaskBean();
		DayTask dt1 = new DayTask();
		DayTask dt2 = new DayTask();
		dt1 = dtb.getDayTask(7,"today" );
		dt2 = dtb.getDayTask(7, "tomorrow");
		String s ;
		if(dt2.getContent()==null && dt2.getDate()==null)
			System.out.println("tomorrow not plan");
//		if(dt2.isEmpty())
//			System.out.println("function check");
//		s=dt1.getStatus();
		//System.out.println(s);
		dtb.insupNextDayTask(dt1);
		dtb.insupNextDayTask(dt2);
		System.out.println(dt2.getDate());
	}
}
