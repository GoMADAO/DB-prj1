package cs4111.bean;

public class Stubean {
	private String Username;
	private String Password;
	
	public void setName(String name){
		this.Username = name;
	}
	public void setPwd(String pwd){
		this.Password = pwd;
	}
	public String getName(){
		return this.Username;
	}
	public String getPwd(){
		return this.Password;
	}
}
