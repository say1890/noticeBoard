package com.juhyang.noticeBoard.post;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

			List<Post> popular = postBO.getPopularPostList();
			model.addAttribute("popularPosts", popular);
			
			return "/post/listView";
		}
	
	@GetMapping("/detail_view")
	public String detailView(
			@RequestParam("postId") int postId,
			Model model,
			HttpServletRequest request,
			HttpServletResponse response
			) {
		Post post = postBO.getPost(postId);
		model.addAttribute("post", post);
		
		List<Post> popular = postBO.getPopularPostList();
		model.addAttribute("popularPosts", popular);
		
		/* 중복 조회 막기 */
		Cookie oldCookie = null;
		
	    Cookie[] cookies = request.getCookies();
	 
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }

	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + postId + "]")) {
	        	postBO.addViews(postId);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + postId + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	postBO.addViews(postId);
	        Cookie newCookie = new Cookie("postView","[" + postId + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);             //	24*60*60-> 24번*60번*60초=24시간동안 저장됨
	        response.addCookie(newCookie);
	    }

	   
	    
		return "/post/detailView";
	}
	
	
}
