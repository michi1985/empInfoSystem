package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entity.EmployeeBean;

/**
 * 従業員情報更新のDAOクラス
 *
 */
public class EmpUpdateDAO {

	/**
	 * 従業員情報を更新するメソッド
	 * @param emp 更新内容を格納したemployeeBean
	 * @return count 更新が完了したら1、エラーの場合は0を返す
	 */
	public int empUpdate(EmployeeBean emp){
		ConnectionManager cm = ConnectionManager.getInstance();
		int count = 0;  // 更新処理の完了を判定するための変数

		String sql = "UPDATE emp_sys_db.m_employee SET emp_code = ?, l_name = ?, f_name = ?, "
				+ "l_kana_name = ?, f_kana_name = ?, sex = ?, birth_day = ?, "
				+ "section_code = ?, emp_date = ? WHERE emp_code = ?;";
		try (Connection con = cm.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			// form からの情報を取得する
			String empCode = emp.getEmpCode();
			String lName = emp.getlName();
			String fName = emp.getfName();
			String lKanaName = emp.getlKanaName();
			String fKanaName = emp.getfKanaName();
			String sex = emp.getSex();
			String birthDay = emp.getBirthDay();
			String sectionCode = emp.getSectionCode();
			String empDate = emp.getEmpDate();

			// ？に値を入れる
			pstmt.setString(1, empCode);
			pstmt.setString(2, lName);
			pstmt.setString(3, fName);
			pstmt.setString(4, lKanaName);
			pstmt.setString(5, fKanaName);
			pstmt.setString(6, sex);
			pstmt.setString(7, birthDay);
			pstmt.setString(8, sectionCode);
			pstmt.setString(9, empDate);
			pstmt.setString(10, empCode);

			count = pstmt.executeUpdate();

		}catch(Exception e){

		}
		return count;
	}
}
