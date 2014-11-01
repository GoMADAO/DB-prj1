package cs4111.model;

public class Course {
	private Integer cid;
	private String cname;
	private String cdesc;
	
	public void setCid(Integer id){
		this.cid = id;
	}
	public void setCname(String name){
		this.cname = name;
	}
	public void setCdesc(String desc){
		this.cdesc = desc;
	}
	public Integer getCid(){
		return this.cid;
	}
	public String getCname(){
		return this.cname;
	}
	public String getCdesc(){
		return this.cdesc;
	}
}
