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
 * The persistent class for the fun database table.
 * 
 */
@Entity
@Table(name="FUN", schema="PRI")
@NamedQuery(name="Fun.findAll", query="SELECT f FROM Fun f")
public class Fun extends DbEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="active_flag")
	private String activeFlag;

	@Column(name="boot_flag")
	private String bootFlag;

	@Column(name="fun_code")
	private String funCode;

	@Column(name="fun_name")
	private String funName;

	@Column(name="fun_path")
	private String funPath;

	@Column(name="fun_type")
	private String funType;

	private String layer;

	@Column(name="layer_seq")
	private String layerSeq;

	private String operations;

	//bi-directional many-to-one association to Fun
	@ManyToOne
	@JoinColumn(name="parent_fun_id")
	private Fun fun;

	//bi-directional many-to-one association to Fun
	@OneToMany(mappedBy="fun")
	private List<Fun> funs;

	//bi-directional many-to-one association to Service
	@ManyToOne
	private Service service;

	//bi-directional many-to-one association to FunAuth
	@OneToMany(mappedBy="fun")
	private List<FunAuth> funAuths;

	public Fun() {
	}

	public String getActiveFlag() {
		return this.activeFlag;
	}

	public void setActiveFlag(String activeFlag) {
		this.activeFlag = activeFlag;
	}

	public String getBootFlag() {
		return this.bootFlag;
	}

	public void setBootFlag(String bootFlag) {
		this.bootFlag = bootFlag;
	}

	public String getFunCode() {
		return this.funCode;
	}

	public void setFunCode(String funCode) {
		this.funCode = funCode;
	}

	public String getFunName() {
		return this.funName;
	}

	public void setFunName(String funName) {
		this.funName = funName;
	}

	public String getFunPath() {
		return this.funPath;
	}

	public void setFunPath(String funPath) {
		this.funPath = funPath;
	}

	public String getFunType() {
		return this.funType;
	}

	public void setFunType(String funType) {
		this.funType = funType;
	}

	public String getLayer() {
		return this.layer;
	}

	public void setLayer(String layer) {
		this.layer = layer;
	}

	public String getLayerSeq() {
		return this.layerSeq;
	}

	public void setLayerSeq(String layerSeq) {
		this.layerSeq = layerSeq;
	}
	
	public String getOperations() {
		return this.operations;
	}

	public void setOperations(String operations) {
		this.operations = operations;
	}

	public Fun getFun() {
		return this.fun;
	}

	public void setFun(Fun fun) {
		this.fun = fun;
	}

	public List<Fun> getFuns() {
		return this.funs;
	}

	public void setFuns(List<Fun> funs) {
		this.funs = funs;
	}

	public Fun addFun(Fun fun) {
		getFuns().add(fun);
		fun.setFun(this);

		return fun;
	}

	public Fun removeFun(Fun fun) {
		getFuns().remove(fun);
		fun.setFun(null);

		return fun;
	}

	public Service getService() {
		return this.service;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public List<FunAuth> getFunAuths() {
		return this.funAuths;
	}

	public void setFunAuths(List<FunAuth> funAuths) {
		this.funAuths = funAuths;
	}

	public FunAuth addFunAuth(FunAuth funAuth) {
		getFunAuths().add(funAuth);
		funAuth.setFun(this);

		return funAuth;
	}

	public FunAuth removeFunAuth(FunAuth funAuth) {
		getFunAuths().remove(funAuth);
		funAuth.setFun(null);

		return funAuth;
	}

}