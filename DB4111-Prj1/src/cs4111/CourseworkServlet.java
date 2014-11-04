package cs4111;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

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
import cs4111.model.CourworkList;
import cs4111.model.DayTask;
import cs4111.model.MStoneList;
import cs4111.model.Plan;

/**
 * Servlet implementation class CourseworkServlet
 */
public class CourseworkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseworkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8"); 
        
//        String crsid=(String)request.getParameter("courseid");
//        CourworkList cwl = new CourworkList();
//        CourworkBean cwb = new CourworkBean();
//        cwb.reqCouwork(crsid, cwl);
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("stuid");
        String cwid = (String)request.getParameter("courseworkid");
        
        CourworkBean cwb = new CourworkBean();
        Courwork cw= cwb.getACourwork(cwid);
        cwb.closeDBconn();
        
        PlanBean pb = new PlanBean();
        Plan pl = new Plan();
        pl = pb.getPlan(cwid,sid);
        pb.closeDBconn();
        
        MStoneList msl = new MStoneList();
        MStoneBean msb = new MStoneBean();
        msl = msb.getMStoneList(String.valueOf(pl.getPlanid()));
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8"); 
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("stuid");
		String mstonePerc = (String)request.getParameter("mweight");
        String mstoneDesc = (String)request.getParameter("desc");
        String mstoneDDL = (String)request.getParameter("deadline");
        String mstonePlid = (String)request.getParameter("planid");
        String cwid = (String)request.getParameter("cwid");
        
//        PrintWriter out = response.getWriter();
//        out.println(mstonePerc);
//        out.println(mstoneDesc);
//        out.println(mstoneDDL);
//        out.println(mstonePlid);
//        out.println(cwid);
       
        CourworkBean cwb = new CourworkBean();
        Courwork cw= cwb.getACourwork(cwid);
        cwb.closeDBconn();
        
        //
        
        PlanBean pb = new PlanBean();
        Plan pl = new Plan();
        pl = pb.getPlan(cwid,sid);
        pb.closeDBconn();
        
        MStoneBean msb = new MStoneBean();
        MStoneList msl = new MStoneList();
        
        msl = msb.newMstone(mstonePlid, mstoneDDL, mstonePerc, mstoneDesc);
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
