package com.juhyang.noticeBoard.post.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.noticeBoard.common.FileManagerService;
import com.juhyang.noticeBoard.post.dao.PostDAO;
import com.juhyang.noticeBoard.post.model.Criteria;
import com.juhyang.noticeBoard.post.model.Post;

@Service
public class PostBO {
	@Autowired
	PostDAO postDAO;
	
	
	

	public Post getPost(int postId) {
		return postDAO.selectPost(postId);
	}
	
	public List<Post> getPostList(Criteria cri){
		return postDAO.selectPostList(cri);
	}
	
	
	public int addPost(String subject, String content, MultipartFile file) {
		String filePath = FileManagerService.savefile(file);
		return postDAO.insertPost( subject, content, filePath);
	}
	
	public int deletePost(int postId) {
		Post post = postDAO.selectPost(postId);
		
		String isFileExist = postDAO.selectPost(postId).getImagePath();
		if(isFileExist!=null) {
			FileManagerService.removeFile(post.getImagePath());
		}
		
		return postDAO.deletePost(postId);
	}
	
	// 포스트가 몇 개 있는지 확인
	public int listCount() {
		return postDAO.countBoard();
	}
	
	
	
}
