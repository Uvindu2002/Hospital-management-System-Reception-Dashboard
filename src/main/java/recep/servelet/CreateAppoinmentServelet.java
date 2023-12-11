package recep.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recep.DAO.AppoinmentDao;


@WebServlet("/CreateAppoinmentServelet")
public class CreateAppoinmentServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CreateAppoinmentServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String nic = request.getParameter("nic");
		String date = request.getParameter("date");
		String doctorId = request.getParameter("doctor");
		String message = request.getParameter("message");
		
		boolean isTrue;
		
		isTrue = AppoinmentDao.makeAppoinment(name, email, mobile, nic, date, doctorId, message);
		
		if (isTrue == true) {
			response.sendRedirect("index.jsp?success=true");
		} else {
			
			response.sendRedirect("login.jsp");
//			String errorMessage = "Failed to make an appointment. Please try again.";
//		    request.setAttribute("errorMessage", errorMessage);
//		    request.getRequestDispatcher("your_error_page.jsp").forward(request, response);
		}
	}

}
