package du.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import du.species.Service.SpeciesService;
import du.species.domain.SpeciesVO;
import du.user.domain.UserVO;
import du.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private SpeciesService speciesService;
	
	@RequestMapping("/userInfoConfirmPage.do")
	public String userInfoConfirmPage() {
		return "user/userinfoConfirm.jsp";
	}
	
	@RequestMapping("/userInfoConfirm.do")
	public ModelAndView userInfoConfirm(UserVO user) {
		if(userService.selectPwd(user.getUserId(), user.getPwd())) {
			ModelAndView mav = new ModelAndView("user/userinfo.jsp");
			List<SpeciesVO> species = speciesService.selectSpeciesList();
			mav.addObject("species", species);
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("main.jsp");
		return mav;
		}
	}
	@RequestMapping("/signUpPage.do")
	public ModelAndView signUpPage() {
		ModelAndView mav = new ModelAndView("user/signUp.jsp");
		List<SpeciesVO> species = speciesService.selectSpeciesList();
		mav.addObject("species",species);
		return mav;
	}

	@RequestMapping("/signUp.do")
	public String signUp(UserVO user) {
		userService.insertUser(user);
		return "redirect:/loginPage.do";
	}
	
	@RequestMapping("/userModify.do")
	public String userModify(UserVO user) {
		userService.updateUser(user);
		return "redirect:/logout.do";
	}
	
	@RequestMapping("/userDelete.do")
	public String userDelete(HttpSession session) {
		userService.deleteUser(session);
		return "redirect:/loginPage.do";
	}
}