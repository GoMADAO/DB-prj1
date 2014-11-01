package cs4111.model;

import java.util.ArrayList;
import java.util.List;

public class ChapterList {
	private ArrayList<Chapter> chaplist;
	public ChapterList(){
		super();
	}
	public void setChapList(List<Chapter> l){
		this.chaplist = (ArrayList<Chapter>) l;
	}
	public ArrayList<Chapter> getChapList(){
		return this.chaplist;
	}
}
