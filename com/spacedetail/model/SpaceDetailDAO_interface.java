package com.spacedetail.model;

import java.util.List;

public interface SpaceDetailDAO_interface {
	public void insert(SpaceDetailVO spaceDetailVO);
	public void delete(String spaceDetailId);
	public void update(SpaceDetailVO spaceDetailVO);
	public SpaceDetailVO selectOne(String spaceDetailId);
	public List<SpaceDetailVO> getAll();
}
