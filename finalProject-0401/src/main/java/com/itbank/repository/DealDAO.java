package com.itbank.repository;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.itbank.model.DealDTO;

@Repository
public interface DealDAO {

//	@Select("select health_deal.idx, userid, ticket_id, tk_value * 0.75 as tk_value, TRUNC(buyday) as buyDay, TRUNC(expirday) as expirDay ,tkCount from health_deal"
//			+ " join health_ticket"
//			+ " on health_ticket.idx = health_deal.ticket_id"
//			+ " where userid=#{userid}"
//			+ " group by health_deal.idx, userid, health_deal.ticket_id,tk_value, TRUNC(buyday), TRUNC(expirday), tkCount")
	List<DealDTO> buyList(String userid);

//	@Insert("insert into health_deal (userid, ticket_id, buyDay, expirDay, tkcount)"
//			+ "values (#{userid}, #{ticket_id}, #{buyDay},'#{expirDay}, (select tk_value from health_ticket where idx = #{idx}) )")
	int insert(DealDTO dto);

//	@Update("update health_deal set tkCount = tkCount - 1 where idx = #{idx}")
	int decrease(int idx);

//	@Select("select idx from (select * from health_deal where userid= #{userid} order by tkCount, buyDay) where rownum =1")
	int useTicket(String userid);

//	@Delete("delete from health_deal where idx = #{rf}")
	int delete(int rf);

//	@Select("SELECT "
//			+ "imp_uid, "
//			+ "buyday, "
//			+ "SUM(tkcount) AS tkcount "
//			+ "FROM "
//			+ "health_deal "
//			+ "where "
//			+ "userid = #{userid} "
//			+ "GROUP BY "
//			+ "imp_uid, buyday")
	List<DealDTO> getRefund(String userid);

//	@Delete("delete from health_deal where imp_uid = #{imp_uid}")
	void cancelDeal(String imp_uid);

//	@Select("SELECT "
//			+ "userid, "
//			+ "SUM(CASE WHEN ticket_id = 1 THEN 1 ELSE 0 END) AS ticket_1, "
//			+ "SUM(CASE WHEN ticket_id = 2 THEN 1 ELSE 0 END) AS ticket_2, "
//			+ "SUM(CASE WHEN ticket_id = 3 THEN 1 ELSE 0 END) AS ticket_3, "
//			+ "buyday "
//			+ "FROM "
//			+ "health_deal "
//			+ "GROUP BY "
//			+ "userid, buyday")
	List<DealDTO> selectList();

	
}
