package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.DealDTO;
import com.itbank.repository.AbscentDAO;
import com.itbank.repository.DealDAO;

@Service
public class DealService {

	@Autowired DealDAO ddao;
	@Autowired AbscentDAO adao;

	public List<DealDTO> buyList(String userid) {
		List<DealDTO> list = ddao.buyList(userid);
//		for(DealDTO dto : list) {
//			System.out.println(dto.getTk_value());
//		}
		return list;
	}

	// 이용권 구매
	public int add(DealDTO dto) {	
		return ddao.insert(dto);
	}

	// 이용권 사용
	public int update(String userid) {
		int idx = ddao.useTicket(userid);
		int row = adao.insert(userid) * ddao.decrease(idx);
		return row;
	}

	// 이용권 환불
	public int delete(String countsString) {
		String[] refund = countsString.split(",");
		int[] rf = new int[refund.length];
		int row = 1;
		for(int i=0; i< refund.length; i++) {
			rf[i] = Integer.parseInt(refund[i]);
			row *= ddao.delete(rf[i]);
		}
		return row;
	}

	public List<DealDTO> getRefundList(String userid) {
		return ddao.getRefund(userid);
	}

	public void cancelDeal(String imp_uid) {
		ddao.cancelDeal(imp_uid);	
	}

	public List<DealDTO> getList() {
		return ddao.selectList();
	}
}
