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
 * The persistent class for the app_user database table.
 * 
 */
@Entity
@Table(name="app_user", schema="PRI")
@NamedQuery(name="AppUser.findAll", query="SELECT a FROM AppUser a")
public class AppUser extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String account;

	@Column(name="employee_no")
	private String employeeNo;

	@Column(name="encrypt_passwd")
	private String encryptPasswd;

	@Column(name="encrypt_type")
	private String encryptType;

	@Column(name="user_name")
	private String userName;

	//bi-directional many-to-one association to Duty
	@OneToMany(mappedBy="appUser")
	private List<Duty> duties;

	public AppUser() {
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getEmployeeNo() {
		return this.employeeNo;
	}

	public void setEmployeeNo(String employeeNo) {
		this.employeeNo = employeeNo;
	}

	public String getEncryptPasswd() {
		return this.encryptPasswd;
	}

	public void setEncryptPasswd(String encryptPasswd) {
		this.encryptPasswd = encryptPasswd;
	}

	public String getEncryptType() {
		return this.encryptType;
	}

	public void setEncryptType(String encryptType) {
		this.encryptType = encryptType;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Duty> getDuties() {
		return this.duties;
	}

	public void setDuties(List<Duty> duties) {
		this.duties = duties;
	}

	public Duty addDuty(Duty duty) {
		getDuties().add(duty);
		duty.setAppUser(this);

		return duty;
	}

	public Duty removeDuty(Duty duty) {
		getDuties().remove(duty);
		duty.setAppUser(null);

		return duty;
	}

}