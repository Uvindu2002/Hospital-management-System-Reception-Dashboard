package recep.servelet;

import java.io.IOException;
import java.sql.Connection;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBConnect;

import recep.model.AppoinmentModel;

@WebServlet("/AppoinmentSearchServelet")
public class AppoinmentSearchServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AppoinmentSearchServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String search = request.getParameter("search");
		
		 List<AppoinmentModel> appointments = new ArrayList<>();
		 
		

	        // Database connection and query
	        try {
	        	Connection con = DBConnect.getConnection();
	        	Statement stmt = con.createStatement();
				
	        	String sql = "SELECT * FROM apoinment WHERE patient_nic = '"+search+"'";
	        	
//	        	String sql = "SELECT * FROM apoinment WHERE patient_nic = ?";
//	            PreparedStatement ps = con.prepareStatement(sql);
//	            ps.setString(1, search);

	            ResultSet rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	            	AppoinmentModel appointment = new AppoinmentModel();
	            	appointment.setAppId(rs.getString("apoinmentId"));
	            	appointment.setDate(rs.getString("date"));
	            	appointment.setNic(rs.getString("patient_nic"));
	            	appointment.setDoctorId(rs.getString("doctor_doctorId")); // Update this line to set the doctor's name
	            	appointment.setMessage(rs.getString("masage"));
	            	

	                appointments.add(appointment);
	                System.out.println("Len"+appointments.size());
	                
	                request.setAttribute("appointments", appointments);
	                
	            }
	            RequestDispatcher dp = request.getRequestDispatcher("reception/apoinments.jsp");
				dp.forward(request,response);

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	     
	}

}
