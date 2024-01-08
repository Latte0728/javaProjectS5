package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.SignUserVO;

public interface SignUserDAO {

	public SignUserVO getSignUserIdCheck(@Param("mid") String mid);

	public SignUserVO getSignUserNickCheck(@Param("nickName") String nickName);

	public int setSignUpUserOk(@Param("vo") SignUserVO vo);

	public int setSignUserDel(@Param("mid") String mid);

	public int setPwdChangeOk(@Param("mid") String mid, @Param("pwd") String pwd);

	public int setSignUserUpdateOk(@Param("vo") SignUserVO vo);

	public void setSignUserPasswordUpdate(@Param("mid") String mid, @Param("pwd") String pwd);

	public List<SignUserVO> getSignUserEmailSearch(@Param("email") String email);

	public SignUserVO getSignUserNickNameEmailCheck(@Param("nickName") String nickName, @Param("email") String email);

	public void setKakaoSignUserInput(@Param("mid") String mid, @Param("pwd") String pwd, @Param("nickName") String nickName, @Param("email") String email);

	public void signUpUser(@Param("vo") SignUserVO vo);

}
