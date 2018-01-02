package daoFiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import configuration.ConnectionManager;
import pojoFiles.SessionBean;

public class SelectedSessionDAO {

	public SessionBean getSessionAttributes(String selectedCourseCode) {

		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		Connection connection = null;

		SessionBean session = new SessionBean();
		try {
			connection = ConnectionManager.getConnection();

			preparedStatement = connection
					.prepareStatement("select * from june_sessions where code = ?");
			preparedStatement.setString(1, selectedCourseCode);
			result = preparedStatement.executeQuery();
			while (result.next()) {
				String code = result.getString(1);
				String category = result.getString(2);
				String day = result.getString(3);
				int duration = result.getInt(4);
				int level = result.getInt(5);
				String preRequisites = result.getString(6);
				String room = result.getString(7);
				String startTime = result.getString(8);
				String track = result.getString(9);
				String url = result.getString(10);
				String speaker = result.getString(11);
				String imageUrl = result.getString(12);
				session.setCode(code);
				session.setCategory(category);
				session.setDay(day);
				session.setDuration(duration);
				session.setLevel(level);
				session.setPreRequisites(preRequisites);
				session.setRoom(room);
				session.setStartTime(startTime);
				session.setTrack(track);
				session.setUrl(url);
				session.setSpeaker(speaker);
				session.setImage(imageUrl);
			}
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

		return session;
	}
}
