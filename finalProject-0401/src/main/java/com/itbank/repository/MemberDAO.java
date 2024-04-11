package com.itbank.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.itbank.model.MemberDTO;

@Repository
public interface MemberDAO {

//	@Select("select * from health_member where userid=#{userid} and userpw=#{userpw}")
	MemberDTO login(MemberDTO dto);

//	@Select("select count(*) from health_member where userid = #{userid}")
	int check(HashMap<String, Object> param);
	
//	@Insert("insert into health_member (userid, userpw, username, birth, profile_image, gender, phone_num, email) "
//			+ "values (#{userid}, #{userpw}, #{username}, #{birth}, #{profile_image}, #{gender}, #{phone_num}, #{email})")
	int insert(MemberDTO dto);

//	@Select("select * from health_member where userid=#{userid}")
	MemberDTO selectOne(String userid);

//	@Select("select * from health_member order by idx")
	List<MemberDTO> selectList();

//	@Update("update health_member set userpw = #{newPw} where userid = #{userid}")
	int update(Map<String, String> param);

//	@Select("select * from health_member where email = #{email} and userid = #{userid}")
	MemberDTO sendPassword(MemberDTO dto);

//	@Update("update health_member set userpw = #{userpw} where email = #{email} and userid = #{userid}")
	int changePassword(MemberDTO dto);

//	@Update("update health_member set profile_image=#{profile_image}, username=#{username}, phone_num=#{phone_num} where userid=#{userid}")
	int updateInfo(MemberDTO dto);
}
