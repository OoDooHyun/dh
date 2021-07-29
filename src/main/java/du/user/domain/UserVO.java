package du.user.domain;

public class UserVO {
	
	private String userId;
	
	private String pwd;
	
	private String nickname;
	
	private String speciesShow;
	
	private String job;
	
	private String phone;
	
	private String userEmail;
	
	private String speciesNm;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSpeciesShow() {
		return speciesShow;
	}

	public void setSpeciesShow(String speciesShow) {
		this.speciesShow = speciesShow;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getspeciesNm() {
		return speciesNm;
	}

	public void setspeciesNm(String speciesNm) {
		this.speciesNm = speciesNm;
	}
	
}