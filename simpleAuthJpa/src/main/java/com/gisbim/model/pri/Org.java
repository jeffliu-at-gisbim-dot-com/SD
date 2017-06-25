package com.gisbim.model.pri;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.gisbim.model.DbEntity;


/**
 * The persistent class for the org database table.
 * 
 */
@Entity
@Table(name="ORG", schema="PRI")
@NamedQuery(name="Org.findAll", query="SELECT o FROM Org o")
public class Org extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="org_code")
	private String orgCode;

	@Column(name="org_criteria1")
	private String orgCriteria1;

	@Column(name="org_criteria2")
	private String orgCriteria2;

	@Column(name="org_criteria3")
	private String orgCriteria3;

	@Column(name="org_name")
	private String orgName;

	@Column(name="org_type")
	private String orgType;

	//bi-directional many-to-one association to DataAuth
	@OneToMany(mappedBy="org")
	private List<DataAuth> dataAuths;

	//bi-directional many-to-one association to Org
	@ManyToOne
	@JoinColumn(name="parent_org_id")
	private Org org;

	//bi-directional many-to-one association to Org
	@OneToMany(mappedBy="org")
	private List<Org> orgs;

	//bi-directional many-to-one association to Service
	@OneToMany(mappedBy="org")
	private List<Service> services;

	public Org() {
	}

	public String getOrgCode() {
		return this.orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getOrgCriteria1() {
		return this.orgCriteria1;
	}

	public void setOrgCriteria1(String orgCriteria1) {
		this.orgCriteria1 = orgCriteria1;
	}

	public String getOrgCriteria2() {
		return this.orgCriteria2;
	}

	public void setOrgCriteria2(String orgCriteria2) {
		this.orgCriteria2 = orgCriteria2;
	}

	public String getOrgCriteria3() {
		return this.orgCriteria3;
	}

	public void setOrgCriteria3(String orgCriteria3) {
		this.orgCriteria3 = orgCriteria3;
	}

	public String getOrgName() {
		return this.orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgType() {
		return this.orgType;
	}

	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}

	public List<DataAuth> getDataAuths() {
		return this.dataAuths;
	}

	public void setDataAuths(List<DataAuth> dataAuths) {
		this.dataAuths = dataAuths;
	}

	public DataAuth addDataAuth(DataAuth dataAuth) {
		getDataAuths().add(dataAuth);
		dataAuth.setOrg(this);

		return dataAuth;
	}

	public DataAuth removeDataAuth(DataAuth dataAuth) {
		getDataAuths().remove(dataAuth);
		dataAuth.setOrg(null);

		return dataAuth;
	}

	public Org getOrg() {
		return this.org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public List<Org> getOrgs() {
		return this.orgs;
	}

	public void setOrgs(List<Org> orgs) {
		this.orgs = orgs;
	}

	public Org addOrg(Org org) {
		getOrgs().add(org);
		org.setOrg(this);

		return org;
	}

	public Org removeOrg(Org org) {
		getOrgs().remove(org);
		org.setOrg(null);

		return org;
	}

	public List<Service> getServices() {
		return this.services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	public Service addService(Service service) {
		getServices().add(service);
		service.setOrg(this);

		return service;
	}

	public Service removeService(Service service) {
		getServices().remove(service);
		service.setOrg(null);

		return service;
	}

}