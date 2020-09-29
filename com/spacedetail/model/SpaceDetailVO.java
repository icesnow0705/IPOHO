package com.spacedetail.model;

public class SpaceDetailVO {
	private String spaceDetailId;
	private String spaceId;
	private java.sql.Date spaceDetailFreeDate;
	private Integer spaceDetailCharge;
	private String spaceDetailText;
	
	public String getSpaceDetailId() {
		return spaceDetailId;
	}
	public void setSpaceDetailId(String spaceDetailId) {
		this.spaceDetailId = spaceDetailId;
	}
	public String getSpaceId() {
		return spaceId;
	}
	public void setSpaceId(String spaceId) {
		this.spaceId = spaceId;
	}
	public java.sql.Date getSpaceDetailFreeDate() {
		return spaceDetailFreeDate;
	}
	public void setSpaceDetailFreeDate(java.sql.Date spaceDetailFreeDate) {
		this.spaceDetailFreeDate = spaceDetailFreeDate;
	}
	public Integer getSpaceDetailCharge() {
		return spaceDetailCharge;
	}
	public void setSpaceDetailCharge(Integer spaceDetailCharge) {
		this.spaceDetailCharge = spaceDetailCharge;
	}
	public String getSpaceDetailText() {
		return spaceDetailText;
	}
	public void setSpaceDetailText(String spaceDetailText) {
		this.spaceDetailText = spaceDetailText;
	}
	
}
