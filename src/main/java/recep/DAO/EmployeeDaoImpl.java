package recep.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import recep.model.EmployeeModel;

public class EmployeeDaoImpl {
	
private Connection con;
	
	public EmployeeDaoImpl(Connection con) {
		super();
		this.con = con;
	}

	public EmployeeModel login(String type, String userId, String password) {
		
		EmployeeModel em = null;
		String sql = null;
		
		
		try {
			
			if ("admin".equals(type)) {
				sql = "SELECT * FROM admin WHERE adminId = ? AND password = ?";
		       
			} else if ("doctor".equals(type)) {
				sql = "SELECT * FROM doctor WHERE doctorId = ? AND password = ?";
		      
			}else if ("nurse".equals(type)) {
				sql = "SELECT * FROM nurse WHERE nurseId = ? AND password = ?";
		        
			}else if ("recep".equals(type)) {
				sql = "SELECT * FROM receptionist WHERE receptionistid = ? AND password = ?";
		        
			}

			
			if (sql != null) {
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, userId);
				ps.setString(2, password);
				
				ResultSet rs = ps.executeQuery();
				 
				while(rs.next()) {
					em = new EmployeeModel();
					em.setId(rs.getString(1));
					em.setName(rs.getString(2));
					em.setEmail(rs.getString(3));				
					em.setPassword(rs.getString(4));
					
				}
			}			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return em;
		
	}

}
