package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class EmpInsertDao {
	/**
	 * データ登録用の社員番号を取得する
	 * @return 次の社員番号
	 */
	public int getNextEmpId(){
		String sql = "select emp_code From m_employee order by emp_code + 0;";
		int empCode = 0;

		ConnectionManager cm = ConnectionManager.getInstance();
		try(Connection db = cm.getConnection();
				PreparedStatement ps = db.prepareStatement(sql);){

			ResultSet rs = ps.executeQuery();
			if(rs.last()){
				empCode = Integer.parseInt(rs.getString("emp_code"));
			}
		} catch (Exception e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		return empCode;
	}

	/**
	 * 社員データをDBに登録する
	 * @param empCode 社員番号
	 * @param lName 苗字
	 * @param fName 名前
	 * @param lKanaName 苗字(カナ)
	 * @param fKanaName 名前(カナ)
	 * @param sex 性別
	 * @param birthDay 誕生日
	 * @param sectionCode 部署コード
	 * @return 登録件数
	 */
	public int empInsert(int empCode, String lName, String fName, String lKanaName, String fKanaName,
							String sex, String birthDay, String sectionCode, String empDay){
		String sql = "INSERT INTO m_employee(emp_code, l_name, f_name, l_kana_name, f_kana_name, sex, birth_day, section_code, emp_date)"
				+" VALUES (?,?,?,?,?,?,?,?,?)";

		int count = -1;
		ConnectionManager cm = ConnectionManager.getInstance();
		try(Connection db = cm.getConnection();
				PreparedStatement ps = db.prepareStatement(sql);){
			ps.setString(1, String.valueOf(empCode + 1));
			ps.setString(2, lName);
			ps.setString(3, fName);
			ps.setString(4, lKanaName);
			ps.setString(5, fKanaName);
			ps.setString(6, sex);
			ps.setString(7, birthDay);
			ps.setString(8, sectionCode);
			ps.setString(9, empDay);

			count = ps.executeUpdate();

		} catch (Exception e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		return count;
	}
}
