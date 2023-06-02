package com.acorn.project.DTO;

public class firstimpressionDTO {

	private String id;
	private int like_type1;
	private int like_type2;
	private int like_type3;
	private int like_type4;
	private String gender;
	private String introduce;
	private String imgName;
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLike_type1() {
		return like_type1;
	}
	public void setLike_type1(int like_type1) {
		this.like_type1 = like_type1;
	}
	public int getLike_type2() {
		return like_type2;
	}
	public void setLike_type2(int like_type2) {
		this.like_type2 = like_type2;
	}
	public int getLike_type3() {
		return like_type3;
	}
	public void setLike_type3(int like_type3) {
		this.like_type3 = like_type3;
	}
	public int getLike_type4() {
		return like_type4;
	}
	public void setLike_type4(int like_type4) {
		this.like_type4 = like_type4;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public firstimpressionDTO(String id, int like_type1, int like_type2, int like_type3, int like_type4, String gender,
			String introduce, String imgName) {
		super();
		this.id = id;
		this.like_type1 = like_type1;
		this.like_type2 = like_type2;
		this.like_type3 = like_type3;
		this.like_type4 = like_type4;
		this.gender = gender;
		this.introduce = introduce;
		this.imgName = imgName;
	}
	public firstimpressionDTO() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "likeDTO [id=" + id + ", like_type1=" + like_type1 + ", like_type2=" + like_type2 + ", like_type3="
				+ like_type3 + ", like_type4=" + like_type4 + ", gender=" + gender + ", introduce=" + introduce
				+ ", imgName=" + imgName + "]";
	}
	
}
