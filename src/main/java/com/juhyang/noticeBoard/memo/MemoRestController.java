package com.juhyang.noticeBoard.memo;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.juhyang.noticeBoard.memo.bo.MemoBO;

@RestController
@RequestMapping("/memo")
public class MemoRestController {

	@Autowired
	MemoBO memoBO;
	
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("content") String content,
			@RequestParam("subject") String subject,
			@RequestParam(value ="file",required = false )MultipartFile  file,
			HttpServletRequest request
			) {

		int count = memoBO.addMemo(subject, content, file);
		
		
		Map<String, String> result = new HashMap<>();
		
		
		if(count ==1)
		{
			result.put("result","success");
		}
		else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	@GetMapping("/delete")
	public Map<String, String> memoDelete(@RequestParam("memoId") int memoId){
		Map<String,String> result = new HashMap<>();

		
		int count = memoBO.deleteMemo(memoId);
		if(count ==1)
		{
			result.put("result","success");
		}
		else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	
	
	
	
}
