package cs4111;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs4111.bean.CourworkBean;
import cs4111.model.Courwork;

/**
 * Servlet implementation class MstoneServlet
 */
public class MstoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MstoneServlet() {
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
        String sid = (String) session.getAttribute("stuid");
        String cwid = (String)request.getParameter("cwid");
        String mweight = (String)request.getParameter("mweight");
        String desc = (String)request.getParameter("descinput");
        String planid = (String)request.getParameter("planid");
        
		
	}

}
