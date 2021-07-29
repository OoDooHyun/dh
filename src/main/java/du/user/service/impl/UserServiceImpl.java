package du.user.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import du.user.dao.UserDAO;
import du.user.domain.UserVO;
import du.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public Boolean selectPwd(String id, String password) {
		if(password.equals(userDAO.selectPwd(id))){
			return true;
		} else {
			return false;
		}
	}

	@Override
	public UserVO selectUserInfo(String id) {
		return userDAO.selectUserInfo(id);
	}

	@Override
	public Boolean loginProcess(HttpServletRequest request, UserVO user) {
		
		if(selectPwd(user.getUserId(),user.getPwd())) {
			setSession(request, user);
			return true;
		}else {
			return false;
		}
		// TODO Auto-generated method stub
		
	}
	
	//세션 설정
	public void setSession(HttpServletRequest request, UserVO user) {
		
	UserVO userInfo = selectUserInfo(user.getUserId());
	
	if(userInfo != null) {
		
		HttpSession httpSession = request.getSession(true);
		
		httpSession.setAttribute("USER",userInfo);
	}
	
	}
	
	@Override
	public void insertUser(UserVO user) {
		userDAO.insertUser(user);
	}

	@Override
	public void updateUser(UserVO user) {
		if(user.getPwd().isEmpty()) {
			user.setPwd(userDAO.selectPwd(user.getUserId()));
		}
		userDAO.updateUser(user);
		
	}

	@Override
	public void deleteUser(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("USER");
		
		userDAO.deleteUser(user.getUserId());
		
	}
	
}

