package daoFiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import configuration.ConnectionManager;
import pojoFiles.SessionBean;
import pojoFiles.UserBean;

public class RegistrationDAO {

	public void registerUser(UserBean userBean, SessionBean sessionBean) {

		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		Connection connection = null;

		try {
			connection = ConnectionManager.getConnection();
			preparedStatement = connection
					.prepareStatement("select * from session_registrations where (session_code = ? and employee_id = ?)");
			preparedStatement.setString(1, sessionBean.getCode());
			preparedStatement.setInt(2, userBean.getEmployeeId());
			result = preparedStatement.executeQuery();
			boolean exists = result.next();

			if (!exists) {
				preparedStatement = connection
						.prepareStatement("insert into session_registrations(session_code, employee_id, employee_name, employee_phone_number, email_id) values(?,?,?,?,?);");
				preparedStatement.setString(1, sessionBean.getCode());
				preparedStatement.setInt(2, userBean.getEmployeeId());
				preparedStatement.setString(3, userBean.getName());
				preparedStatement.setLong(4, userBean.getPhoneNumber());
				preparedStatement.setString(5, userBean.getEmail());
				preparedStatement.executeUpdate();
				preparedStatement.close();

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
			// return false;
	}
}
