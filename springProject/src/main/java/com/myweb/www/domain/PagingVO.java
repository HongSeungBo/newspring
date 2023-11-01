package com.myweb.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
@Slf4j
public class PagingVO {
	private int pageNo;
	private int qty;
	private String type;
	private String keyword;
	
	public PagingVO() {
		this(1, 10);
	}
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	//limit 시작, qty : 시작 페이지 번호 구하기
	//pageNo 1 2 3 4
	//0,10 /10,10 /20,10...
	public int getPageStart() {
		return (this.pageNo-1)*qty;
	}
	
	public String[] getTypeToArray() {
		return this.type == null? new String[] {}: this.type.split("");
	}
}
