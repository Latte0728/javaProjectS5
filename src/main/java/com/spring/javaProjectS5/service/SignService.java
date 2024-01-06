package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.SignVO;

public interface SignService {

	public SignVO getSignIdCheck(String mid);

	public SignVO getSignNickCheck(String nickName);

	public int setSignUpOk(SignVO vo);

	public int setSignDel(String mid);

	public int setPwdChangeOk(String mid, String pwd);

	public int setSignUpdateOk(SignVO vo);

	public void setSignPasswordUpdate(String mid, String pwd);

	public List<SignVO> getSignEmailSearch(String email);

	public SignVO getSignNickNameEmailCheck(String nickName, String email);

	public void setKakaoSignInput(String mid, String pwd, String nickName, String email);

	public void signUp(SignVO vo);

}
