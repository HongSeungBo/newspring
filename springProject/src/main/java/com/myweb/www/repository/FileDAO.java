package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.FileVO;

public interface FileDAO {

	int insertFile(FileVO fvo);

	List<FileVO> getFile(long bno);

	int modiFile(@Param("uuid")String uuid,@Param("bno")long bno);

	int deleteFile(FileVO fvo);

	int getCount(long bno);

	void deleteAll(long bno);

	List<FileVO> selectListAllFiles();

}
