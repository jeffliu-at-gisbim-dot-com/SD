package com.gisbim.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class TimestampAdapter extends XmlAdapter<String, Date>{

	  private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

	public String marshal(Date v) throws Exception {
		if(v == null) return "9999-99-99 23:59:59.999";
        synchronized (dateFormat) {
            return dateFormat.format(v);
        }
    }

    @Override
    public Date unmarshal(String v) throws Exception {
        synchronized (dateFormat) {
        	if(v== null) v = "9999-99-99 23:59:59.999";
            return dateFormat.parse(v);
        }
    }
}
