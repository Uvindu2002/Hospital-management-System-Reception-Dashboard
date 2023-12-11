package recep.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recep.DAO.PayAppoinementDao;

@WebServlet("/PayAppoinmentServelet")
public class PayAppoinmentServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public PayAppoinmentServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String appId = request.getParameter("appId");


		boolean isTrue;
		isTrue = PayAppoinementDao.payAppoinment(appId);
		
		if (isTrue == true) {
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("apoinments.jsp");
		}
	}

}
