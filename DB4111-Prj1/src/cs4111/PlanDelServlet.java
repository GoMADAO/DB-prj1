package cs4111;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs4111.bean.CourseReqBean;
import cs4111.bean.CourworkBean;
import cs4111.bean.DayTaskBean;
import cs4111.bean.MStoneBean;
import cs4111.bean.PlanBean;
import cs4111.bean.StuCheckBean;
import cs4111.model.CourseList;
import cs4111.model.Courwork;
import cs4111.model.CourworkList;
import cs4111.model.DayTask;
import cs4111.model.MStoneList;
import cs4111.model.Plan;
import cs4111.model.PlanList;
import cs4111.model.Student;

/**
 * Servlet implementation class PlanDelServlet
 */
public class PlanDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanDelServlet() {
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
        HttpSession session = request.getSession();
        String stuname = (String) session.getAttribute("stuid");
        String plid = request.getParameter("pid");
        PlanBean pb =new PlanBean();
        pb.delPlanRel(plid, stuname);
        pb.closeDBconn();
        
        CourseList cl =new CourseList();
    	CourseReqBean courseRB = new CourseReqBean();
    	courseRB.courseReqBean(stuname, cl);
    	courseRB.closeDBconn();
    	CourworkList cwl = new CourworkList();
    	CourworkBean cwb = new CourworkBean();
    	cwb.getCurWork(cl, cwl);
    	cwb.closeDBconn();
    	
    	Student stu=new Student();
    	stu.setName(stuname);
    	StuCheckBean ckstu=new StuCheckBean();  
    	ckstu.stuName(stu);
    	ckstu.closeDBconn();
    	
    	String forward;
    	PlanList plist = new PlanList();
    	PlanBean plb = new PlanBean();
    	plb.getCurPlan(plist,cwl, stuname);
    	plb.closeDBconn();
    	
    	forward="MainPage.jsp";  
        request.setAttribute("stu",stu);
        session.setAttribute("stuid", stuname);
        request.setAttribute("courselist",cl);
        request.setAttribute("currentwork", cwl);
        request.setAttribute("planlist", plist);
        RequestDispatcher rd=request.getRequestDispatcher(forward);
        rd.forward(request,response);
	}

}
