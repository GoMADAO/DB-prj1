package cs4111;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs4111.bean.Course;
import cs4111.bean.TAassists;
import cs4111.bean.TAassistsReqBean;

/**
 * Servlet implementation class CourseServlet
 */
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseServlet() {
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
        
        //String crsname=(String)request.getAttribute("coursename");
        String crsid=(String)request.getParameter("courseid");
        //request.setAttribute("crsname", crsname);
        request.setAttribute("crsid", crsid);
        
        TAassists ta = new TAassists();
        TAassistsReqBean assists = new TAassistsReqBean();
        assists.assists(crsid, ta);
        
        String forward = new String("Course.jsp");
        request.setAttribute("ta",ta);
        RequestDispatcher rd=request.getRequestDispatcher(forward);
        rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
