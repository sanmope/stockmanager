package com.terabyte.stockmanager.model;

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
	Date date;
	
	
	public JobDetail (String description){
		this.description = description;
		this.date = new Date();
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getDescription() {
		this.date = new Date();
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	
}
