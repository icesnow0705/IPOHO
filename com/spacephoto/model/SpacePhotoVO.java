package com.spacephoto.model;

public class SpacePhotoVO {
	private String spacePhotoId;
	private String spaceId;
	private byte[] spacePhoto;
	
	
	public String getSpacePhotoId() {
		return spacePhotoId;
	}
	public void setSpacePhotoId(String spacePhotoId) {
		this.spacePhotoId = spacePhotoId;
	}
	public String getSpaceId() {
		return spaceId;
	}
	public void setSpaceId(String spaceId) {
		this.spaceId = spaceId;
	}
	public byte[] getSpacePhoto() {
		return spacePhoto;
	}
	public void setSpacePhoto(byte[] spacePhoto) {
		this.spacePhoto = spacePhoto;
	}
}
