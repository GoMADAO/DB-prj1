package cs4111.model;

import java.util.ArrayList;

public class MStoneList {
	ArrayList<MStone> milestonelist;
	public ArrayList<MStone> getMStoneList(){
		return this.milestonelist;
	}
	public void setMStoneList(ArrayList<MStone> arr){
		this.milestonelist = arr;
	}
}
