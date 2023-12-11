package recep.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import recep.DAO.AppoinmentDao;

@WebServlet("/ResheduleServelet")
public class ResheduleServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ResheduleServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		String appId = request.getParameter("appid");
		
		boolean isTrue;
		
		isTrue = AppoinmentDao.reshedule(date, appId);
		
		if (isTrue == true) {
			response.sendRedirect("index.jsp");
		} 
	}

}
