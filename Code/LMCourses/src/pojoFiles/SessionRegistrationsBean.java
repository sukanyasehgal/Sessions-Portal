package pojoFiles;

public class SessionRegistrationsBean {

	private String sessionCode;
	private int employeeId;
	private String employeeName;
	private long employeePhoneNumber;
	private String emailId;

	public String getSessionCode() {
		return sessionCode;
	}

	public void setSessionCode(String sessionCode) {
		this.sessionCode = sessionCode;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public long getEmployeePhoneNumber() {
		return employeePhoneNumber;
	}

	public void setEmployeePhoneNumber(long employeePhoneNumber) {
		this.employeePhoneNumber = employeePhoneNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

}
