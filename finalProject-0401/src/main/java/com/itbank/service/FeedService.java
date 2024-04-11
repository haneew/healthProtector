package com.itbank.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.component.FileComponent;
import com.itbank.model.FeedDTO;
import com.itbank.repository.FeedDAO;
import com.itbank.repository.LikeDAO;

@Service
public class FeedService {

	@Autowired private FeedDAO dao;
	@Autowired private LikeDAO likeDao;
	@Autowired private FileComponent filecomponent;

	public List<FeedDTO> getList(String userid) {
		
		List<FeedDTO> list = dao.selectList();
		
//		list.forEach(e => e.onclick);
		for(FeedDTO dto : list) {
			int heart_count = likeDao.selectHeart_Count(dto.getIdx());
			dto.setHeart_count(heart_count);
			if(userid != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("userid", userid);
				map.put("idx", dto.getIdx());
				dto.setLikeStatus(likeDao.getLikeStatus(map));
			}
		}
		
		return list;
	}

	public FeedDTO getHealth_board(int idx) {
		
		return dao.selectOne(idx);
	}

	public int write(FeedDTO dto) {
		int row = 0;
		List<MultipartFile> list = dto.getUpload();
		String ori = "";
		String result = "";
		for(MultipartFile f : list) {
			ori += f.getOriginalFilename() + ":";
			result += filecomponent.upload(f) + ":";
		}
		ori = ori.substring(0, ori.length()-1);
		result = result.substring(0, result.length() - 1);
		dto.setStoredFileName(result);
		dto.setOriginalFileName(ori);
		row = dao.insert(dto);
		return row;
	}

	public int modify(FeedDTO dto) {
		int row = 0;
		List<MultipartFile> list = dto.getUpload();
		String ori = "";
		String result = "";
		for(MultipartFile f : list) {
			ori += f.getOriginalFilename() + ":";
			result += filecomponent.upload(f) + ":";
		}
		ori = ori.substring(0, ori.length()-1);
		result = result.substring(0, result.length() - 1);
		dto.setStoredFileName(result);
		dto.setOriginalFileName(ori);
		row = dao.update(dto);
		return row;
	}

	public int delete(int idx) {
		
		return dao.delete(idx);
	}

	public void like(String userid, int board_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("board_id", board_id);
		
		likeDao.insert(map);		
	}

	public void unlike(String userid, int board_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("board_id", board_id);
		
		likeDao.delete(map);
	}


	
}
