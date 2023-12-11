package recep.model;

public class EmployeeModel {
	
	private String id;
	private String name;
	private String email;
	private String type;
	private String password;	
	private String phone;
	private String nic;
	
	public EmployeeModel(String id, String name, String email, String type, String password, String phone, String nic) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.type = type;
		this.password = password;
		this.phone = phone;
		this.nic = nic;
	}

	public EmployeeModel() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getType() {
		return type;
	}

	public String getPassword() {
		return password;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setType(String phone) {
		this.type = phone;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}
	
	

}
