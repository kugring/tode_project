package com.ezen.backend.VO;

public class SearchWordVO {
	private int searchWordId; // 필드명을 search_word_id에서 searchWordId로 변경 (카멜 케이스 사용)
	private String searchWord; // 필드명을 search_word에서 searchWord로 변경 (카멜 케이스 사용)
	private String relationWord; // 필드명을 relation_word에서 relationWord로 변경 (카멜 케이스 사용)
	private Boolean relation;

	public int getSearchWordId() {
		return searchWordId;
	}

	public void setSearchWordId(int searchWordId) {
		this.searchWordId = searchWordId;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getRelationWord() {
		return relationWord;
	}

	public void setRelationWord(String relationWord) {
		this.relationWord = relationWord;
	}

	public Boolean getRelation() {
		return relation;
	}

	public void setRelation(Boolean relation) {
		this.relation = relation;
	}
}