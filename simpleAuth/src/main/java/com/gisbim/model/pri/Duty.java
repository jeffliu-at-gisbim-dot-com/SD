package com.gisbim.model.pri;

import java.io.Serializable;
import javax.persistence.*;

import com.gisbim.model.DbEntity;

import java.sql.Timestamp;


/**
 * The persistent class for the duty database table.
 * 
 */
@Entity
@Table(name="DUTY", schema="PRI")
@NamedQuery(name="Duty.findAll", query="SELECT d FROM Duty d")
public class Duty extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="valid_after")
	private Timestamp validAfter;

	@Column(name="valid_before")
	private Timestamp validBefore;

	//bi-directional many-to-one association to AppUser
	@ManyToOne
	@JoinColumn(name="user_id")
	private AppUser appUser;

	//bi-directional many-to-one association to AuthGroup
	@ManyToOne
	@JoinColumn(name="auth_group_id")
	private AuthGroup authGroup;

	public Duty() {
	}

	public Timestamp getValidAfter() {
		return this.validAfter;
	}

	public void setValidAfter(Timestamp validAfter) {
		this.validAfter = validAfter;
	}

	public Timestamp getValidBefore() {
		return this.validBefore;
	}

	public void setValidBefore(Timestamp validBefore) {
		this.validBefore = validBefore;
	}

	public AppUser getAppUser() {
		return this.appUser;
	}

	public void setAppUser(AppUser appUser) {
		this.appUser = appUser;
	}

	public AuthGroup getAuthGroup() {
		return this.authGroup;
	}

	public void setAuthGroup(AuthGroup authGroup) {
		this.authGroup = authGroup;
	}

}