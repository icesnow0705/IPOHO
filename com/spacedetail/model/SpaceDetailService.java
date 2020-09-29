package com.spacedetail.model;

import java.util.List;

public class SpaceDetailService {
	
	private SpaceDetailDAO_interface dao;
	
	public SpaceDetailService() {
		dao = new SpaceDetailDAO();
	}
	
	public SpaceDetailVO addSpaceDetail(SpaceDetailVO spaceDetailVO) {
		dao.insert(spaceDetailVO);
		return spaceDetailVO;
	}
	
	public SpaceDetailVO updateSpaceDetail(SpaceDetailVO spaceDetailVO) {
		dao.update(spaceDetailVO);
		return spaceDetailVO;
	}
	
	public void deleteSpaceDetail(String spaceDetailId) {
		dao.delete(spaceDetailId);
	}
	
	public SpaceDetailVO selectOneSpaceDetail(String spaceDetailId) {
		return dao.selectOne(spaceDetailId);
	}
	
	public List<SpaceDetailVO> getAll(){
		return dao.getAll();
	}
	
}
