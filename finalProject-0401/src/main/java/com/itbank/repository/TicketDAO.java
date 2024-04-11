package com.itbank.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.itbank.model.TicketDTO;

@Repository
public interface TicketDAO {

//	@Select("select * from health_ticket")
	List<TicketDTO> getList();

//	@Select("select * from health_ticket where idx = #{idx}")
	TicketDTO getOne(int idx);

//	@Insert("insert into health_deal (userid, ticket_id, imp_uid, expirDay, tkCount)"
//			+ " values( #{userid}, #{ticket_id}, #{imp_uid},"
//			+ " (SYSDATE + NVL((SELECT SUM(tkcount) FROM health_deal WHERE userid = #{userid}), 0) + 180),"
//			+ " (select tk_value from health_ticket where idx = #{ticket_id}))")
	int buy(Map<String, Object> map);

//	@Select("SELECT sum(tkcount) AS total_tk_count"
//	         + " FROM health_deal"
//	         + " WHERE userid = #{userid}")
	String getAlarm(String userid);

	@Insert("insert into health_ticket (tk_content, price, tk_value) values (#{tk_content}, #{price}, #{tk_value})")
	int insert(TicketDTO dto);
	
	
}
