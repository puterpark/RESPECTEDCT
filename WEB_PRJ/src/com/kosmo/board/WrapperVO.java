package com.kosmo.board;

import com.kosmo.member.MemberVO;

public class WrapperVO {

	BoardVO bvo;
	MemberVO mvo;
	
	public BoardVO getBvo() {
		return bvo;
	}
	public void setBvo(BoardVO bvo) {
		this.bvo = bvo;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
}
