package com.acorn.project.DTO;

public class LikeDTO {

	String mname;
	String image;
	String like_cnt;
	
	public LikeDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(String like_cnt) {
		this.like_cnt = like_cnt;
	}

	public LikeDTO(String mname, String image, String like_cnt) {
		super();
		this.mname = mname;
		this.image = image;
		this.like_cnt = like_cnt;
	}

	@Override
	public String toString() {
		return "LikeDTO [mname=" + mname + ", image=" + image + ", like_cnt=" + like_cnt + "] ";
	}
	
}
