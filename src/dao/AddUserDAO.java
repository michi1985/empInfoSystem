package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddUserDAO {

	/**
	 * @param userid
	 *            ユーザID
	 * @param password
	 *            パスワード
	 * @throws Exception
	 *
	 */
	public void addUser(String userid, String password) throws Exception {
		// ログイン
		ConnectionManager cm = ConnectionManager.getInstance();

		// 更新系処理
		String sql = "INSERT INTO m_user (user_id, password) VALUE (?, ?)";
		try (Connection con = cm.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, userid);
			pstmt.setString(2, password);
			pstmt.executeUpdate();

		} catch (Exception e) {//例外処理
			throw new Exception ();
		}

	}






}
