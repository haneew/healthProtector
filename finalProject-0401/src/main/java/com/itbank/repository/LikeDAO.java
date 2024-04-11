package com.itbank.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface LikeDAO {

	@Select("select count(*) as heart_count from health_like where board_id = #{idx}")
	int selectHeart_Count(int idx);

	@Select("select count(*) as likestatus from health_like where board_id = #{idx} and user_id = #{userid}")
	int getLikeStatus(Map<String, Object> map);

	@Insert("insert into health_like (user_id, board_id) values (#{userid},#{board_id})")
	void insert(Map<String, Object> map);

	@Delete("delete from health_like where board_id = #{board_id} and user_id = #{userid}")
	void delete(Map<String, Object> map);

}
