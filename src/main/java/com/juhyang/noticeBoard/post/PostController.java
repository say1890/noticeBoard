package com.juhyang.noticeBoard.post;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.juhyang.noticeBoard.post.bo.PostBO;
import com.juhyang.noticeBoard.post.model.Criteria;
import com.juhyang.noticeBoard.post.model.PageMaker;
import com.juhyang.noticeBoard.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	@Autowired
	PostBO postBO;
	
	@GetMapping("/create_view")
	public String createView() {
			return "/post/createView";
		}
	
	@GetMapping("/list_view")
	public String listView(Model model, Criteria cri) {
		
			model.addAttribute("postlist", postBO.getPostList(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(postBO.listCount());
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "/post/listView";
		}
	
	@GetMapping("/detail_view")
	public String detailView(@RequestParam("postId") int postId,
			Model model) {
		Post post = postBO.getPost(postId);
		model.addAttribute("post", post);
		return "/post/detailView";
	}
}
