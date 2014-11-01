package cs4111.model;

public class Chapter {
	private String title;
	private String courseName;
	
	public void setTitle(String tit){
		this.title = tit;
	}
	public void setCourseName(String cid){
		this.courseName = cid;
	}
	
	public String getTitle(){
		return this.title;
	}
	public String getCourseName(){
		return this.courseName;
	}
}
