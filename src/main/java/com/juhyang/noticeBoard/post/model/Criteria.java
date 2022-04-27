package com.juhyang.noticeBoard.post.model;

import org.springframework.beans.factory.annotation.Autowired;


public class Criteria {

		private int page;
		private int perPageNum;
		private int rowStart;
		private int rowEnd;
		
		
		public void setRowStart(int rowStart) {
			this.rowStart = rowStart;
		}

		public void setRowEnd(int rowEnd) {
			this.rowEnd = rowEnd;
		}

		public Criteria() {
			this.page = 1;
			this.perPageNum = 10;
		}
		
		public void setPage(int page) {
			if (page <= 0) {
				this.page = 1;
				return;
			}
			this.page = page;
		}
		
		public void setPerPageNum(int perPageNum) {
			if (perPageNum <= 0 || perPageNum > 100) {
				this.perPageNum = 10;
				return;
			}
			this.perPageNum = perPageNum;
		}
		
		public int getPage() {
			return page;
		}
		
		public int getPageStart() {
			return (this.page - 1) * perPageNum;
			// 페이지가 1일 경우 pagestart눈 0이 됨
		}
		
		public int getPerPageNum() {
			return this.perPageNum;
			
			//
		}
		
		public int getRowStart() {

		rowStart = ((page - 1) * perPageNum) + 1;
		//1 ->  1
			return rowStart;
		}
		
		public int getRowEnd() {
			
			rowEnd = rowStart + perPageNum - 1;
			//row의 start가 1일 경우 row end는 10이 됨
			
			return rowEnd;
		}

		@Override
		public String toString() {
			return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
					+ "]";
		}
		
		
	}
