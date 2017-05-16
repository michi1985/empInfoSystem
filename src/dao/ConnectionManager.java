package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private static final String URL = "jdbc:mysql://localhost:3306/emp_sys_db";
	private static final String USER = "appuser";
	private static final String PASS = "apppass";

	private Connection connection = null;

	private static ConnectionManager instance = new ConnectionManager();

	/**
	 * コンストラクタ
	 */
	private ConnectionManager() {
	}

	public static synchronized ConnectionManager getInstance() {
		return instance;
	}

	/**
	 * DBの接続
	 *
	 * @return コネクション
	 * @throws Exception
	 */
	public Connection getConnection() throws Exception {

		String drv = "com.mysql.jdbc.Driver";
		try {
		    // JDBCドライバのロード
		    Class.forName(drv);
		} catch(ClassNotFoundException e) {
		    System.out.println("ドライバがありません" + e.getMessage());
		}

		try {
			if (connection == null || connection.isClosed()) {
				connection = DriverManager.getConnection(URL, USER, PASS);
			}
		} catch (Exception e) {
			e.printStackTrace();
			connection = null;
			throw e;
		}

		return connection;
	}

	/**
	 * DBの切断
	 */
	public void closeConnection() {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection = null;
		}
	}
}

