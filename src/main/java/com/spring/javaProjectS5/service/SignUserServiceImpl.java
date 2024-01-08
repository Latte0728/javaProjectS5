package com.spring.javaProjectS5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS5.dao.SignUserDAO;
import com.spring.javaProjectS5.vo.SignUserVO;

@Service
public class SignUserServiceImpl implements SignUserService {

	@Autowired
	SignUserDAO signUserDAO;
	
	@Override
	public SignUserVO getSignUserIdCheck(String mid) {
		return signUserDAO.getSignUserIdCheck(mid);
	}

	@Override
	public SignUserVO getSignUserNickCheck(String nickName) {
		return signUserDAO.getSignUserNickCheck(nickName);
	}

	@Override
	public int setSignUpUserOk(SignUserVO vo) {
		return signUserDAO.setSignUpUserOk(vo);
	}

	@Override
	public int setSignUserDel(String mid) {
		
		return signUserDAO.setSignUserDel(mid);
	}

	@Override
	public int setPwdChangeOk(String mid, String pwd) {
		return signUserDAO.setPwdChangeOk(mid, pwd);
	}

	@Override
	public int setSignUserUpdateOk(SignUserVO vo) {
		
		return signUserDAO.setSignUserUpdateOk(vo);
	}

	@Override
	public void setSignUserPasswordUpdate(String mid, String pwd) {
		signUserDAO.setSignUserPasswordUpdate(mid, pwd);
	}

	@Override
	public List<SignUserVO> getSignUserEmailSearch(String email) {
		return signUserDAO.getSignUserEmailSearch(email);
	}

	@Override
	public SignUserVO getSignUserNickNameEmailCheck(String nickName, String email) {
		return signUserDAO.getSignUserNickNameEmailCheck(nickName, email);
	}

	@Override
	public void setKakaoSignUserInput(String mid, String pwd, String nickName, String email) {
		signUserDAO.setKakaoSignUserInput(mid, pwd, nickName, email);
	}

	@Override
	public void signUpUser(SignUserVO vo) {
		signUserDAO.signUpUser(vo);
		
	}

	
}
