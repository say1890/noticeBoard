package com.juhyang.noticeBoard.post.model;




public class Criteria {
		
		private int page;
		private int perPageNum;
		private int rowStart;
		private int rowEnd;
		
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
		}
		
		public int getPerPageNum() {
			return this.perPageNum;
		}
		
		public int getRowStart() {
			//게시글 갯수가 20개인 경우 id가 20인 것 먼저 보여주고 싶음
			rowStart = ((page - 1) * perPageNum) + 1;
			//page가 1일 경우 row의 start는 1이 됨
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
