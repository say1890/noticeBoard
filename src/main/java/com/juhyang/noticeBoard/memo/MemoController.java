package com.juhyang.noticeBoard.memo;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.juhyang.noticeBoard.memo.bo.MemoBO;
import com.juhyang.noticeBoard.memo.model.Criteria;
import com.juhyang.noticeBoard.memo.model.PageMaker;
import com.juhyang.noticeBoard.memo.model.Memo;

@Controller
@RequestMapping("/memo")
public class MemoController {
  
  @Autowired
  MemoBO memoBO;
  
  @GetMapping("/create_view")
  public String createView() {
    return "/memo/createView";
  }
  
  @GetMapping("/list_view")
  public String listView(Model model, Criteria cri) {
    
    model.addAttribute("memolist", memoBO.getMemoList(cri));
    
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    pageMaker.setTotalCount(memoBO.listCount());
    
    model.addAttribute("pageMaker", pageMaker);
    
    List<Memo> popular = memoBO.getPopularMemoList();
    model.addAttribute("popularMemos", popular);
    
    
    
    
    return "/memo/listView";
  }
  
  @GetMapping("/detail_view")
  public String detailView(@RequestParam("memoId") int memoId, Model model,
      HttpServletRequest request, HttpServletResponse response) {
    Memo memo = memoBO.getMemo(memoId);
    model.addAttribute("memo", memo);
    
    List<Memo> popular = memoBO.getPopularMemoList();
    model.addAttribute("popularMemos", popular);
    
    /* 중복 조회 막기 */
    Cookie oldCookie = null;
    
    Cookie[] cookies = request.getCookies();
    
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if (cookie.getName().equals("memoView")) {
          oldCookie = cookie;
        }
      }
    }
    
    if (oldCookie != null) {
      if (!oldCookie.getValue().contains("[" + memoId + "]")) {
        memoBO.addViews(memoId);
        oldCookie.setValue(oldCookie.getValue() + "_[" + memoId + "]");
        oldCookie.setPath("/");
        oldCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(oldCookie);
      }
    } else {
      memoBO.addViews(memoId);
      Cookie newCookie = new Cookie("memoView", "[" + memoId + "]");
      newCookie.setPath("/");
      newCookie.setMaxAge(60 * 60 * 24); // 24*60*60-> 24번*60번*60초=24시간동안 저장됨
      response.addCookie(newCookie);
    }
    
    return "/memo/detailView";
  }
  
  
}
