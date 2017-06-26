package com.gisbim.model.pri;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.gisbim.model.DbEntity;


/**
 * The persistent class for the para database table.
 * 
 */
@Entity
@Table(name="PARA", schema="PRI")
@NamedQuery(name="Para.findAll", query="SELECT p FROM Para p")
public class Para extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="para_catalogue")
	private String paraCatalogue;

	@Column(name="para_i18n")
	private String paraI18n;

	@Column(name="para_name")
	private String paraName;

	@Column(name="para_value")
	private String paraValue;

	public Para() {
	}

	public String getParaCatalogue() {
		return this.paraCatalogue;
	}

	public void setParaCatalogue(String paraCatalogue) {
		this.paraCatalogue = paraCatalogue;
	}

	public String getParaI18n() {
		return this.paraI18n;
	}

	public void setParaI18n(String paraI18n) {
		this.paraI18n = paraI18n;
	}

	public String getParaName() {
		return this.paraName;
	}

	public void setParaName(String paraName) {
		this.paraName = paraName;
	}

	public String getParaValue() {
		return this.paraValue;
	}

	public void setParaValue(String paraValue) {
		this.paraValue = paraValue;
	}

}