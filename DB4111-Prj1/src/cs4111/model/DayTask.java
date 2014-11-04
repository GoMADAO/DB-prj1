package cs4111.model;

import java.sql.Date;

public class DayTask {
	private Integer taskid;
	private Integer planid;
	private String status;
	private Integer dweight;
	private Integer spenttime;
	private String content;
	private Date date;
	
	public Integer getTaskid(){
		return this.taskid;
	}
	public Integer getPlanid(){
		return this.planid;
	}
	public Integer getSpend(){
		return this.spenttime;
	}
	public String getStatus(){
		return this.status;
	}
	public Integer getWeight(){
		return this.dweight;
	}
	public String getContent(){
		return this.content;
		
	}
	public Date getDate(){
		return this.date;
		
	}
	public void setTaskid(Integer id){
		this.taskid =id;
	}
	public void setPlanid(Integer id){
		this.planid =id;
	}
	public void setStatus(String status){
		this.status =status;
	}
	public void setWeight(Integer weight){
		this.dweight =weight;
	}
	public void setContent(String content){
		this.content=content;
	}
	public void setDate(Date d){
		this.date =d;
	}
	public void setSpend(Integer time){
		this.spenttime =time;
		
	}
	public boolean isEmpty(){
		if(this.taskid==null)
			return true;
		return false;
		
	}
}
