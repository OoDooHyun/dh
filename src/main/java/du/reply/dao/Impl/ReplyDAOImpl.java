package du.reply.dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import du.reply.dao.ReplyDAO;
import du.reply.domain.ReplyVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class ReplyDAOImpl extends EgovAbstractMapper implements ReplyDAO{

	@Override
	public void insertReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		insert("Reply.insertReply", reply);
	}

	@Override
	public List<ReplyVO> selectReplyList(long boardIdx) {
		// TODO Auto-generated method stub
		return selectList("Reply.selectReplyList", boardIdx);
	}

	@Override
	public void deleteReply(long Idx) {
		// TODO Auto-generated method stub
		delete("Reply.deleteReply", Idx);
	}

	@Override
	public void updateReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		update("Reply.updateReply", reply);
	}

	

	
}