package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.SectionBean;

public class SectionDao {

	/**
	 * 部署名の一覧を取得
	 * @return 部署名と部署コードの一覧List
	 */
	public List<SectionBean> selectAllSection(){
		ConnectionManager cm = ConnectionManager.getInstance();
		List<SectionBean> sectionList = new ArrayList<>();

		try(Connection con = cm.getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT * FROM m_section");){

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				SectionBean sb = new SectionBean();
				sb.setSectionCode(rs.getString("section_code"));
				sb.setSectionName(rs.getString("section_name"));
				sectionList.add(sb);
			}

		}catch(Exception e){
			sectionList = null;
		}
		return sectionList;

	}

}
