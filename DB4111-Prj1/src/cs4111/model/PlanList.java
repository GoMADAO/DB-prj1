package cs4111.model;

import java.util.ArrayList;

public class PlanList {
	private ArrayList<Plan> planlist;
	
	public ArrayList<Plan> getPlanList(){
		return this.planlist;
	}
	public void setPlanList(ArrayList<Plan> arr){
		this.planlist = arr;
	}
}
