package com.juhyang.noticeBoard.memo.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.noticeBoard.common.FileManagerService;
import com.juhyang.noticeBoard.memo.dao.MemoDAO;
import com.juhyang.noticeBoard.memo.model.Criteria;
import com.juhyang.noticeBoard.memo.model.Memo;

@Service
public class MemoBO {
	@Autowired
	MemoDAO memoDAO;
	
	
	

	public Memo getMemo(int memoId) {
		return memoDAO.selectMemo(memoId);
	}
	
	public List<Memo> getMemoList(Criteria cri){
		return memoDAO.selectMemoList(cri);
	}
	
	
	public int addMemo(String subject, String content, MultipartFile file) {
		String filePath = FileManagerService.savefile(file);
		return memoDAO.insertMemo( subject, content, filePath);
	}
	
	public int deleteMemo(int memoId) {
		Memo Memo = memoDAO.selectMemo(memoId);
		
		String isFileExist = memoDAO.selectMemo(memoId).getImagePath();
		if(isFileExist!=null) {
			FileManagerService.removeFile(Memo.getImagePath());
		}
		// 게시글 삭제로 인해 흐트러진 auto increment 바로잡기 
		memoDAO.resetId();
		return memoDAO.deleteMemo(memoId);
	}
	
	// 포스트가 몇 개 있는지 확인
	public int listCount() {
		return memoDAO.countBoard();
	}

	public void addViews(int memoId) {
		memoDAO.increaseView(memoId);
		
	}

	public List<Memo> getPopularMemoList() {
		return memoDAO.selectPopularMemos();
	}

  
	
	
}
