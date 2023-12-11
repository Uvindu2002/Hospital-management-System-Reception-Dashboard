package recep.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recep.DAO.EmployeeDaoImpl;
import com.connection.DBConnect;
import recep.model.EmployeeModel;

@WebServlet("/EmployeeLoginServelet")
public class EmployeeLoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EmployeeLoginServelet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EmployeeDaoImpl dao = new EmployeeDaoImpl(DBConnect.getConnection());
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("userName");
        String password = request.getParameter("password");
        
        String userType = extractUserType(userId);
        
        EmployeeModel em = dao.login(userType, userId, password);
        
        
        if (em != null ) { 	
        	
        	
        	if ("admin".equals(userType)) {
        	    session.setAttribute("employeeObj", em);
        	    response.sendRedirect("admin/index.jsp?success");
        	}else if ("doctor".equals(userType)) {
        	    session.setAttribute("employeeObj", em);
        	    response.sendRedirect("doctor/index.jsp?success");
        	}else if ("nurse".equals(userType)) {
        	    session.setAttribute("employeeObj", em);
        	    response.sendRedirect("nurse/index.jsp?success");
        	}else if ("recep".equals(userType)) {
        	    session.setAttribute("employeeObj", em);
        	    response.sendRedirect("index.jsp?success");
        	}
        	
        	        	
        }else {
        	
        	
        	response.sendRedirect("login.jsp?unsuccess");        	
        	
        }
        
        
		
	}
	
	private String extractUserType(String userId) {
        
        int underscoreIndex = userId.indexOf("_");
        if (underscoreIndex != -1) {
            return userId.substring(0, underscoreIndex);
        }
        return ""; 
    }

}
