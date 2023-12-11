package recep.DAO;

import recep.model.EmployeeModel;

public interface EmployeeDao {
	
	public EmployeeModel login(String type,String userId, String password);

}
