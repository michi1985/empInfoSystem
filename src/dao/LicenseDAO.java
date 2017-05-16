package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LicenseDAO {

	public void SetLicense(String lCode, String lName) {

		ConnectionManager cm = ConnectionManager.getInstance();

		try (Connection con = cm.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO m_license(license_cd, license_name) VALUES (?,?);")) {

			// ステートメントにを格納
			pstmt.setString(1, lCode);
			pstmt.setString(2, lName);

			// ステートメントの実行
			pstmt.executeUpdate();

			// 例外処理
		} catch (SQLException e) {

			// 例外処理
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
