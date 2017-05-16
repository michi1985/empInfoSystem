package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import entity.EmployeeBean;

/**
 * EmployeeのDAOクラス
 *
 */
public class EmployeeDAO {

	public ArrayList<EmployeeBean> SelectAll() {
		// コネクション
		ConnectionManager cm = ConnectionManager.getInstance();

		// itemListの宣言
		ArrayList<EmployeeBean> EmpList = new ArrayList<EmployeeBean>();

		// データベースへの接続
		// ステートメントの作成
		try (Connection con = cm.getConnection();
				Statement stmt = con.createStatement()) {

			ResultSet res = stmt.executeQuery("SELECT e.emp_code, e.l_name, e.f_name, e.l_kana_name, e.f_kana_name,"
											+"e.sex, e.birth_day,s.section_name, e.emp_date, l.license_name from m_employee e "
											+"left join m_section s on e.section_code = s.section_code "
											+"left join m_license l on e.license_cd = l.license_cd "
											+"order by emp_code + 0");

			// 検索結果をempに格納
			while (res.next()) {
				EmployeeBean emp = new EmployeeBean();
				emp.setEmpCode(res.getString("emp_code"));
				emp.setlName(res.getString("l_name"));
				emp.setfName(res.getString("f_name"));
				emp.setlKanaName(res.getString("l_kana_name"));
				emp.setfKanaName(res.getString("f_kana_name"));
				emp.setSex(res.getString("sex"));
				emp.setBirthDay(res.getString("birth_day"));
				emp.setSectionName(res.getString("section_name"));
				emp.setEmpDate(res.getString("emp_date"));
				// 3/1追加：
				if(res.getString("license_name") == null){
					emp.setLicenseName("");
				}else{
					emp.setLicenseName(res.getString("license_name"));
				}


				// 受け取った結果をリストに格納
				EmpList.add(emp);
			}
			// 例外時処理
		} catch (Exception e) {
			e.printStackTrace();
		}

		// EmpListを返す
		return EmpList;
	}

	/**
	 * emp_codeをキーにして該当データを検索
	 * @param empCode
	 * @return 該当の従業員コード
	 */
	public EmployeeBean whereEmpCodeSelect(String empCode){
		ConnectionManager cm = ConnectionManager.getInstance();
		EmployeeBean emp = null;// = new EmployeeBean();

		// PrintWriter pw = response.getWriter();

		String sql = "SELECT * FROM m_employee WHERE emp_code=?";
		try (Connection con = cm.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {
			// ？に値を入れる
			pstmt.setString(1, empCode);
			// 更新系処理
			ResultSet res = pstmt.executeQuery();
			if (res.next()) {
				emp = new EmployeeBean();
				emp.setlName(res.getString("l_name"));
				emp.setfName(res.getString("f_name"));
				emp.setlKanaName(res.getString("l_kana_name"));
				emp.setfKanaName(res.getString("f_kana_name"));
				emp.setSex(res.getString("sex"));
				emp.setBirthDay(res.getString("birth_day"));
				emp.setSectionCode(res.getString("section_code"));
				emp.setEmpDate(res.getString("emp_date"));
			}
		}catch(Exception e){

		}
		return emp;
	}
}
