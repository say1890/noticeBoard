package com.juhyang.noticeBoard.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.juhyang.noticeBoard.post.model.Criteria;
import com.juhyang.noticeBoard.post.model.Post;


public interface PostDAO {
	
	public int insertPost(

			@Param("subject") String subject, 
			@Param("content") String content,
			@Param("imagePath") String imagePath);

	public List<Post> selectPostList(Criteria cri);
	
	public Post selectPost(@Param("postId")int postId);
	
	public int deletePost(@Param("postId")int postId);
	
	
	
	// 게시물 총 개수 
	public int countBoard();

	
	public int selectFile(@Param("postId")int postId);
}
