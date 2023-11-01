package com.myweb.www.handler;

import java.util.List;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingHandler {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int totalCount;
	private PagingVO pgvo;
	private int realEndPage;
	
	private List<CommentVO> cmtList;
	
	public PagingHandler(PagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		this.endPage = (int)Math.ceil(pgvo.getPageNo() / (double)pgvo.getQty())*pgvo.getQty();
		
		this.startPage = endPage - 9;
		
		//여기서 나오는 qty => 올림(전체 글수 / 한페이지에서 표시되는 게시글수)
		this.realEndPage = (int)Math.ceil(totalCount/(double)pgvo.getQty());
		if(realEndPage<endPage) {
			this.endPage=realEndPage;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
	}
	
	public PagingHandler(PagingVO pgvo, int totalCount, List<CommentVO> cmtList) {
		this(pgvo, totalCount);
		this.cmtList = cmtList;
	}
}
