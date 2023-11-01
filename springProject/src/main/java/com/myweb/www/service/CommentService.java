package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

public interface CommentService {

	int whydontknow(CommentVO cvo);

//	List<CommentVO> getList(long bno);

	int delete(CommentVO cvo);

	int modi(CommentVO cvo);

	PagingHandler getList(long bno, PagingVO pgvo);

	void cmtCnt(long bno);


}
