package recep.servelet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBConnect;


@WebServlet("/DoctorStatusChange")
public class DoctorStatusChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DoctorStatusChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String dId = request.getParameter("dId");
            int status = Integer.parseInt(request.getParameter("status"));

            Connection con = null;
            Statement stmt = null;

            try {
                con = DBConnect.getConnection();
                stmt = con.createStatement();

                int rs = 0;

                if (status == 1) {
                    String sql = "UPDATE doctor SET status = 2 WHERE doctorId = '"+dId+"'";
                    rs = stmt.executeUpdate(sql);
                } else {
                    String sql = "UPDATE doctor SET status = 1 WHERE doctorId = '"+dId+"'";
                    rs = stmt.executeUpdate(sql);
                }

                if (rs > 0) {
                    response.sendRedirect("doctors.jsp");
                } else {
                    response.sendRedirect("error.jsp"); // Handle the error case
                }
            } catch (Exception e) {
                e.printStackTrace();
               
            } 
        } catch (NumberFormatException e) {
            e.printStackTrace();
            
        }
    }

}
