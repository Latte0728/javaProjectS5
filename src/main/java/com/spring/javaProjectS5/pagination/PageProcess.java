package com.spring.javaProjectS5.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS5.dao.BulletinBoardDAO;
import com.spring.javaProjectS5.dao.GuideDAO;

@Service
public class PageProcess {

	/*
	 * @Autowired BulletinBoardDAO bulletinBoardDAO;
	 */
	
	@Autowired
	BulletinBoardDAO bulletinBoardDAO;
	
	@Autowired
	GuideDAO guideDAO;
	
	
	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		String search = "";
		
		/*
		 * if(section.equals("bulletinboard")) { if(part.equals("")) totRecCnt =
		 * bulletinBoardDAO.totRecCnt(); else { search = part; totRecCnt =
		 * BulletinBoardDAO.totRecCntSearch(search, searchString); } }
		 */
		if(section.equals("guide")) totRecCnt = guideDAO.totRecCnt(part);
		if(section.equals("guidePart")) totRecCnt = guideDAO.totRecCntPart(part);
		if(section.equals("guideSearch")) {
			String[] searchStringArray = searchString.split("/");
			totRecCnt = guideDAO.totRecCntSearch(part, searchStringArray[0], searchStringArray[1]);
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1 ;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setBlockSize(blockSize);
		pageVO.setCurBlock(curBlock);
		pageVO.setLastBlock(lastBlock);
		pageVO.setPart(part);
		pageVO.setSearch(search);
		pageVO.setSearchString(searchString);
		
		return pageVO;
	}
}
