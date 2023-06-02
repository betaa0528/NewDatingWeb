package com.acorn.project.DTO;

public class firstimpressionChkDTO {

	private String sendId;
	private String reciveId;
	private String like_type;
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getReciveId() {
		return reciveId;
	}
	public void setReciveId(String reciveId) {
		this.reciveId = reciveId;
	}
	public String getLike_type() {
		return like_type;
	}
	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}
	public firstimpressionChkDTO(String sendId, String reciveId, String like_type) {
		super();
		this.sendId = sendId;
		this.reciveId = reciveId;
		this.like_type = like_type;
	}
	
	public firstimpressionChkDTO() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "likChkDTO [sendId=" + sendId + ", reciveId=" + reciveId + ", like_type=" + like_type + "]";
	}
	
}
