package com.spring.boardweb;

//시작페이지와 끝 페이지를 계산, 이전버튼과 다음버튼이 실행가능한지 boolean
//criteria 객체를 가지고 있는 클래스
public class PageVO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	
	private Criteria cri;
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//시작페이지와 마지막페이지 계산
		this.endPage = (int)(Math.ceil(cri.getPageNum() /10.0))*10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage >1;
		this.next = this.endPage < realEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotal() {
		return total;
	}

	public Criteria getCri() {
		return cri;
	}

	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
	
	
}
