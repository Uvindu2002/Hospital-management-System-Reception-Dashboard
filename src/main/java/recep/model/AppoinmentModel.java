package recep.model;

public class AppoinmentModel {
	
	private String appId;
	private String date;
	private String nic;
	private String message;
	private int Status;
	private String joined_date;
	private String doctorId;
	
	public AppoinmentModel(String appId, String date, String nic, String message, int status, String joined_date,
			String doctorId) {
		super();
		this.appId = appId;
		this.date = date;
		this.nic = nic;
		this.message = message;
		this.Status = status;
		this.joined_date = joined_date;
		this.doctorId = doctorId;
	}
	


	public AppoinmentModel() {
		// TODO Auto-generated constructor stub
	}



	public AppoinmentModel(String appid2, String date2, String nic2) {
		// TODO Auto-generated constructor stub
	}



	public String getAppId() {
		return appId;
	}
	public String getDate() {
		return date;
	}
	public String getNic() {
		return nic;
	}
	public String getMessage() {
		return message;
	}
	public int getStatus() {
		return Status;
	}
	public String getJoined_date() {
		return joined_date;
	}
	public String getDoctorId() {
		return doctorId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public void setJoined_date(String joined_date) {
		this.joined_date = joined_date;
	}
	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}
	
	

}
