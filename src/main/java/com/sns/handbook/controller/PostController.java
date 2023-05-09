package com.sns.handbook.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.dto.CommentDto;
import com.sns.handbook.dto.FollowingDto;
import com.sns.handbook.dto.PostDto;
import com.sns.handbook.dto.PostlikeDto;
import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.PostService;
import com.sns.handbook.serivce.PostlikeService;
import com.sns.handbook.serivce.UserService;

@Controller
public class PostController {

	@Autowired
	PostService pservice;

	@Autowired
	PostlikeService plservice;
	
	@Autowired
	UserService uservice;
	

	@GetMapping("/post/write")
	public String write() {
		return "/post/post_writeform";
	}

	@GetMapping("/post/timeline")
	@ResponseBody
	public ModelAndView list(@RequestParam(defaultValue = "0") int offset ,HttpSession session,
			@RequestParam(required = false) String searchcolumn,
			@RequestParam(required = false) String searchword) {
		
		List<PostDto> list = pservice.postList(searchcolumn, searchword, offset);
		for(int i = 0; i<list.size(); i++) {
			UserDto dto = uservice.getUserByNum(list.get(i).getUser_num()); //여러가지 수많은 데이터에서 i번째 데이터만 가져오기, 여기서 필요한 상대방 num을 list에서 뽑아옴
			list.get(i).setUser_name(dto.getUser_name());// 위에서 dto에서 name photo를 뽑아내서 리스트에 set을 해줌
			list.get(i).setUser_photo(dto.getUser_photo());
			list.get(i).setLike_count(plservice.getTotalLike(list.get(i).getPost_num()));
			list.get(i).setLikecheck(plservice.checklike((String)session.getAttribute("user_num"),list.get(i).getPost_num() ));
			
		}
		
		
		ModelAndView model = new ModelAndView();
		int totalCount = pservice.getTotalCount();
		model.addObject("offset", offset);
		model.addObject("searchcolumn",searchcolumn);
		model.addObject("total", totalCount);
		model.addObject("list", list);

		model.setViewName("/post/post_timeline");
		return model;
	}
	

	@PostMapping("/post/insert")
	@ResponseBody
	public void insertPost(@ModelAttribute PostDto dto, @RequestParam(required = false) MultipartFile photo,
			HttpSession session) {

		String path = session.getServletContext().getRealPath("/post_file");

		if (photo == null) {
			dto.setPost_file("no");
			pservice.insertPost(dto);

		} else {// upload 한 경우

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			String fileName = "f_" + sdf.format(new Date()) + photo.getOriginalFilename();

			dto.setPost_file(fileName);

			try {
				photo.transferTo(new File(path + "\\" + fileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			pservice.insertPost(dto);
		}
	}

	// delete
	@GetMapping("/post/delete")
	public void delete(@RequestParam int post_num) {

		pservice.deletePost(post_num);
	}

	@PostMapping("/post/updatephoto")
	@ResponseBody
	public void photoUpload(String post_num, @RequestParam(required = false) MultipartFile photo, HttpSession session) {
		// 업로드될 경로구하기
		String path = session.getServletContext().getRealPath("/post_file");

		// 파일명구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "f_" + sdf.format(new Date()) + photo.getOriginalFilename();

		try {
			photo.transferTo(new File(path + "\\" + fileName));

			pservice.updatePhoto(post_num, fileName); // db사진 수정
			session.setAttribute("post_file", fileName); // 세션의 사진변경

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@GetMapping("/post/updateform")
	@ResponseBody
	public PostDto getData(String post_num) {

		return pservice.getDataByNum(post_num);
	}

	// 수정
	@PostMapping("/post/update")
	@ResponseBody
	public void update(PostDto dto, HttpSession session) {
		pservice.updatePost(dto);

	}
	
	@GetMapping("/post/scroll")
	@ResponseBody
	public List<PostDto> scroll (int offset ,
			@RequestParam(required = false) String searchcolumn,
			@RequestParam(required = false) String searchword) {
		
		List<PostDto> list=pservice.postList(searchcolumn, searchword, offset);
		
		
		return list;
	}

	@GetMapping("/post/checklike")
	@ResponseBody
	public Map<String, Integer> checklike(String user_num,String post_num){
		Map<String, Integer> map= new HashMap<>();
		
		map.put("checklike", plservice.checklike(user_num, post_num));
		
		return map;
	}
	
	@GetMapping("/post/likeinsert")
	@ResponseBody
	public void insertLike(@ModelAttribute PostlikeDto dto) {
		
		
		plservice.insertLike(dto);
	}
	
	@GetMapping("/post/likedelete")
	@ResponseBody
	public void deleteFollowing(String post_num,String user_num) {
		
		plservice.deleteLike(post_num,user_num);
	}
	
	
}