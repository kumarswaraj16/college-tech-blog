package com.tech.blog.helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection() throws ClassNotFoundException {

		try {
			if (con == null) {
				Class.forName("org.postgresql.Driver");
				String dbType = "jdbc:postgresql:";
				String dbUrl = "//127.0.0.1:5432/";
				String dbName = "TechBlog";
				String dbUser = "swarajkumar";
				String dbPass = "SURAJ SWARAJ";
				con = DriverManager.getConnection(dbType + dbUrl + dbName, dbUser, dbPass);
				System.out.println("Connected Successfully!");
				if (con.isClosed()) {
					System.out.println("Connection is still closed!");
				} else {
					System.out.println("Connected....");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return con;
	}
}
