package daoFiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import configuration.ConnectionManager;
import pojoFiles.AdminLoginBean;

public class AdminLoginDAO {

	public boolean authenticateAdmin(AdminLoginBean adminLoginBean) {
		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		Connection connection = null;

		try {
			connection = ConnectionManager.getConnection();
			preparedStatement = connection
					.prepareStatement("select * from admin_details where (admin_username = ? and admin_password = ?)");
			preparedStatement.setString(1, adminLoginBean.getUsername());
			preparedStatement.setString(2, adminLoginBean.getPassword());
			result = preparedStatement.executeQuery();
			boolean exists = result.next();

			if (exists) {
				return true;
			}

		}

		catch (SQLException e) {

			e.printStackTrace();
		}

		finally {
			// start finally block
			try {

				preparedStatement.close(); // why not able to close it above???? above catch block
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}// end finally block

		return false;
	}
}
