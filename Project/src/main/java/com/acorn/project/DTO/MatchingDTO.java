package com.acorn.project.DTO;

public class MatchingDTO {

	String matching_id;
	String sender_member_id;
	String receiver_member_id;
	String matching_status;
	
	public MatchingDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getMatching_id() {
		return matching_id;
	}

	public void setMatching_id(String matching_id) {
		this.matching_id = matching_id;
	}

	public String getSender_member_id() {
		return sender_member_id;
	}

	public void setSender_member_id(String sender_member_id) {
		this.sender_member_id = sender_member_id;
	}

	public String getReceiver_member_id() {
		return receiver_member_id;
	}

	public void setReceiver_member_id(String receiver_member_id) {
		this.receiver_member_id = receiver_member_id;
	}

	public String getMatching_status() {
		return matching_status;
	}

	public void setMatching_status(String matching_status) {
		this.matching_status = matching_status;
	}

	public MatchingDTO(String matching_id, String sender_member_id, String receiver_member_id, String matching_status) {
		super();
		this.matching_id = matching_id;
		this.sender_member_id = sender_member_id;
		this.receiver_member_id = receiver_member_id;
		this.matching_status = matching_status;
	}

	@Override
	public String toString() {
		return "MatchingDTO [matching_id=" + matching_id + ", sender_member_id=" + sender_member_id
				+ ", receiver_member_id=" + receiver_member_id + ", matching_status=" + matching_status + "]";
	}
	
	
	
}
