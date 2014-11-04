package cs4111;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs4111.bean.CourworkBean;
import cs4111.bean.DayTaskBean;
import cs4111.bean.MStoneBean;
import cs4111.bean.PlanBean;
import cs4111.model.Courwork;
import cs4111.model.DayTask;
import cs4111.model.MStoneList;
import cs4111.model.Plan;

/**
 * Servlet implementation class PlanServlet
 */
public class PlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8"); 
        String cwid = (String)request.getParameter("cwid");
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("stuid");
        String startd = request.getParameter("pstdate");
        String endd = request.getParameter("peddate");
        
        System.out.println(startd);
        
        String[] sddl = startd.split("\\,");
		String sdayMon = sddl[0]; 
		String spcYear = sddl[1];
		String syear = spcYear.split("\\ ")[1];
		String[] sdm = sdayMon.split("\\ ");
		String sday = sdm[0]; String smon = sdm[1];
		if (sday.length()==1){
			sday = "0"+sday;
		}
		StringBuffer sb1 = new StringBuffer();
		sb1.append(smon).append("-").append(sday).append("-").append(syear);
		System.out.println("start:"+smon+"-"+sday+"-"+syear);
		
		String[] eddl = endd.split("\\,");
		String edayMon = eddl[0]; 
		String espcYear = eddl[1];
		String eyear = espcYear.split("\\ ")[1];
		String[] edm = edayMon.split("\\ ");
		String eday = edm[0]; String emon = edm[1];
		if (eday.length()==1){
			eday = "0"+eday;
		}
		StringBuffer sb2 = new StringBuffer();
		sb2.append(emon).append("-").append(eday).append("-").append(eyear);
		System.out.println("end:"+emon+"-"+eday+"-"+eyear);
		
		PlanBean pb = new PlanBean();
		pb.insPlan(sb1.toString(), sb2.toString(), cwid, sid);
		pb.closeDBconn();
		
        CourworkBean cwb = new CourworkBean();
        Courwork cw= cwb.getACourwork(cwid);
        cwb.closeDBconn();
                
        Plan pl = new Plan();
        //pl.setEddate(date);
        
        PlanBean pb1 = new PlanBean();
        pl = pb1.getPlan(cwid,sid);
        pb1.closeDBconn();
        
        MStoneList msl = new MStoneList();
        MStoneBean msb = new MStoneBean();
        msl = msb.getMStoneList(pl.getPlanid().toString());
        msb.closeDBconn();
        
        DayTaskBean dtb = new DayTaskBean();
        DayTask today = new DayTask();
        today = dtb.getDayTask(pl.getPlanid(), "today");
        DayTask tomor = new DayTask();
        tomor = dtb.getDayTask(pl.getPlanid(), "tomorrow");
        dtb.closeDBconn();
        
        String forward = new String("Plan.jsp");
        request.setAttribute("plan", pl);
        request.setAttribute("courwork",cw);
        request.setAttribute("mstonelist", msl);
        request.setAttribute("cwid", cwid);
        request.setAttribute("today", today);
        request.setAttribute("tomor", tomor);
        RequestDispatcher rd=request.getRequestDispatcher(forward);
        rd.forward(request,response);
	}

}
