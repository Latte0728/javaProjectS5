package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.ReservationInfoVO;
import com.spring.javaProjectS5.vo.ReservationVO;

public interface ReservationDAO {

	public int setReservationWrite(@Param("vo") ReservationVO vo);

	public List<ReservationVO> getReservationList();

	public ReservationVO getReservationIdxSearch(@Param("idx") int idx);

	public int setReservationFormOk(@Param("vo") ReservationInfoVO vo);

	public ReservationInfoVO getReservationDuplicate(@Param("mid") String mid, @Param("wDate") String wDate);

}
