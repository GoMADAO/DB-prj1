package cs4111;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs4111.bean.CheckStu;  
import cs4111.bean.Stubean;
import cs4111.util.DBConn;
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
		//设置HTTP响应的文档类型,此处为Text/html,如果更改为application\msword则设置为word文档格式  
        response.setContentType("text/html");  
        //设置响应所采用的编码方式  
        response.setCharacterEncoding("GB18030");  
        //取得参数username的值  
        String stuname=request.getParameter("username");  
        String passwd=request.getParameter("password");  
          
          
        Stubean stu=new Stubean();
        stu.setName(stuname);  
        stu.setPwd(passwd);  
        CheckStu ckstu=new CheckStu();  
        boolean bool=ckstu.checkStu(stu);  
          
        String forward;  
        if(bool){  
        	ResultSet rs = null;
        	DBConn conn =new DBConn();
        	String query = new String();
        	query = "SELECT name FROM STUDENT WHERE student_id='"+stuname+"'";
        	rs = conn.doSelect(query);
        	String StuName = new String();
        	try{
        	while(rs.next()){
        		StuName = rs.getString("name");
        	}
        	
        	}catch (SQLException e) {
        		e.printStackTrace();
        	}
        	
    			try {
    				rs.close();
					conn.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	
        	
        	stu.setStuName(StuName);
        	
            forward="success.jsp";  
            request.setAttribute("stu",stu);
              
        }else{  
            forward="error.jsp";  
        }  
        RequestDispatcher rd=request.getRequestDispatcher(forward);
        rd.forward(request,response);  
	}

}
