package cs4111.model;

import java.util.ArrayList;
import java.util.List;

public class TAassistsList {
	private ArrayList<TAassists> taList;
	public TAassistsList(){
		super();
	}
	public void setTAlist(List<TAassists> l){
		this.taList = (ArrayList<TAassists>) l;
	}
	public ArrayList<TAassists> getTAlist(){
		return this.taList;
	}
}