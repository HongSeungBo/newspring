package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.security.AuthVO;
import com.myweb.www.security.MemberVO;

public interface MemberDAO {

	int register(MemberVO mvo);

	int insertAuthInit(String email);

	MemberVO selectEmail(String username);

	List<AuthVO> selectAuths(String username);

	boolean updateLastLogin(String authEmail);

	List<MemberVO> selectAll();

	MemberVO selectOne(String email);

	int modi(MemberVO mvo);

	int remove(String email);

	void removeAuth(String email);

}
