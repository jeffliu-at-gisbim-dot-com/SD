package com.gisbim.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import org.apache.commons.lang.StringUtils;

@MappedSuperclass
@XmlRootElement
public abstract class DbEntity implements Serializable{
    private static final long serialVersionUID = 1L;
    
	@Id
	@Column(name="ID")
	@SequenceGenerator(name="COMMON_ID_GENERATOR",  sequenceName = "PRI.COMMON_ID_SEQ", initialValue=9999, allocationSize=1 )
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="COMMON_ID_GENERATOR")
	private Integer id;
	
	@Version
	@Column(name="operate_at")
    @Temporal(TemporalType.TIMESTAMP)
	private Date operateAt;
	
	@Size(max = 10)
	@Column(name="operate_by")
	private String operateBy;
	
	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@XmlAttribute  
	@XmlJavaTypeAdapter(TimestampAdapter.class) 
	public Date getOperateAt() {
		return this.operateAt;
	}

	public void setOperateAt(Date operateAt) {
		this.operateAt = operateAt;
	}
	
	public void setOperateAtTime(Long operateAtTime) {
		if(operateAtTime != null) {
			Date theDate = new Date();
			theDate.setTime(operateAtTime);
			this.setOperateAt(theDate);
		}
	}
	
	public Long getOperateAtTime() {
		if(this.getOperateAt() == null) {
			return 0L;
		}
		return this.getOperateAt().getTime();
		
	}
	
	public String getLastUpdate() {
		Date theMoment = getOperateAt();
		if(theMoment == null) {
			return StringUtils.EMPTY;
		}
		return new SimpleDateFormat( "yyyyMMdd" ).format(theMoment);
	}
	
	@XmlAttribute 
	public String getOperateBy() {
		return this.operateBy;
	}

	public void setOperateBy(String operateBy) {
		this.operateBy = operateBy;
	}
	
	
}
