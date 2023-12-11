package recep.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.connection.DBConnect;

public class PayAppoinementDao {
	
	private static Connection con = null;
	private static Statement stmt = null;
	
	public static boolean payAppoinment(String appid) {
		
		boolean isSuccess = false;
		
		try {
	        con = DBConnect.getConnection();
	        stmt = con.createStatement();

	        // Retrieve patient NIC and doctor ID based on the appointment ID
	        String sql = "SELECT patient_nic, doctor_doctorId FROM apoinment WHERE apoinmentId = '" + appid + "'";
	        ResultSet rs = stmt.executeQuery(sql);

	        if (rs.next()) {
	            String patientNic = rs.getString("patient_nic");
	            String doctorId = rs.getString("doctor_doctorId");
	            
	            // Now, retrieve the channel payment based on the doctor ID
	            String paymentSql = "SELECT channelingPayment FROM doctor WHERE doctorId = '" + doctorId + "'";
	            ResultSet paymentRs = stmt.executeQuery(paymentSql);
	            
	            if (paymentRs.next()) {
	                double channelingPayment = paymentRs.getDouble("channelingPayment");
	                
	                Random random = new Random();
	        		int randomNumber = random.nextInt(90000) + 10000; 

	        		String uniqueID = "pay_" + randomNumber;
	        		
	        		Date todaysDate = new Date();
	                DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                
	                String DateAndTime = df2.format(todaysDate);
	                
	                String insertSql = "INSERT INTO aponmentpayment (paymentId, amount, date, patientnic, apoinment_apoinmentId, status) VALUES (?, ?, ?, ?, ?, 1)";
	                PreparedStatement ps = con.prepareStatement(insertSql);
	                ps.setString(1, uniqueID);
	                ps.setDouble(2, channelingPayment);
	                ps.setString(3, DateAndTime);
	                ps.setString(4, patientNic);
	                ps.setString(5, appid);

	                int rowsAffected = ps.executeUpdate();

	                if (rowsAffected > 0) {
	                	
	                	String sql1 = "UPDATE apoinment SET status= 2 WHERE apoinmentId = '"+appid+"'";	        			
	        			int rs1 = stmt.executeUpdate(sql1);
	        			
	        			String sql2 = "UPDATE patient SET status= 2 WHERE nic = '"+patientNic+"'";	        			
	        			rs1 = stmt.executeUpdate(sql2);
	        			
	        			if (rs1 >0 ) {
	        				isSuccess = true;
	        			}
	                    
	                }
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

        return isSuccess;
    }

}



