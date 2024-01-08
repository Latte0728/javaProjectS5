package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.SignUserVO;

public interface SignUserService {

	public SignUserVO getSignUserIdCheck(String mid);

	public SignUserVO getSignUserNickCheck(String nickName);

	public int setSignUpUserOk(SignUserVO vo);

	public int setSignUserDel(String mid);

	public int setPwdChangeOk(String mid, String pwd);

	public int setSignUserUpdateOk(SignUserVO vo);

	public void setSignUserPasswordUpdate(String mid, String pwd);

	public List<SignUserVO> getSignUserEmailSearch(String email);

	public SignUserVO getSignUserNickNameEmailCheck(String nickName, String email);

	public void setKakaoSignUserInput(String mid, String pwd, String nickName, String email);

	public void signUpUser(SignUserVO vo);

}
