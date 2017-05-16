package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * EmpDeleteのDAOクラス
 *
 */
public class EmpDeleteDAO {
	/**
	 * 対象のempCodoをもつデータをDBから削除
	 * @param empcode 従業員番号
	 * @return 従業員番号
	 */
	public String delete(String empcode) {
		// ログイン
		ConnectionManager cm = ConnectionManager.getInstance();

		String sql = "DELETE FROM m_employee WHERE emp_code=?";
		try (Connection con = cm.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// ？に先に値を入れる
			pstmt.setString(1, empcode);
			// 更新系処理
			int count = pstmt.executeUpdate();
		} catch (SQLException e) {

		} catch (Exception e) {

		}
		return empcode;

	}

}