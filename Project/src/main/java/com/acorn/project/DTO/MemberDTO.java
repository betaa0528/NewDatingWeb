package com.acorn.project.DTO;

public class MemberDTO {
	
	String member_id;
	String mname;
	String email;
	String mpassword;
	int age;
	String gender;
	String phone;
	String introduce;
	String grade;
	String mbti;
	String religion;
	String job;
	String image;
	String height;
	String weight;
	String love_type;
	String like_cnt;
	String game_point;
	int like_type1;
	int like_type2;
	int like_type3;
	int like_type4;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public MemberDTO(String member_id, String mname, String email, String mpassword, int age, String gender,
			String phone, String introduce, String grade, String mbti, String religion, String job, String image,
			String height, String weight, String love_type, String like_cnt, String game_point, int like_type1,
			int like_type2, int like_type3, int like_type4) {
		super();
		this.member_id = member_id;
		this.mname = mname;
		this.email = email;
		this.mpassword = mpassword;
		this.age = age;
		this.gender = gender;
		this.phone = phone;
		this.introduce = introduce;
		this.grade = grade;
		this.mbti = mbti;
		this.religion = religion;
		this.job = job;
		this.image = image;
		this.height = height;
		this.weight = weight;
		this.love_type = love_type;
		this.like_cnt = like_cnt;
		this.game_point = game_point;
		this.like_type1 = like_type1;
		this.like_type2 = like_type2;
		this.like_type3 = like_type3;
		this.like_type4 = like_type4;
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


	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMbti() {
		return mbti;
	}
	public void setMbti(String mbti) {
		this.mbti = mbti;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getLove_type() {
		return love_type;
	}
	public void setLove_type(String love_type) {
		this.love_type = love_type;
	}
	public String getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(String like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getGame_point() {
		return game_point;
	}
	public void setGame_point(String game_point) {
		this.game_point = game_point;
	}


	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", mname=" + mname + ", email=" + email + ", mpassword="
				+ mpassword + ", age=" + age + ", gender=" + gender + ", phone=" + phone + ", introduce=" + introduce
				+ ", grade=" + grade + ", mbti=" + mbti + ", religion=" + religion + ", job=" + job + ", image=" + image
				+ ", height=" + height + ", weight=" + weight + ", love_type=" + love_type + ", like_cnt=" + like_cnt
				+ ", game_point=" + game_point + ", like_type1=" + like_type1 + ", like_type2=" + like_type2
				+ ", like_type3=" + like_type3 + ", like_type4=" + like_type4 + "]";
	}
	
}