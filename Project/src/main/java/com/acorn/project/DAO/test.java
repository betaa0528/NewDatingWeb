package com.acorn.project.DAO;

public class test {
	
	public static void main(String[] args) {
		Admin_tblDAO  a = new Admin_tblDAO();
		for(String[] a_ : a.select()) {
			for(String a__:a_) {
				System.out.println(a__);
			}
		}
	}

}
