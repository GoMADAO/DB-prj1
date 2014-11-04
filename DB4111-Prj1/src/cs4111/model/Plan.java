package cs4111.model;

import java.sql.Date;

public class Plan {
	private Integer cwid;
	private Integer planid;
	private Date stdate;
	private Date eddate;
	private Integer turnon;
	
	public void setCWid(Integer id){
		this.cwid = id;
	}
	public void setPlanid(Integer id){
		this.planid = id;
	}
	public void setStdate(Date date){
		this.stdate = date;
	}
	public void setEddate(Date date){
		this.eddate = date;
	}
	public void setTurnon(Integer turnon){
		this.turnon = turnon;
	}
	public Integer getCWid(){
		return this.cwid;
	}
	public Integer getPlanid(){
		return this.planid;
	}
	public Date getStdate(){
		return this.stdate;
	}
	public Date getEddate(){
		return this.eddate;
	}
	public Integer getTurnon(){
		return this.turnon;
	}
}
