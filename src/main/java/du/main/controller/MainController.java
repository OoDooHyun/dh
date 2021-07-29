package du.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import du.user.domain.UserVO;
import du.user.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String mainPage(HttpServletRequest request,@ModelAttribute UserVO user) {
		if(userService.loginProcess(request,user)){
			return "main.jsp";
		} else {
			return "login.jsp";
		}
	}
	
	@RequestMapping("/loginPage.do")
	public String loginPage() {
		return "login.jsp";
	}
	
	
	@RequestMapping("/userInfo.do")
	public String userInfo() {
		return "user/userinfo.jsp";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("USER");
		return "login.jsp";
	}
	
	@RequestMapping("/mainPage.do")
	public String mainPage(HttpSession session) {
		
		if(session.getAttribute("USER") == null) {
		return "redirect:/loginPage.do";
	}
	return "main.jsp";
	}
}

