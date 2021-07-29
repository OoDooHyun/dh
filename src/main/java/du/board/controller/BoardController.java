package du.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import du.board.domain.BoardVO;
import du.board.service.BoardService;
import du.common.Pagination;
import du.user.domain.UserVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/boardListPage.do")
	public ModelAndView boardListPage(
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String title) {
		
		ModelAndView mav = new ModelAndView("board/boardList.jsp");
		
		int listCnt = boardService.selectBoardListCnt(title);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		mav.addObject("pagination", pagination);
		
		List<BoardVO> boardList = boardService.selectBoardList(pagination, title);
		mav.addObject("boardList", boardList);
		
		mav.addObject("title", title);
		
		return mav;
	}
	
	@RequestMapping("/boardWritePage.do")
	public String boardWritePage(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("USER");
		
		return "board/boardWrite.jsp";
	}
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite(HttpSession session, @ModelAttribute BoardVO board) {
		boardService.insertBoard(board, session);
		
		return "redirect:/boardListPage.do";
	}
	
	@RequestMapping("/boardInfoPage/{idx}.do")
	public ModelAndView boardInfoPage(@PathVariable("idx") long idx) {
		ModelAndView mav = new ModelAndView("board/boardInfo.jsp");
		
		BoardVO board = boardService.selectBoard(idx);
		mav.addObject("board", board);
		
		return mav;
	}
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(long idx) {
		boardService.deleteBoard(idx);
		
		return "redirect:/boardListPage.do";
	}

	@RequestMapping("/boardModifyPage.do")
	public ModelAndView boardModifyPage(long idx) {
		ModelAndView mav = new ModelAndView("board/boardModify.jsp");
		
		BoardVO board = boardService.selectBoard(idx);
		mav.addObject("board", board);
		
		return mav;
	}
	
	@RequestMapping("/boardModify.do")
	public String boardModify(@ModelAttribute BoardVO board) {
		boardService.updateBoard(board);

		return "redirect:/boardInfoPage/"+Long.toString(board.getIdx())+".do";
	}
}
