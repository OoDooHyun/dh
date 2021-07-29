package du.user.dao;

import du.user.domain.UserVO;

public interface UserDAO {
	public String selectPwd(String id);
	
	public UserVO selectUserInfo(String id);
	
	public void insertUser(UserVO user);
	
	public void updateUser(UserVO user);
	
	public void deleteUser(String userId);
}
