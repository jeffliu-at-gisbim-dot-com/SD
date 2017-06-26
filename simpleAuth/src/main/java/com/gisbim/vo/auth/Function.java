package com.gisbim.vo.auth;

import com.gisbim.model.pri.Fun;

public class Function extends Fun{
	
	private static final long serialVersionUID = 1L;
	
	private Integer parentFunId;
	
	public Function() {
		super();
	}

	public Integer getParentFunId() {
		return parentFunId;
	}

	public void setParentFunId(Integer parentFunId) {
		this.parentFunId = parentFunId;
	}
	
}
