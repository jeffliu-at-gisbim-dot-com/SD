package com.gisbim.model.pri;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.gisbim.model.DbEntity;


/**
 * The persistent class for the fun_auth database table.
 * 
 */
@Entity
@Table(name="fun_auth", schema="PRI")
@NamedQuery(name="FunAuth.findAll", query="SELECT f FROM FunAuth f")
public class FunAuth extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;


	private String operations;

	//bi-directional many-to-one association to AuthGroup
	@ManyToOne
	@JoinColumn(name="auth_group_id")
	private AuthGroup authGroup;

	//bi-directional many-to-one association to Fun
	@ManyToOne
	private Fun fun;

	public FunAuth() {
	}

	public String getOperations() {
		return this.operations;
	}

	public void setOperations(String operations) {
		this.operations = operations;
	}

	public AuthGroup getAuthGroup() {
		return this.authGroup;
	}

	public void setAuthGroup(AuthGroup authGroup) {
		this.authGroup = authGroup;
	}

	public Fun getFun() {
		return this.fun;
	}

	public void setFun(Fun fun) {
		this.fun = fun;
	}

}