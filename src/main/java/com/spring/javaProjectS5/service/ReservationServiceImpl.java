package com.spring.javaProjectS5.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.javaProjectS5.dao.ReservationDAO;
import com.spring.javaProjectS5.vo.ReservationInfoVO;
import com.spring.javaProjectS5.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDAO reservationDAO;

	@Override
	public int setReservationWrite(ReservationVO vo) {
		
		//         0         1         2         3         4         5
		//         012345678901234567890123456789012345678901234567890
		// <p><img src="/javaProjectS5/data/ckeditor/231220120242_10.jpg" style="height:725px;
		// <p><img src="/javaProjectS5/data/reservation/231220120242_10.jpg" style="height:725px;
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
		
		int position = 34;
		String nextImg = vo.getContent().substring(vo.getContent().indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			
			String origFilePath = realPath + "ckeditor/" + imgFile;
			String copyFilePath = realPath + "reservation/" + imgFile;
			
			fileCopyCheck(origFilePath, copyFilePath);		// ckeditor폴더의 그림파일을 board폴더위치로 복사처리한다.
			
			if(nextImg.indexOf("src=\"/") == -1) sw = false;
			else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
		vo.setContent(vo.getContent().replace("ckeditor", "reservation"));
		return reservationDAO.setReservationWrite(vo);
	}
	
	// 파일을 복사처리한다.
	private void fileCopyCheck(String origFilePath, String copyFilePath) {
		try {
			FileInputStream fis = new FileInputStream(new File(origFilePath));
			FileOutputStream fos = new FileOutputStream(new File(copyFilePath));
			
			byte[] bytes = new byte[2048];
			int cnt = 0;
			while((cnt = fis.read(bytes)) != -1) {
			  fos.write(bytes, 0, cnt);
			}
			fos.flush();
			fos.close();
			fis.close();			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ReservationVO> getReservationList() {
		return reservationDAO.getReservationList();
	}

	@Override
	public ReservationVO getReservationIdxSearch(int idx) {
		return reservationDAO.getReservationIdxSearch(idx);
	}

	@Override
	public int setReservationFormOk(ReservationInfoVO vo) {
		return reservationDAO.setReservationFormOk(vo);
	}

	@Override
	public ReservationInfoVO getReservationDuplicate(String mid, String wDate) {
		return reservationDAO.getReservationDuplicate(mid, wDate);
	}

	@Override
	public List<ReservationVO> getReservationConfirm(String mid) {
		return reservationDAO.getReservationConfirm(mid);
	}

	@Override
	public void getSchedule() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		int level = (int) session.getAttribute("sLevel");
		
		// 오늘 날짜 저장시켜둔다.(calToday변수, 년(toYear), 월(toMonth), 일(toDay))
		Calendar calToday = Calendar.getInstance();
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);
				
		// 화면에 보여줄 해당 '년(yy)/월(mm)'을 셋팅하는 부분(처음에는 오늘 년도와 월을 가져오지만, '이전/다음'버튼 클릭하면 해당 년과 월을 가져오도록 한다.
		Calendar calView = Calendar.getInstance();
		int yy = request.getParameter("yy")==null ? calView.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
	  int mm = request.getParameter("mm")==null ? calView.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
	  
	  if(mm < 0) { // 1월에서 전월 버튼을 클릭시에 실행
	  	yy--;
	  	mm = 11;
	  }
	  if(mm > 11) { // 12월에서 다음월 버튼을 클릭시에 실행
	  	yy++;
	  	mm = 0;
	  }
	  calView.set(yy, mm, 1);		// 현재 '년/월'의 1일을 달력의 날짜로 셋팅한다.
	  
	  int startWeek = calView.get(Calendar.DAY_OF_WEEK);  						// 해당 '년/월'의 1일에 해당하는 요일값을 숫자로 가져온다.
	  int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH);  // 해당월의 마지막일자(getActualMaxximum메소드사용)를 구한다.
	  
	  // 화면에 보여줄 년월기준 전년도/다음년도를 구하기 위한 부분
	  int prevYear = yy;  			// 전년도
	  int prevMonth = (mm) - 1; // 이전월
	  int nextYear = yy;  			// 다음년도
	  int nextMonth = (mm) + 1; // 다음월
	  
	  if(prevMonth == -1) {  // 1월에서 전월 버튼을 클릭시에 실행..
	  	prevYear--;
	  	prevMonth = 11;
	  }
	  
	  if(nextMonth == 12) {  // 12월에서 다음월 버튼을 클릭시에 실행..
	  	nextYear++;
	  	nextMonth = 0;
	  }
	  
	  // 현재달력에서 앞쪽의 빈공간은 '이전달력'을 보여주고, 뒷쪽의 남은공간은 '다음달력'을 보여주기위한 처리부분(아래 6줄)
	  Calendar calPre = Calendar.getInstance(); // 이전달력
	  calPre.set(prevYear, prevMonth, 1);  			// 이전 달력 셋팅
	  int preLastDay = calPre.getActualMaximum(Calendar.DAY_OF_MONTH);  // 해당월의 마지막일자를 구한다.
	  
	  Calendar calNext = Calendar.getInstance();// 다음달력
	  calNext.set(nextYear, nextMonth, 1);  		// 다음 달력 셋팅
	  int nextStartWeek = calNext.get(Calendar.DAY_OF_WEEK);  // 다음달의 1일에 해당하는 요일값을 가져온다.
	  
	  // sql에 등록된 dataformat의 비교형식을 맞춰주기위한 날짜형식변환작업
	  // 해당 년월의 형식 변환?  2023-1 ===>>  2023-01
	  String ym = "";
	  int intMM = mm + 1;
	  if(intMM >= 1 && intMM <= 9) ym = yy + "-0" + (mm + 1);
	  else ym = yy + "-" + (mm + 1);
	  
	  // 스케줄에 등록되어 있는 일정들을 가져오기
	  List<ReservationVO> vos = reservationDAO.getScheduleList(ym);
	  //System.out.println("vos : " + vos);
	  request.setAttribute("vos", vos);
	  
	  /* ---------  아래는  앞에서 처리된 값들을 모두 request객체에 담는다.  -----------------  */
	  
	  // 오늘기준 달력...
	  request.setAttribute("toYear", toYear);
	  request.setAttribute("toMonth", toMonth);
	  request.setAttribute("toDay", toDay);
	  
	  // 화면에 보여줄 해당 달력...
	  request.setAttribute("yy", yy);
	  request.setAttribute("mm", mm);
	  request.setAttribute("startWeek", startWeek);
	  request.setAttribute("lastDay", lastDay);
	  
	  // 화면에 보여줄 해당 달력 기준의 전년도, 전월, 다음년도, 다음월 ...
	  request.setAttribute("prevYear", prevYear);
		request.setAttribute("prevMonth", prevMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		
		// 현재 달력의 '앞/뒤' 빈공간을 채울, 이전달의 뒷부분과 다음달의 앞부분을 보여주기위해 넘겨주는 변수
		request.setAttribute("preLastDay", preLastDay);				// 이전달의 마지막일자를 기억하고 있는 변수
		request.setAttribute("nextStartWeek", nextStartWeek);	// 다음달의 1일에 해당하는 요일을 기억하고있는 변수
	}

	@Override
	public List<ReservationVO> getScheduleMenu(String ymd) {
		String mm = "", dd = "";
		String[] ymdArr = ymd.split("-");
		if(ymd.length() != 10) {
			if(ymdArr[1].length() == 1) mm = "0" + ymdArr[1];
			else mm = ymdArr[1];
			if(ymdArr[2].length() == 1) dd = "0" + ymdArr[2];
			else dd = ymdArr[2];
			ymd = ymdArr[0] + "-" + mm + "-" + dd;
		}
		return reservationDAO.getScheduleMenu(ymd);
	}

}