package cs4111.model;

import java.sql.Date;

public class MStone {
	private Integer mstoneid;
	private Integer timesmodif;
	private String description;
	private Integer weight;
	private String status;
	private Date deadline;
	
	public void setMstoneid(Integer id){
		this.mstoneid = id;
	}
	public void setTimesmodif(Integer time){
		this.timesmodif = time;
	}
	public void setWeight(Integer weight){
		this.weight = weight;
	}
	public void setDesc(String desc){
		this.description = desc;
	}
	public void setStatus(String st){
		this.status = st;
	}
	public void setDeadline(Date dl){
		this.deadline = dl;
	}
	public Integer getMstoneid(){
		return this.mstoneid;	
	}
	public Integer getTimesmodif(){
		return this.timesmodif;
	}
	public Integer getWeight(){
		return this.weight;
	}
	public String getDesc(){
		return this.description;
	}
	public String getStatus(){
		return this.status;
	}
	public Date getDeadline(){
		return this.deadline;
	}
}
