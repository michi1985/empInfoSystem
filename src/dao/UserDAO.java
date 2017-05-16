package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.UserBean;

public class UserDAO {

	/**
	 * @param userid ユーザID
	 * @param password パスワード
	 * @return DBを検索してデータがあるかどうかを確認する。
	 *  	       データがあればuserにセットしてreturnする。
	 */
	public UserBean login(String userid, String password) {

		ConnectionManager cm = ConnectionManager.getInstance();

		UserBean user = new UserBean();

		try(Connection con = cm.getConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM emp_sys_db.m_user WHERE user_id = ? AND password = ?;")) {

			pstmt.setString(1, userid);
			pstmt.setString(2, password);

			ResultSet res = pstmt.executeQuery();

				if(res.next()) {
					user.setUserId(res.getString("user_id"));
					user.setPassword(res.getString("password"));

				} else {
					/* DO NOTHING */
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
}
