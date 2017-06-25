package com.gisbim.model.pri;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.gisbim.model.DbEntity;


/**
 * The persistent class for the data_auth database table.
 * 
 */
@Entity
@Table(name="data_auth", schema="PRI")
@NamedQuery(name="DataAuth.findAll", query="SELECT d FROM DataAuth d")
public class DataAuth extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="view_range")
	private String viewRange;

	//bi-directional many-to-one association to AuthGroup
	@ManyToOne
	@JoinColumn(name="auth_group_id")
	private AuthGroup authGroup;

	//bi-directional many-to-one association to Org
	@ManyToOne
	private Org org;

	public DataAuth() {
	}

	public String getViewRange() {
		return this.viewRange;
	}

	public void setViewRange(String viewRange) {
		this.viewRange = viewRange;
	}

	public AuthGroup getAuthGroup() {
		return this.authGroup;
	}

	public void setAuthGroup(AuthGroup authGroup) {
		this.authGroup = authGroup;
	}

	public Org getOrg() {
		return this.org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

}