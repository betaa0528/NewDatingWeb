package com.acorn.project.DTO;

public class ClickDTO {

	String image;
	String member_id;
	
	
	public ClickDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public ClickDTO(String image, String member_id) {
	
		this.image = image;
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "ClickDTO [image=" + image + ", member_id=" + member_id + "]";
	}
	
}
