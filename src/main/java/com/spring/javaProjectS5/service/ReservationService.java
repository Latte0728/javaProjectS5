package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.ReservationInfoVO;
import com.spring.javaProjectS5.vo.ReservationVO;

public interface ReservationService {

	public int setReservationWrite(ReservationVO vo);

	public List<ReservationVO> getReservationList();

	public ReservationVO getReservationIdxSearch(int idx);

	public int setReservationFormOk(ReservationInfoVO vo);

	public ReservationInfoVO getReservationDuplicate(String mid, String wDate);

	public List<ReservationVO> getReservationMidList(String mid);

	public void getSchedule();

	public List<ReservationVO> getScheduleMenu(String ymd);

}
