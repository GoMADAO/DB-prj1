package cs4111;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs4111.bean.statBean;
import cs4111.model.Stat;

/**
 * Servlet implementation class statServlet
 */
public class statServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public statServlet() {
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
        String cwid=request.getParameter("cwid");  
        
        statBean stb = new statBean();
        Stat sttc = stb.getStat(cwid);
        stb.closeDBconn();
        
        String forward = new String("statistics.jsp");
        request.setAttribute("sttc", sttc);
        RequestDispatcher rd=request.getRequestDispatcher(forward);
        rd.forward(request,response);
	}

}
