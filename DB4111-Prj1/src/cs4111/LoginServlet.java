package cs4111;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs4111.bean.CourseReqBean;
import cs4111.bean.StuCheckBean;  
import cs4111.bean.Student;
import cs4111.bean.Course;
/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
        response.setCharacterEncoding("GB18030");   
        String stuname=request.getParameter("username");  
        String passwd=request.getParameter("password");  
          
          
        Student stu=new Student();
        stu.setName(stuname);  
        stu.setPwd(passwd);  
        StuCheckBean ckstu=new StuCheckBean();  
        boolean bool=ckstu.checkStu(stu);  
          
        String forward;  
        if(bool){  
        	//student name
        	ckstu.stuName(stu);
        	
        	//course info
        	Course course = new Course();
        	CourseReqBean courseRB = new CourseReqBean();
        	courseRB.courseReqBean(stuname, course);
        	
        	//forward to JSP
            forward="success.jsp";  
            request.setAttribute("stu",stu);
            request.setAttribute("course",course);
              
        }else{  
            forward="error.jsp";  
        }  
        RequestDispatcher rd=request.getRequestDispatcher(forward);
        rd.forward(request,response);  
	}

}
