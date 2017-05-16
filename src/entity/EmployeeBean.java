package entity;

import java.io.Serializable;

public class EmployeeBean implements Serializable {
	// フィールド宣言
	private String empCode; // 従業員コード
	private String lName; // 氏名（苗字）
	private String fName; // 氏名（名前）
	private String lKanaName; // 苗字（カナ）
	private String fKanaName; // 名前（カナ）
	private String sex; // 性別
	private String birthDay; // 生年月日
	private String sectionCode; // 所属部署
	private String empDate; // 入社日
	// 3/1に追加：
	private String licenseCode; // 資格コード
	private String licenseName; // 資格名
	private String sectionName;


	// アクセッサメソッド群
	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlKanaName() {
		return lKanaName;
	}

	public void setlKanaName(String lKanaName) {
		this.lKanaName = lKanaName;
	}

	public String getfKanaName() {
		return fKanaName;
	}

	public void setfKanaName(String fKanaName) {
		this.fKanaName = fKanaName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getSectionCode() {
		return sectionCode;
	}

	public void setSectionCode(String sectionCode) {
		this.sectionCode = sectionCode;
	}

	public String getEmpDate() {
		return empDate;
	}

	public void setEmpDate(String empDate) {
		this.empDate = empDate;
	}

	public String getLicenseCode() {
		return licenseCode;
	}

	public void setLicenseCode(String licenseCode) {
		this.licenseCode = licenseCode;
	}

	public String getLicenseName() {
		return licenseName;
	}

	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}

	public String getSectionName() {
		return this.sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

}
