package com.spring.javaProjectS5.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.QrCodeVO;

@Mapper
public interface AdminDAO {

	public int setQrCreate(@Param("vo") QrCodeVO vo);

}
