package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.SignVO;

public interface SignUserDAO {

	public SignVO getSignIdCheck(@Param("mid") String mid);

	public SignVO getSignNickCheck(@Param("nickName") String nickName);

	public int setSignUpOk(@Param("vo") SignVO vo);

	public int setSignDel(@Param("mid") String mid);

	public int setPwdChangeOk(@Param("mid") String mid, @Param("pwd") String pwd);

	public int setSignUpdateOk(@Param("vo") SignVO vo);

	public void setSignPasswordUpdate(@Param("mid") String mid, @Param("pwd") String pwd);

	public List<SignVO> getSignEmailSearch(@Param("email") String email);

	public SignVO getSignNickNameEmailCheck(@Param("nickName") String nickName, @Param("email") String email);

	public void setKakaoSignInput(@Param("mid") String mid, @Param("pwd") String pwd, @Param("nickName") String nickName, @Param("email") String email);

	public void signUp(@Param("vo") SignVO vo);

}
