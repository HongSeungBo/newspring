package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
/*
 bno bigint not null auto_increment,
writer varchar(100) not null,
title varchar(200) not null,
content text not null,
reg_at datetime default now(),
mod_at datetime default now(),
read_count int default 0,
cmt_qty int default 0,
has_file int default 0,
 */
	private long bno;
	private String writer;
	private String title;
	private String content;
	private String regAt;
	private String modAt;
	private int readCount;
	private String cmtQty;
	private int hasFile;
	
}
