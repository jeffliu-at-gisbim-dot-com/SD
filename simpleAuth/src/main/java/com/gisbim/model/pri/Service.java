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
 * The persistent class for the service database table.
 * 
 */
@Entity
@Table(name="SERVICE", schema="PRI")
@NamedQuery(name="Service.findAll", query="SELECT s FROM Service s")
public class Service extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;


	@Column(name="connect_frequency")
	private String connectFrequency;

	@Column(name="parameter_description")
	private String parameterDescription;

	@Column(name="service_key")
	private String serviceKey;

	@Column(name="service_key_password")
	private String serviceKeyPassword;

	@Column(name="service_name")
	private String serviceName;

	@Column(name="service_url")
	private String serviceUrl;

	//bi-directional many-to-one association to Fun
	@OneToMany(mappedBy="service")
	private List<Fun> funs;

	//bi-directional many-to-one association to Org
	@ManyToOne
	@JoinColumn(name="provider_id")
	private Org org;

	public Service() {
	}

	public String getConnectFrequency() {
		return this.connectFrequency;
	}

	public void setConnectFrequency(String connectFrequency) {
		this.connectFrequency = connectFrequency;
	}

	public String getParameterDescription() {
		return this.parameterDescription;
	}

	public void setParameterDescription(String parameterDescription) {
		this.parameterDescription = parameterDescription;
	}

	public String getServiceKey() {
		return this.serviceKey;
	}

	public void setServiceKey(String serviceKey) {
		this.serviceKey = serviceKey;
	}

	public String getServiceKeyPassword() {
		return this.serviceKeyPassword;
	}

	public void setServiceKeyPassword(String serviceKeyPassword) {
		this.serviceKeyPassword = serviceKeyPassword;
	}

	public String getServiceName() {
		return this.serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceUrl() {
		return this.serviceUrl;
	}

	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
	}

	public List<Fun> getFuns() {
		return this.funs;
	}

	public void setFuns(List<Fun> funs) {
		this.funs = funs;
	}

	public Fun addFun(Fun fun) {
		getFuns().add(fun);
		fun.setService(this);

		return fun;
	}

	public Fun removeFun(Fun fun) {
		getFuns().remove(fun);
		fun.setService(null);

		return fun;
	}

	public Org getOrg() {
		return this.org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

}