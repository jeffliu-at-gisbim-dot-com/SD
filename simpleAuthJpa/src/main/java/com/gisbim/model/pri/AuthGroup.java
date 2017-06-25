package com.gisbim.model.pri;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.gisbim.model.DbEntity;


/**
 * The persistent class for the auth_group database table.
 * 
 */
@Entity
@Table(name="auth_group", schema="PRI")
@NamedQuery(name="AuthGroup.findAll", query="SELECT a FROM AuthGroup a")
public class AuthGroup extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;


	@Column(name="auth_group_description")
	private String authGroupDescription;

	@Column(name="auth_group_name")
	private String authGroupName;

	@Column(name="auth_group_type")
	private String authGroupType;

	private String editable;

	//bi-directional many-to-one association to DataAuth
	@OneToMany(mappedBy="authGroup")
	private List<DataAuth> dataAuths;

	//bi-directional many-to-one association to Duty
	@OneToMany(mappedBy="authGroup")
	private List<Duty> duties;

	//bi-directional many-to-one association to FunAuth
	@OneToMany(mappedBy="authGroup")
	private List<FunAuth> funAuths;

	public AuthGroup() {
	}

	public String getAuthGroupDescription() {
		return this.authGroupDescription;
	}

	public void setAuthGroupDescription(String authGroupDescription) {
		this.authGroupDescription = authGroupDescription;
	}

	public String getAuthGroupName() {
		return this.authGroupName;
	}

	public void setAuthGroupName(String authGroupName) {
		this.authGroupName = authGroupName;
	}

	public String getAuthGroupType() {
		return this.authGroupType;
	}

	public void setAuthGroupType(String authGroupType) {
		this.authGroupType = authGroupType;
	}

	public String getEditable() {
		return this.editable;
	}

	public void setEditable(String editable) {
		this.editable = editable;
	}

	public List<DataAuth> getDataAuths() {
		return this.dataAuths;
	}

	public void setDataAuths(List<DataAuth> dataAuths) {
		this.dataAuths = dataAuths;
	}

	public DataAuth addDataAuth(DataAuth dataAuth) {
		getDataAuths().add(dataAuth);
		dataAuth.setAuthGroup(this);

		return dataAuth;
	}

	public DataAuth removeDataAuth(DataAuth dataAuth) {
		getDataAuths().remove(dataAuth);
		dataAuth.setAuthGroup(null);

		return dataAuth;
	}

	public List<Duty> getDuties() {
		return this.duties;
	}

	public void setDuties(List<Duty> duties) {
		this.duties = duties;
	}

	public Duty addDuty(Duty duty) {
		getDuties().add(duty);
		duty.setAuthGroup(this);

		return duty;
	}

	public Duty removeDuty(Duty duty) {
		getDuties().remove(duty);
		duty.setAuthGroup(null);

		return duty;
	}

	public List<FunAuth> getFunAuths() {
		return this.funAuths;
	}

	public void setFunAuths(List<FunAuth> funAuths) {
		this.funAuths = funAuths;
	}

	public FunAuth addFunAuth(FunAuth funAuth) {
		getFunAuths().add(funAuth);
		funAuth.setAuthGroup(this);

		return funAuth;
	}

	public FunAuth removeFunAuth(FunAuth funAuth) {
		getFunAuths().remove(funAuth);
		funAuth.setAuthGroup(null);

		return funAuth;
	}

}