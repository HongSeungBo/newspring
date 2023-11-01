package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;

public interface BoardService {

//	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	BoardDTO detail(long bno);

	int modify(BoardDTO bdto);

	int remove(long bno);

	int getTotalCount(PagingVO pgvo);

	int insert(BoardDTO boardDTO);

	int modiFile(String uuid, long bno);

	int deleteFile(FileVO fvo);

}
