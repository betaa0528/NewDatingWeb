package com.acorn.project.DTO;

public class boardDTO {

	private String communityId;
	private String content;
	private String createAt;
	private String imgName;
	private String memberId;
	private boolean showLinks;
    
    
    public boolean isShowLinks() {
        return showLinks;
    }

    public void setShowLinks(boolean showLinks) {
        this.showLinks = showLinks;
    }

	public String getCommunityId() {
		return communityId;
	}

	public void setCommunityId(String communityId) {
		this.communityId = communityId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateAt() {
		return createAt;
	}

	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public boardDTO(String communityId, String content, String createAt, String imgName, String memberId) {
		super();
		this.communityId = communityId;
		this.content = content;
		this.createAt = createAt;
		this.imgName = imgName;
		this.memberId = memberId;
	}
	public boardDTO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "boardDTO [communityId=" + communityId + ", content=" + content + ", createAt=" + createAt + ", imgName="
				+ imgName + ", memberId=" + memberId + "]";
	}
}
