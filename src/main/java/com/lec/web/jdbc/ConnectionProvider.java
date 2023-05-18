package com.lec.web.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() throws Exception {
		return DriverManager.getConnection("jdbc:apache:commons:dbcp:guestbook");
		
	}
}
