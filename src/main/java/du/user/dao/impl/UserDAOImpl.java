package du.user.dao.impl;

import org.springframework.stereotype.Repository;

import du.user.dao.UserDAO;
import du.user.domain.UserVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class UserDAOImpl extends EgovAbstractMapper implements UserDAO {
	@Override
	public String selectPwd(String id) {
		return selectOne("User.selectPwd", id);
	}
	
	@Override
	public UserVO selectUserInfo(String id) {
		return selectOne("User.selectUserInfo", id);
	}
	
	@Override
	public void insertUser(UserVO user) {
		insert("User.insertUser", user);
	}

	@Override
	public void updateUser(UserVO user) {
		update("User.updateUser",user);
		
	}

	@Override
	public void deleteUser(String userId) {
		delete("User.deleteUser", userId);
		
	}
	
	
}
