package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.CommentDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService{
	@Inject
	private CommentDAO cdao;

	@Inject
	private BoardDAO bdao;
	
	@Override
	public int whydontknow(CommentVO cvo) {
		return cdao.whydontknow(cvo);
	}

//	@Override
//	public List<CommentVO> getList(long bno) {
//		return cdao.getList(bno);
//	}

	@Override
	public int delete(CommentVO cvo) {
		return cdao.delete(cvo);
	}

	@Override
	public int modi(CommentVO cvo) {
		return cdao.modi(cvo);
	}

	@Transactional
	@Override
	public PagingHandler getList(long bno, PagingVO pgvo) {
		//totalCount
		int totalCount = cdao.getCount(bno);
		//Comment List
		List<CommentVO> list = cdao.getselectList(bno, pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount, list);
		//PagingHandler 값 완성해서 리턴
		return ph;
	}

	@Override
	public void cmtCnt(long bno) {
		int cmtCount = cdao.cmtCount(bno);
		bdao.cmtCntUp(cmtCount, bno);
	}

}
