package com.itbank.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.TicketDTO;
import com.itbank.repository.TicketDAO;

@Service
public class TicketService {

	@Autowired TicketDAO dao;
	
	public List<TicketDTO> getList() {
		List<TicketDTO> list = dao.getList();
		return list;
	}
	
	public TicketDTO getOne(int idx) {
		return dao.getOne(idx);
	}

   // 이용권 구매
   @SuppressWarnings("unchecked")
   public int buy(Map<String, Object> map, String userid) {
      int row = 0;

       Object countsObject = map.get("counts");
        ArrayList<String> countList = (ArrayList<String>) countsObject;
        String[] ticket = countList.toArray(new String[countList.size()]);
        map.put("userid", userid);

        for (int i = 0; i < ticket.length; i++) {
            map.put("ticket_id", i + 1);
            int hw = Integer.parseInt(ticket[i]);
            for (int j = 0; j < hw; j++) {
                row += dao.buy(map);
            }
        }
        

       return row;
   }

	public int getAlarm(String userid) {
		int totalCount = 0;
		String tmp = dao.getAlarm(userid);
		if(tmp != null) {
			totalCount = Integer.parseInt(tmp);
		}
		
		return totalCount;
	}
	
	public int insert(TicketDTO dto) {
		return dao.insert(dto);
	}


}
