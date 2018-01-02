package configuration;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class ConnectionManager {

	static Connection connection = null;

	public static Connection getConnection() {

		try {
			Properties properties = new Properties();
			InputStream inputStream = new FileInputStream(
					"C:/Users/gur44608/Front-end Project/LMCourses/WebContent/db.properties");
			properties.load(inputStream);

			String driver = properties.getProperty("driver");
			String url = properties.getProperty("url");
			String username = properties.getProperty("username");
			String password = properties.getProperty("password");
			Class.forName(driver);
			connection = DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException | SQLException | IOException e) {
			System.out.println("error here");
			e.printStackTrace();
		}

		return connection;

	}

}