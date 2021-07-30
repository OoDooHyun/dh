package du.reply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import du.reply.domain.ReplyVO;
import du.reply.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;

	@RequestMapping("replyWrite.do")
	public String replyWrite(HttpSession session, @ModelAttribute ReplyVO reply) {
		
		replyService.insertReply(session, reply);
		
		return "redirect:/boardInfoPage/"+ Long.toString(reply.getBoardIdx()) + ".do";
	}
	
	@RequestMapping("replyDelete.do")
	public String replyDelete(long idx, String boardIdx) {
		replyService.deleteReply(idx);
		return "redirect:/boardInfoPage/"+ boardIdx + ".do";
	}
	
	@RequestMapping("replyModify.do")
	public String replyModify(@ModelAttribute ReplyVO reply) {
		replyService.updateReply(reply);
		
		return "redirect:/boardInfoPage/"+ Long.toString(reply.getBoardIdx()) + ".do";
	}
}