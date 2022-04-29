package com.juhyang.noticeBoard.memo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.noticeBoard.memo.model.Criteria;
import com.juhyang.noticeBoard.memo.model.Memo;

@Repository	
public interface MemoDAO {
	
	public int insertMemo(

			@Param("subject") String subject, 
			@Param("content") String content,
			@Param("imagePath") String imagePath);

	public List<Memo> selectMemoList(Criteria cri);
	
	public Memo selectMemo(@Param("memoId")int memoId);
	
	public int deleteMemo(@Param("memoId")int memoId);
	
	
	
	// 게시물 총 개수 
	public int countBoard();

	
	public int selectFile(@Param("memoId")int memoId);

	// 조회수
	public void increaseView(@Param("memoId")int memoId);

	public List<Memo> selectPopularMemos();

  public void resetId();
}
