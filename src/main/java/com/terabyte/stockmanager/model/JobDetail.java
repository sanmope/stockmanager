package com.terabyte.stockmanager.model;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;


@Entity
public class JobDetail {
	
	@Id @GeneratedValue
	private long id;
	String description;
	Calendar date;
	
	
	public JobDetail (String description){
		this.description = description;
		this.date = Calendar.getInstance();
	}


	public Calendar getDate() {
		return date;
	}


	public void setDate(Calendar date) {
		this.date = date;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	
}
