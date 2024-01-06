package com.spring.javaProjectS5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS5.dao.SignUserDAO;
import com.spring.javaProjectS5.vo.SignVO;

@Service
public class SignServiceImpl implements SignService {

	@Autowired
	SignUserDAO signUserDAO;
	
	@Override
	public SignVO getSignIdCheck(String mid) {
		return signUserDAO.getSignIdCheck(mid);
	}

	@Override
	public SignVO getSignNickCheck(String nickName) {
		return signUserDAO.getSignNickCheck(nickName);
	}

	@Override
	public int setSignUpOk(SignVO vo) {
		return signUserDAO.setSignUpOk(vo);
	}

	@Override
	public int setSignDel(String mid) {
		
		return signUserDAO.setSignDel(mid);
	}

	@Override
	public int setPwdChangeOk(String mid, String pwd) {
		return signUserDAO.setPwdChangeOk(mid, pwd);
	}

	@Override
	public int setSignUpdateOk(SignVO vo) {
		
		return signUserDAO.setSignUpdateOk(vo);
	}

	@Override
	public void setSignPasswordUpdate(String mid, String pwd) {
		signUserDAO.setSignPasswordUpdate(mid, pwd);
	}

	@Override
	public List<SignVO> getSignEmailSearch(String email) {
		return signUserDAO.getSignEmailSearch(email);
	}

	@Override
	public SignVO getSignNickNameEmailCheck(String nickName, String email) {
		return signUserDAO.getSignNickNameEmailCheck(nickName, email);
	}

	@Override
	public void setKakaoSignInput(String mid, String pwd, String nickName, String email) {
		signUserDAO.setKakaoSignInput(mid, pwd, nickName, email);
	}

	@Override
	public void signUp(SignVO vo) {
		signUserDAO.signUp(vo);
		
	}

	
}
