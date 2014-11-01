package cs4111.model;

import java.util.ArrayList;
import java.util.List;

public class ProfTeachesList {
	private ArrayList<ProfTeaches> profList;
	public ProfTeachesList(){
		super();
	}
	public void setProfList(List<ProfTeaches> l){
		this.profList = (ArrayList<ProfTeaches>) l;
	}
	public ArrayList<ProfTeaches> getProfList(){
		return this.profList;
	}
}
