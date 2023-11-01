package com.myweb.www.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.net.ssl.SSLEngineResult.Status;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.FileHandler;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	@Inject
	private BoardService bsv;
	
	@Inject
	private FileHandler fh;
	
	@GetMapping("/register")
	public void register() { }
	
	@PostMapping("/register")
	public String register(BoardVO bvo, @RequestParam(name="files", required = false)MultipartFile[] files) {
		List<FileVO> flist = new ArrayList<>();
		//file upload handler 생성
		if(files[0].getSize()>0) {
			flist = fh.uploadFiles(files);
		}
		int isOk = bsv.insert(new BoardDTO(bvo, flist));
		return "redirect:/board/list";
	}
	//paging 추가
	@GetMapping("/list")
	public String list(Model model, PagingVO pgvo) {
		List<BoardVO> list = bsv.getList(pgvo);
		model.addAttribute("list", list);
		//페이징 처리
		//총페이지 개수
		int totalcount = bsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalcount);
		model.addAttribute("ph", ph);
		return "/board/list";
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(Model model, @RequestParam("bno")long bno) {
		BoardDTO bdto = bsv.detail(bno);
		model.addAttribute("BoardDTO", bdto);
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo, @RequestParam(name="files", required = false)MultipartFile[] files) {
		List<FileVO> flist = new ArrayList<>();
		if(files[0].getSize()>0) {
			flist = fh.uploadFiles(files);
		}
		BoardDTO bdto = new BoardDTO(bvo, flist);
		int isOk = bsv.modify(bdto);
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno")long bno) {
		int isOk = bsv.remove(bno);
		return "redirect:/board/list";
	}
	
	@DeleteMapping(value="/delete", consumes = "application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> deleteFile(@RequestBody FileVO fvo){
		log.info("fvo >>>> " + fvo);
		int isOk = bsv.deleteFile(fvo);
		return isOk>0? new ResponseEntity<String>("1",HttpStatus.OK) : new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
