package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import entity.EmployeeBean;

public class LicenseGetDAO {

	/**
	 * @param userid
	 *            ユーザID
	 * @param password
	 *            パスワード
	 * @return
	 * @throws Exception
	 *
	 */
	public void License(String license, String empCode) throws Exception {
		// ログイン
		ConnectionManager cm = ConnectionManager.getInstance();

		// 更新系処理
		String sql = "UPDATE m_employee SET license_cd =? WHERE emp_code =?";
		try (Connection con = cm.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, license);
			pstmt.setString(2, empCode);
			pstmt.executeUpdate();

		} catch (Exception e) {// 例外処理
			throw new Exception();
		}

	}

	public ArrayList<EmployeeBean> LicenseGet() {
		// コネクション
		ConnectionManager cm = ConnectionManager.getInstance();

		// itemListの宣言
		ArrayList<EmployeeBean> LicenseList = new ArrayList<EmployeeBean>();

		// データベースへの接続
		// ステートメントの作成
		try (Connection con = cm.getConnection(); Statement stmt = con.createStatement()) {
			ResultSet res = stmt.executeQuery("SELECT * FROM m_license");

			// 検索結果をemp2に格納
			while (res.next()) {
				EmployeeBean emp2 = new EmployeeBean();
				emp2.setLicenseCode(res.getString("license_cd"));
				emp2.setLicenseName(res.getString("license_name"));
				// 受け取った結果をリストに格納
				LicenseList.add(emp2);
			}
			// 例外時処理
		} catch (Exception e) {
			e.printStackTrace();
		}

		// LicenseListを返す
		return LicenseList;
	}
}
