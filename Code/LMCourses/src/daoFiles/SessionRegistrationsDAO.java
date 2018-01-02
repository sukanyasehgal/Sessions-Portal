package daoFiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojoFiles.SessionRegistrationsBean;
import configuration.ConnectionManager;

public class SessionRegistrationsDAO {

	public List<SessionRegistrationsBean> displaySessionRegistrations() {

		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		Connection connection = null;

		List<SessionRegistrationsBean> listOfSessionRegistrations = new ArrayList<>();

		try {
			connection = ConnectionManager.getConnection();
			preparedStatement = connection
					.prepareStatement("select * from session_registrations");
			result = preparedStatement.executeQuery();

			while (result.next()) {
				SessionRegistrationsBean sessionRegistrationsBean = new SessionRegistrationsBean();
				String sessionCode = result.getString(1);
				int employeeId = result.getInt(2);
				String employeeName = result.getString(3);
				long employeePhoneNumber = result.getLong(4);
				String emailId = result.getString(5);
				sessionRegistrationsBean.setSessionCode(sessionCode);
				sessionRegistrationsBean.setEmployeeId(employeeId);
				sessionRegistrationsBean.setEmployeeName(employeeName);
				sessionRegistrationsBean
						.setEmployeePhoneNumber(employeePhoneNumber);
				sessionRegistrationsBean.setEmailId(emailId);

				listOfSessionRegistrations.add(sessionRegistrationsBean);
			}
		}

		catch (SQLException e) {

			e.printStackTrace();
		}

		finally {
			// start finally block

			try {

				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}// end finally block

		return listOfSessionRegistrations;
	}
}
